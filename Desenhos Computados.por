programa
{
	inclua biblioteca Graficos --> g
	inclua biblioteca Util --> u
	//Desenhos Computados
	// - Triângulo(usando polígono)
	// - Retângulo(usando pontos)
	const inteiro LARGURA = 350, ALTURA = 350
	funcao desenhar_triangulo(
		inteiro x, inteiro y,
		inteiro x2, inteiro y2,
		inteiro x3, inteiro y3,
		logico preencher, inteiro cor){
		
		g.definir_cor(cor)
		inteiro triangulo_pontos[][] = {
			{x,y},
			{x2,y2},
			{x3,y3},
			{x,y}
		}
		g.desenhar_poligono(triangulo_pontos, preencher)
	}
	//TODO> implementar rotação em graus dos pontos do triângulo
	funcao desenhar_triangulo(
		inteiro cX,inteiro cY,
		inteiro raio,/*inteiro rotacaoGraus,*/
		logico preencher,inteiro cor){
		inteiro x  = cX,       y  = cY - raio,
				x2 = cX + raio,y2 = cY + raio,
				x3 = cX - raio,y3 = y2
		desenhar_triangulo(
			x, y,
			x2,y2,
			x3,y3,
			preencher,cor)
	}
	funcao desenhar_retangulo(inteiro x,inteiro y,inteiro x2,inteiro y2,logico preencha){
		inteiro X,Y,tmp
		// Troca (n > n2)
		se (x > x2) {
			tmp = x
			x = x2
			x2 = tmp
		}
		se (y > y2) {
			tmp = y
			y = y2
			y2 = tmp
		}
		se (preencha) {
			para(Y = y; Y < y2; Y++){
				para(X = x; X < x2; X++){
					g.desenhar_ponto(X,Y)
				}
			}
		} senao {
			para(Y = y; Y < y2;Y++){
				g.desenhar_ponto(x,Y)
				g.desenhar_ponto(x2,Y)
			}
			para(X = x; X < x2; X++){
				g.desenhar_ponto(X,y)
				g.desenhar_ponto(X,y2)
			}
		}
	}
	funcao inicio ()
	{
		g.iniciar_modo_grafico(falso)
		g.definir_dimensoes_janela(LARGURA, ALTURA)
		g.definir_titulo_janela("Desenhos Computados(Pontos e Polígono)")
		enquanto (verdadeiro) {
			g.definir_cor(0)
			g.limpar()
			
			g.definir_cor(0x00ffff)
			desenhar_retangulo(10,10,100,100, verdadeiro)
			desenhar_retangulo(10, 130, 100, 300, falso)
			desenhar_triangulo(LARGURA - 100, ALTURA / 2, 100, verdadeiro, g.COR_VERDE)
			
			g.renderizar()
			u.aguarde(16)
		}
	}
}
