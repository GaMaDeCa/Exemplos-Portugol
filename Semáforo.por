programa
{
	inclua biblioteca Graficos --> g
	inclua biblioteca Util --> u
	//Semáforo
	
	/*
	TODO:
		- Melhorar, código confuso demais.
		- Adicionar cores oficiais de um semáforo real.
		- Configurar tempo correto de transição entre os semáforos.
	*/
	logico V = verdadeiro, F = falso
	inteiro largura = 220, altura = 660
	inteiro COR_CAIXA_FUNDO = g.COR_BRANCO, COR_CAIXA_LINHAS = g.COR_PRETO,
			COR_SEMAFORO_VERMELHO = g.COR_VERMELHO, COR_SEMAFORO_AMARELO = g.COR_AMARELO, COR_SEMAFORO_VERDE = g.COR_VERDE,
			COR_SEMAFORO_DESLIGADO = 0x888888, COR_SEMAFORO_DESLIGADO_VERMELHO = 0x880000, COR_SEMAFORO_DESLIGADO_AMARELO = 0x888800, COR_SEMAFORO_DESLIGADO_VERDE = 0x008800
	inteiro SEMAFORO_1 = COR_SEMAFORO_DESLIGADO_VERMELHO,
			SEMAFORO_2 = COR_SEMAFORO_DESLIGADO_AMARELO,
			SEMAFORO_3 = COR_SEMAFORO_DESLIGADO_VERDE
	inteiro S = 0
	inteiro ATENCAO = 2, LIBERADO = 1, PARE = 0
	funcao atualizarLogicaSemaforos(){
		u.aguarde(2000)
		/*se (SEMAFORO_3 == COR_SEMAFORO_VERDE)
		{
			SEMAFORO_3 = COR_SEMAFORO_DESLIGADO_VERDE
			SEMAFORO_2 = COR_SEMAFORO_AMARELO
			g.definir_titulo_janela("Atenção")
		} senao
		{
			se (SEMAFORO_1 == COR_SEMAFORO_VERMELHO)
			{
				SEMAFORO_1 = COR_SEMAFORO_DESLIGADO_VERMELHO
				SEMAFORO_3 = COR_SEMAFORO_VERDE 
				g.definir_titulo_janela("Liberado")
			} senao
			{
				SEMAFORO_2 = COR_SEMAFORO_DESLIGADO_AMARELO
				SEMAFORO_1 = COR_SEMAFORO_VERMELHO
				g.definir_titulo_janela("Pare")
			}
		}*/
		escolha(S){
			caso LIBERADO:
				SEMAFORO_3 = COR_SEMAFORO_DESLIGADO_VERDE
				SEMAFORO_2 = COR_SEMAFORO_AMARELO
				g.definir_titulo_janela("Atenção")
				pare
			caso ATENCAO:
				SEMAFORO_2 = COR_SEMAFORO_DESLIGADO_AMARELO
				SEMAFORO_1 = COR_SEMAFORO_VERMELHO
				g.definir_titulo_janela("Pare")
				pare
			caso PARE:
				SEMAFORO_1 = COR_SEMAFORO_DESLIGADO_VERMELHO
				SEMAFORO_3 = COR_SEMAFORO_VERDE 
				g.definir_titulo_janela("Liberado")
				pare
		}
		S = (S + 1) % 3
	}
	funcao inicio ()
	{
		g.iniciar_modo_grafico(falso)
		g.definir_titulo_janela("Semáforo")
		g.definir_dimensoes_janela(largura, altura)
		/*g.entrar_modo_tela_cheia()
		largura = g.largura_janela()
		altura = g.altura_janela()*/
		SEMAFORO_1 = COR_SEMAFORO_VERMELHO
		enquanto(V){
			// Fundo
			g.definir_cor(COR_SEMAFORO_DESLIGADO)
			g.limpar()
			// Luzes programadas do semáforo
			inteiro sY = altura / 3, cY = 0
			g.definir_cor(SEMAFORO_1)
			g.desenhar_elipse(0, cY, largura, sY, V)
			cY += sY
			g.definir_cor(SEMAFORO_2)
			g.desenhar_elipse(0, cY, largura, sY, V)
			cY += sY
			g.definir_cor(SEMAFORO_3)
			g.desenhar_elipse(0, cY, largura, sY, V)
			
			// 3 Retângulos com Círculos dentro
			g.definir_cor(COR_CAIXA_LINHAS)
			cY = 0
			g.desenhar_retangulo(0,cY, largura, sY, F, F)
			g.desenhar_elipse(0, cY, largura, sY, F)
			cY += sY
			g.desenhar_retangulo(0,cY, largura, sY, F, F)
			g.desenhar_elipse(0, cY, largura, sY, F)
			cY += sY
			g.desenhar_retangulo(0,cY, largura, sY, F, F)
			g.desenhar_elipse(0, cY, largura, sY, F)
			
			g.renderizar()
			atualizarLogicaSemaforos()
			u.aguarde(16)
		}
		
	}
}