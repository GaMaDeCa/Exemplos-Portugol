programa
{
	inclua biblioteca Graficos --> g
	inclua biblioteca Mouse --> m
	inclua biblioteca Util --> u
	// Gira Garrafa
	// Por GaMaDeCa
	
	//Imagens de:
	// https://github.com/mihirdev7/Bottle_Game
	const inteiro LARGURA = 360, ALTURA = 360
	const inteiro mLarg = LARGURA / 2, mAlt = ALTURA / 2
	const inteiro Larg6 = LARGURA / 6, mAlt2 = mAlt / 2
	const cadeia URL_IMAGEM_FUNDO = "https://raw.githubusercontent.com/mihirdev7/Bottle_Game/refs/heads/main/app/src/main/res/drawable/woodimg.png",
				 URL_IMAGEM_GARRAFA = "https://raw.githubusercontent.com/mihirdev7/Bottle_Game/refs/heads/main/app/src/main/res/drawable/bottle.png"
	inteiro IMG_FUNDO,IMG_GARRAFA
	funcao carregar_recursos(){
		//Endereço temporário
		inteiro tmp
		tmp = g.carregar_imagem(URL_IMAGEM_FUNDO)
		IMG_FUNDO = g.redimensionar_imagem(tmp, LARGURA, ALTURA, verdadeiro)
		g.liberar_imagem(tmp)
		
		tmp = g.carregar_imagem(URL_IMAGEM_GARRAFA)
		IMG_GARRAFA = g.redimensionar_imagem(tmp, Larg6, mAlt, verdadeiro)
		g.liberar_imagem(tmp)
	}
	inteiro rotacao = 0
	funcao inicio ()
	{
		g.iniciar_modo_grafico(falso)
		g.definir_titulo_janela("Gira Garrafa")
		g.definir_dimensoes_janela(LARGURA, ALTURA)
		g.definir_tamanho_texto(30)
		carregar_recursos()
		enquanto(verdadeiro){
			g.definir_cor(g.COR_VERDE)
			g.limpar()
			
			g.desenhar_imagem(0, 0, IMG_FUNDO)
			
			se (m.algum_botao_pressionado())
				rotacao = (rotacao + u.sorteia(30,60)) % 360
			senao
				g.desenhar_texto(5, mAlt2/2, "Toque para girar a garrafa")
			g.definir_rotacao(rotacao)
			g.desenhar_imagem(mLarg-(Larg6/2), mAlt2, IMG_GARRAFA)
			g.definir_rotacao(0)
			
			g.renderizar()
			u.aguarde(33)
		}
		
	}
}