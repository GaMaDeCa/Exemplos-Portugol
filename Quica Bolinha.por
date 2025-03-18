programa
{
	inclua biblioteca Graficos --> g
	inclua biblioteca Mouse --> m
	inclua biblioteca Texto --> t
	inclua biblioteca Util --> u
	// Quica Bola Aleatória
	//Ao segurar na tela as cores mudam e a velocidade
	//da bola muda(vx a vy), mudando a direção também,
	//esse código é usado em jogos do estilo "Brick Breakers"
	//(Quebra Blocos), como Arkanoid, Brick Breaker e Many Bricks.
	const inteiro FRAME_RATE_PADRAO_ANDROID_MS=16
	funcao desenharCirculo(inteiro centroX,inteiro centroY,inteiro raio,logico preencher,inteiro cor){
		g.definir_cor(cor)
		g.desenhar_elipse(centroX-raio,centroY-raio,raio*2,raio*2,preencher)
	}
	funcao atualizarControles(){
		se(m.algum_botao_pressionado()){
			randomizar()
			u.aguarde(1000)
		}
	}
	funcao atualizarLogica()
	{
		cx+=vx
		cy+=vy
		
		//Colisões na parede
		//laterais direta e esquerda(horizontal)
		se(cx>=largura ou cx<=0){
			atualizarQuicadas( )
			//Multiplicar por -1 inverte a direção
			vx*=-1
			cx+=vx
		}
		//lados cima e baixo(vertical)
		se(cy>=altura ou cy<=0){
			atualizarQuicadas()
			vy*=-1
			cy+=vy
		}
	}
	funcao atualizarGraficos()
	{
		desenharCirculo(cx,cy,r,verdadeiro,COR_BOLA)
	}
	inteiro largura=300,altura=350
	inteiro COR_BOLA=g.COR_VERMELHO,COR_FUNDO=g.COR_PRETO
	//Posição do centro x e y e raio do círculo(raio=r)
	inteiro cx=10,cy=10,r=10
	//Velocidade do círculo x e y(somado as coordenadas do círculo)
	inteiro vx=10,vy=10
	
	//Deixar os valores aleatórios
	funcao randomizar(){
		inteiro CORES[]={
			g.COR_VERMELHO,
			g.COR_AMARELO,
			g.COR_AZUL,
			0x00ffff, //Ciano(RRGGBB)
			g.COR_VERDE,
			0xff00ff, //Magenta
			0xffa800, //Laranja
			g.COR_BRANCO,//FFFFFF
			0x808080, //Cinza
			g.COR_PRETO//000000
		}
		vx=u.sorteia(1,15)
		vy=u.sorteia(1,15)
		
		r=u.sorteia(3,35)
		
		COR_BOLA=escolherVetor(CORES)
		COR_FUNDO=escolherVetor(CORES)
		enquanto(COR_BOLA==COR_FUNDO){
			COR_BOLA=escolherVetor(CORES)
		}
	}
	funcao inteiro escolherVetor(inteiro vetor[]){
		retorne vetor[u.sorteia(0,u.numero_elementos(vetor)-1)]
	}
	funcao logico talvez(){
		retorne u.sorteia(0,1)==1
	}
	cadeia TITULO="Quica Bola Aleatória(Quicadas=X)"
	inteiro quicadas=0
	funcao atualizarQuicadas(){
		g.definir_titulo_janela(t.substituir(TITULO,"X",""+quicadas))
		quicadas++
	}
	funcao inicio()
	{
		//Configuração inicial, vc pode colocar en um
		//método separado antes do loop, como "AoIniciar"
		g.iniciar_modo_grafico(falso)
		g.definir_dimensoes_janela(largura,altura)
		atualizarQuicadas()
		se(talvez())
			randomizar()
		
		cx=u.sorteia(0,largura)
		cy=u.sorteia(0,altura)
		enquanto(verdadeiro)
		{
			atualizarControles()
			// Pinta o fundo de verde
			g.definir_cor(COR_FUNDO)
			g.limpar()
		
			atualizarLogica()
			atualizarGraficos()
			
			// desenha na tela tudo
			g.renderizar()
			u.aguarde(FRAME_RATE_PADRAO_ANDROID_MS)
		}
	}
}