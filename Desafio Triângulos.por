programa
{
	inclua biblioteca Texto
	inclua biblioteca Util
	// Desafio de Imprimir Triângulos
	
	//Usando funções de multiplicação de caracteres
	//e juntar textos.
	funcao inicio (){
		inteiro tamanho=6,c=1
		cadeia car="*",espacos=" "
		exibir("Triângulo:\n")
		para(;c<tamanho+1;c++)
			exibir(
				mulCad(espacos,(tamanho-c))+
				juntaCad(espacos,mulCad(car,c))
			)
		exibir("\nTriângulo Invertido:\n")
		para(c=tamanho;c>0;c--)
			exibir(
				mulCad(espacos,(tamanho-c))+
				juntaCad(espacos,mulCad(car,c))
			)
		
		exibir("\nExtra:\n Tabuleiro de Xadrez(ou damas, tamanho 8×8=64):")
		car="⬜"
		espacos="⬛" //"  ", 2 espaços funciona também
		inteiro largura=8,altura=8
		//Com código de criação de mapas também(secreto, bloqueado)
		cadeia mapa[altura][largura]
		para(inteiro y=0;y<altura;y++){
			para(inteiro x=0;x<largura;x++){
				cadeia bloco=car
				//se o número for par
				se(x%2==0)
					bloco=espacos
				//senao... bloco=car.... apagado
				escreva(bloco)
				mapa[y][x]=bloco
			}
			exibir("")
			//Trocar as duas variáveis(car⇄espacos)
			cadeia temp=car
			car=espacos
			espacos=temp
		}
		
		/* Descomente daqui...
		//Adicionar um personagem(⚪ ou  ⚫ ) ao mapa
		//em alguma posição aleatória:
		cadeia personagem="⚪"
		se(Util.sorteia(0,1)==0)
			personagem="⚫"
		mapa
		 [Util.sorteia(0,altura-1)]//y
		 [Util.sorteia(0,largura-1)]//x
		 =personagem
		inteiro px,py
		//Imprimir mapa(secreto)
		exibir("\n\nMapa Secreto(desbloqueado só pra programadores):\n")
		para(inteiro y=0;y<altura;y++){
			para(inteiro x=0;x<largura;x++){
				escreva(mapa[y][x])
				se(mapa[y][x]==personagem){
					px=x
					py=y
				}
			}
			exibir("")
		}
		exibir("Personagem \""+personagem+"\" está na posição:\n x="+px+"\n y="+py)
		
		...Até aqui*/
		
		/*Esse código de mapa é usado em diversos jogos
		entre diversos outros algoritimos, ele se destaca
		pela facilidade de detectar colisões, já que é só 
		verificar se um "objeto de jogo" está na mesma posição
		que o outro, exemplo(jogador(j) colidiu com bomba(b)):
		
		se(jx==bx e jy==by)
			booom("tira 2 de vida do jogador")
		*/
	}
	//mulCad = Multiplicar Cadeia(Texto)
	//mulCad("ABC",2) == "ABCABC"
	
	//Semelhante a função "ABC"*2 do Python
	funcao cadeia mulCad(cadeia cad,inteiro qto){
		cadeia mCad=""
		para(inteiro i=0;i<qto;i++)
			mCad+=cad
		retorne mCad
	}
	//juntaCad = Juntar Cadeia(Texto)
	//juntaCad("-","ABC") == "A-B-C"
	
	//Semelhante ao "-".join("ABC") do Python
	funcao cadeia juntaCad(cadeia junta,cadeia texto){
		cadeia juntado=""
		inteiro tamanho=Texto.numero_caracteres(texto)-1,i=0
		se(tamanho==-1)
			retorne juntado
		para(;i<tamanho;i++)
			juntado+=Texto.obter_caracter(texto,i)+junta
		retorne juntado+Texto.obter_caracter(texto,i)
	}
	//print(str) do Python
	funcao exibir(cadeia texto){
		exibir(texto,"\n")
	}
	funcao exibir(cadeia texto,cadeia final){
		escreva(texto+final)
	}
}