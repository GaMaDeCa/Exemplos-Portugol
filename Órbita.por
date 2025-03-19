programa
{
	inclua biblioteca Graficos --> g
	inclua biblioteca Mouse --> m
	inclua biblioteca Matematica --> Math
	inclua biblioteca Util --> u
	// Exemplo de Órbita(Seno e cosseno)
	//Um exemplo de círculo orbitando em relação
	//a um ponto central usando seno e cosseno
	funcao defTitulo(cadeia titulo){
		g.definir_titulo_janela(titulo)
	}
	//Desenhar círculo
	//Com pontos centrais X e Y e raio(tamanho × 4)
	funcao desCirc(
		real X_central,real Y_central,
		real raio_circulo,
		logico preencher,inteiro cor)
	{
		inteiro diametro = raio_circulo * 2
		g.definir_cor(cor)
		g.desenhar_elipse(
			X_central - raio_circulo,
			Y_central - raio_circulo,
			diametro, diametro, preencher
		)
	}
	real pontoX, pontoY, angulo = 0
	const real VELOCIDADE_ANGULAR = 0.05, PI2 = Math.PI * 2
	const real raio_orbital = 140
	funcao real sen(real numero){retorne Math.seno(numero)}
	funcao real cos(real numero){retorne Math.cosseno(numero)}
	//Usando as variáveis disponíveis essa função
	//computa a posição x e y das bordas de um círculo
	//com base no ângulo(a velocidade angular altera a
	//posição da órbita), vc deve somar essas coordenadas
	//com alguma outra coordenada central do desenho(círculo)
	funcao computar()
	{
		//Calcular os pontos no plano cartesiano
		pontoX = raio_orbital * sen(angulo)
		pontoY = raio_orbital * cos(angulo)
		angulo = (angulo + VELOCIDADE_ANGULAR) % PI2
	}
	
	const inteiro largura = 400, altura = 600
	
	const inteiro mLarg = largura / 2, // Meio da tela horizontal
				  mAlt = altura / 2	   // Meio da tela vertical
	const real menorDimensao = Math.menor_numero(largura, altura)
	const real tamanho_texto = menorDimensao / 30
	//raio = menor(largura ou altura) ÷ 10
	// raio é 10 vezes menor que o tamanho mínimo
	// da tela.
	real raio = menorDimensao / 12
	real cX = mLarg, cY = mAlt
	const inteiro COR_FUNDO = g.COR_PRETO,
				  COR_CIRCULO = g.COR_AZUL,
				  COR_LINHA_ORBITA = g.COR_VERMELHO,
				  COR_PONTO = g.COR_VERDE, COR_LINHA = g.COR_AMARELO
	inteiro VELOCIDADE_TEMPO = 16
	funcao inicio ()
	{
		g.iniciar_modo_grafico(falso)
		g.definir_dimensoes_janela(largura, altura)
		defTitulo("Exemplo de Órbita(Seno e Cosseno)")
		g.definir_tamanho_texto(tamanho_texto)
		enquanto(verdadeiro){
			g.definir_cor(COR_FUNDO)
			g.limpar()
			
			computar()
			g.definir_cor(COR_CIRCULO)
			
			real x = cX + pontoX, y = cY + pontoY
			//desCirc = Ciírculos
			//Orbita vermelha(linha)
			desCirc(cX,cY,raio_orbital,falso,COR_LINHA_ORBITA)
			
			//Círculo Azul
			desCirc(x,y,raio,verdadeiro,COR_CIRCULO)
		
			//g.definir_cor(COR_PONTO)
			//g.desenhar_ponto(x,y)
			
			//Os dois pontos são 10 vezes menores
			
			//Ponto do círculo
			desCirc(x,y,raio / 10,verdadeiro,COR_PONTO)
			
			//Ponto da órbita
			desCirc(cX,cY,raio_orbital / 10,verdadeiro,COR_LINHA_ORBITA)
			
			//Linha que liga os centros dos circulos
			g.definir_cor(COR_LINHA)
			g.desenhar_linha(x,y,cX,cY)
			
			//Desenha os textos informativos na tela
			g.definir_cor(COR_LINHA_ORBITA)
			g.desenhar_texto(6,tamanho_texto,"Coordenadas centrais e raio da órbita: x = "+cX+", y = "+cY)
			g.desenhar_texto(6,tamanho_texto*2,"Raio da órbita "+raio_orbital)
			g.desenhar_texto(6,tamanho_texto*3,"Author: github.com/GaMaDeCa")
			g.desenhar_texto(6,tamanho_texto*5,"Segure na tela para diminuir a velocidade da animação.")
			g.definir_cor(COR_PONTO)
			g.desenhar_texto(1, altura-tamanho_texto*7, "Ponto X(Seno): "+pontoX)
			g.desenhar_texto(1, altura-tamanho_texto*6, "Ponto Y(Cosseno): "+pontoY)
			g.desenhar_texto(1, altura-tamanho_texto*5, "Ângulo: "+((angulo/PI2)*360))//Converte para a representação em 360°
			g.definir_cor(COR_CIRCULO)
			g.desenhar_texto(1, altura-tamanho_texto*3, "Coordenadas do Círculo Azul de raio "+raio)
			g.desenhar_texto(6, altura-tamanho_texto*2, "x = "+x+",\t\t\ty = "+y)
			
			g.renderizar()
			//Ao pressionar a velocidade de cada frame reduz
			//até o limite de 2 segundos por frame, ao soltar
			//é voltado a velocidade de 0.016 segundos(16 milissegundos)
			se(m.algum_botao_pressionado()){
				se(VELOCIDADE_TEMPO<2000)
					VELOCIDADE_TEMPO+=20
			}senao{
				se(VELOCIDADE_TEMPO!=16)
					VELOCIDADE_TEMPO-=200
				se(VELOCIDADE_TEMPO<16)
					VELOCIDADE_TEMPO=16
			}
			u.aguarde(VELOCIDADE_TEMPO)
		}
	}
}