programa
{
	inclua biblioteca Graficos --> g
	inclua biblioteca Mouse --> m

	inteiro COR_FUNDO = g.COR_BRANCO,
			COR_PINCEL = g.COR_VERMELHO

	//Posição X e Y do pincel e tamanho
	inteiro pX = 0, pY = 0,
			pTamanho = 5
	
	// Largura e Altura do quadro		
	inteiro largura = 400, altura = 400
	
	funcao desenhar_circulo(inteiro cX, inteiro cY, inteiro raio, logico preencher){
		inteiro diametro = raio * 2
		g.desenhar_elipse(cX-raio, cY-raio, diametro, diametro, preencher)
	}
	funcao inicio()
	{
		g.iniciar_modo_grafico(falso)
		g.definir_titulo_janela("Portugol Paint")
		g.definir_dimensoes_janela(largura, altura)
		g.definir_cor(COR_FUNDO)
		g.limpar()
		enquanto(verdadeiro){
			se (m.algum_botao_pressionado()){
				g.definir_cor(COR_PINCEL)
				pX = m.posicao_x()
				pY = m.posicao_y()
				desenhar_circulo(pX,pY,pTamanho,verdadeiro)
			}
			
			g.renderizar()
		}
	}
}

