programa
{
	// Simulador de Pedra, Papel e Tesoura(A Fazer/TODO)
	//A Fazer>
	//	Terminar e fazer funcionar de alguma forma(pode precisar reprogramar tudo de novo com novos mapas e conceitos)
	inclua biblioteca Graficos --> g
	inclua biblioteca Util --> u
	const inteiro largura = 500, altura = 500
	//500 / 15 arredondado = ~22×22 = 484
	inteiro mapa[484]
	const inteiro BLOCO = 15
	const inteiro DLB = largura - BLOCO, DAB = altura - BLOCO
	const inteiro BL = DLB / BLOCO, BA = DAB / BLOCO
	const inteiro VELO[] = { -BLOCO, 0, BLOCO }
	const cadeia PEDRA = "🪨", PAPEL = "📄", TESOURA = "✂️"
	inteiro pedras[10*2], //10 itens, ×2 por causa das coordenadas x,y
			papeis[20],
			tesouras[20]
	// 10 Pedras VS 10 Papéis VS 10 Tesouras
	inteiro TAMANHO = u.numero_elementos(pedras)
	inteiro T = TAMANHO - 1
	inteiro i,j, x, y
	funcao randomizar(){
		para(i = 0; i < T; i+=2){
			inteiro iX = i, iY = i+1
			pedras[iX] = u.sorteia(0,BL) * BLOCO
			pedras[iY] = u.sorteia(0,BA) * BLOCO
			papeis[iX] = u.sorteia(0,BL) * BLOCO
			papeis[iY] = u.sorteia(0,BA) * BLOCO
			tesouras[iX] = u.sorteia(0,BL) * BLOCO
			tesouras[iY] = u.sorteia(0,BA) * BLOCO
		}
	}
	funcao logico colidiu(inteiro c,inteiro a[],inteiro b[]){
		retorne a[c]==b[c] ou a[c+1]==b[c+1]
	}
	// x,y == x2,y2
	funcao verificarBatalhas(){
		para(i=0;i<T;i+=2){
			se(colidiu(i,pedras,papeis)){
				pedras[i]=-1
			}
		}
	}
	funcao inicio ()
	{
		g.iniciar_modo_grafico(falso)
		g.definir_titulo_janela("Simulador Pedra, Papel e Tesoura")
		g.definir_dimensoes_janela(largura,altura)
		g.definir_tamanho_texto(BLOCO)
		randomizar()
		enquanto(verdadeiro){
			g.definir_cor(g.COR_BRANCO)
			g.limpar()
			/*g.desenhar_texto(0,0,PEDRA)
			g.desenhar_texto(15,0,PAPEL)
			g.desenhar_texto(0,30,TESOURA)*/
			para(i = 0; i < T; i+=2){
				j = i + 1
				x = pedras[i]
				y = pedras[j]
				se(x==-1){
						
				} senao{
				g.desenhar_texto(x,y, PEDRA)
				pedras[i]+=VELO[u.sorteia(0,2)]
				pedras[j]+=VELO[u.sorteia(0,2)]
				//Colisões com as paredes
				se(pedras[i] < 0)
					pedras[i] = 0
				se(pedras[j] < 0)
					pedras[j] = 0
				se(pedras[i] >= DLB)
					pedras[i] = DLB
				se(pedras[j] >= DAB)
					pedras[j] = DAB
				}
			}
			para(i = 0; i < T; i+=2){
				j = i + 1
				x = papeis[i]
				y = papeis[j]
				g.desenhar_texto(x,y, PAPEL)
				papeis[i]+=VELO[u.sorteia(0,2)]
				papeis[j]+=VELO[u.sorteia(0,2)]
				se(papeis[i] < 0)
					papeis[i] = 0
				se(papeis[j] < 0)
					papeis[j] = 0
				se(papeis[i] >= DLB)
					papeis[i] = DLB
				se(papeis[j] >= DAB)
					papeis[j] = DAB
			}
			para(i = 0; i < T; i+=2){
				j = i + 1
				x = tesouras[i]
				y = tesouras[j]
				g.desenhar_texto(x,y, TESOURA)
				tesouras[i]+=VELO[u.sorteia(0,2)]
				tesouras[j]+=VELO[u.sorteia(0,2)]
				se(tesouras[i] < 0)
					tesouras[i] = 0
				se(tesouras[j] < 0)
					tesouras[j] = 0
				se(tesouras[i] >= DLB)
					tesouras[i] = DLB
				se(tesouras[j] >= DAB)
					tesouras[j] = DAB
			}
			g.definir_cor(g.COR_PRETO)
			g.desenhar_texto(largura / 4 + 20,altura / 2-BLOCO,"⚠️ AVISO ⚠️")
			g.desenhar_texto(largura / 7, altura / 2,"SIMULADOR NÃO TERMINADO AINDA")
			g.desenhar_texto(largura / 4, altura / 2+BLOCO,"NÃO FUNCIONA!!!")
			
			g.renderizar()
			u.aguarde(60)
		}
	}
}
