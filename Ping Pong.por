programa
{
	inclua biblioteca Graficos --> g
	inclua biblioteca Mouse --> m
	inclua biblioteca Util --> u
	const inteiro LARGURA = 400, ALTURA = 720
	const inteiro L2 = LARGURA / 2, A2 = ALTURA / 2,
				  L9 = LARGURA / 9, A9 = ALTURA / 9
	// Ping Pong
	
	inteiro pontosJog,pontosRob
	// Mouse X
	real mX
	
	const real blocoLarg = 80, blocoAlt = 20, sep = 20
	
	inteiro mover, velocidade = 16
	// Jogador X, Y
	real pX = L2 - blocoLarg/2, pY = ALTURA - L9
	// Robô X, Y
	real rX = L2 - blocoLarg/2, rY = L9
	
	// Bola X, Y e raio
	real bX = L2, bY = A2, bR = L9/1.5
	real bD = bR * 2, bXV = velocidade / 2, bYV = velocidade / 2
	funcao logico sortear(){
		retorne u.sorteia(0,1)==1
	}
	funcao bolaAleatoria(){
		se (sortear()){
			bXV *= -1
		}
		se (sortear()) {
			bYV *= -1
		}
	}
	funcao resetar(){
		bX = u.sorteia(bD, LARGURA - bD)
		bY = A2
		bolaAleatoria()
	}
	//A ideia original do funcionamento do robô não funcionou
	//devido alguns problemas técnicos, foi implementado um bot
	//na dificuldade impossível ao invés disso.
	funcao robo(){
		rX = bX - blocoLarg/2
		//se quiser diminuir a dificuldade
		//apaque o rX = ... acima e substitua pelo
		//abaixo descomentando ele:
		// Dificuldade: aleatória
		//rX = u.sorteia(0,LARGURA-blocoLarg)
		// Dificuldade: espelho
		//rX = pX
		// Dificuldade: fácil
		//rX = L2-blocoLarg/2
		se (rX < 0)
			rX = 0
		se (rX > LARGURA - blocoLarg)
			rX = LARGURA - blocoLarg
	}
	funcao logica(){
		mover = 0
		se (m.algum_botao_pressionado()) {
			mX = m.posicao_x()
			se (mX < L2) {
				mover = -velocidade
			} senao {
				mover = velocidade
			}
		}
		se (mover != 0) {
			pX+=mover
			se (pX < 0)
				pX = 0
			se (pX > LARGURA - blocoLarg)
				pX = LARGURA - blocoLarg
		}
	
		se (bX-bR < 0 ou bX-bR> LARGURA - bD){
			bXV *= -1
			bX += bXV
		}
		se (bY+bR > pY e (bX > pX e bX < pX+blocoLarg)){
			se (bYV > 0){
				bYV*=-1
				bY += bYV
			}
		}
		se (bY < rY e (bX > rX e bX < rX+blocoLarg)){
			se (bYV < 0){
				bYV*=-1
				bY += bYV
			}
		}
		se (bY-bR < 0){
			pontosJog++
			resetar()
		}
		se (bY-bR > ALTURA - bD){
			pontosRob++
			resetar()
		}
		bX += bXV
		bY += bYV
		
		robo()
	}
	const inteiro COR_FUNDO = 0,
				  COR_QUADRA = g.criar_cor(255,255,0),
				  COR_RAQUETES = 0x00ff00,
				  COR_BOLINHA = 0x000f00 ^ 0xff
	funcao graficos(){
		g.definir_cor(COR_QUADRA)
		//Quadra
		g.desenhar_linha(L2,0,L2,ALTURA)
		g.desenhar_linha(0,A2,LARGURA,A2)
		g.desenhar_elipse(/*bX-bR*/L2-(A9/2),A2-(A9/2),A9,A9,falso)
		//Placar
		g.desenhar_texto(0,A2-A9,"Placar: "+pontosJog+" X "+ pontosRob)
		
		g.definir_cor(COR_RAQUETES)
		//Jogador
		g.desenhar_retangulo(pX,pY-sep,blocoLarg,blocoAlt,falso,verdadeiro)
		//Robô
		g.desenhar_retangulo(rX, rY, blocoLarg, blocoAlt,falso, verdadeiro)
		
		g.definir_cor(COR_BOLINHA)
		//Bolinha	
		g.desenhar_elipse(bX-bR,bY-bR,bD,bD, verdadeiro)
	}
	funcao inicio ()
	{
		g.iniciar_modo_grafico(falso)
		g.definir_dimensoes_janela(LARGURA, ALTURA)
		g.definir_titulo_janela("Ping Pong")
		g.entrar_modo_tela_cheia()
		resetar()
		pontosJog = 0
		pontosRob = 0
		enquanto (verdadeiro) {
			g.definir_cor(COR_FUNDO)
			g.limpar()
			
			//Mecanismo de Jogo padrão
			//Atualiza em cada loop(iteração)
			logica()
			graficos()
			
			g.renderizar()
			u.aguarde(16)
		}
	}
}