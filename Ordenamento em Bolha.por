programa
{
	//Ordenamento em Bolha(Bubble Sorting)
  //Passos:
	// 1º Criar um vetor de inteiros simples
	// 2º Misturar a ordem dos números do vetor aleatoriamente
	// 3º Organizar em ordem crescente usando Ordenamento em Bolha
	inclua biblioteca Util

	inteiro vetor[100]
	inteiro tamanho//=vetor=100
	funcao inicio (){
		escreva("(Ordenamento em Bolha)\n\n")
		
		//Este loop cria o vetor(de 0 a 99)
		tamanho=Util.numero_elementos(vetor)//=vetor=100
		para(inteiro i=0;i<tamanho;i++)
			vetor[i]=i
		
		escreva("Vetor Original:\n")
		escreva(vetor)
		espaco()
		
		misturar()//Shuffle
		escreva("\nmisturar()\nVetor Misturado:\n")
		escreva(vetor)
		
		// Usando o Algoritimo Bubble Sorting
		// Ordenamento em Bolha, com variável
		// do tempo da execução da função(em milissegundos).
		inteiro tempo_exec=Util.tempo_decorrido()
		ordenar() //ou Organizar
		tempo_exec=Util.tempo_decorrido()-tempo_exec
		escreva("\n\nordenar() //Algoritimo de Ordenamento em Bolha\nVetor Organizado:\n")
		escreva(vetor)
		escreva("\n\nTempo de Execução do Ordenamento em Bolha: "+tempo_exec+" ms (millissegundos")
	}
	funcao trocar(inteiro i,inteiro i2){
		inteiro temp=vetor[i]
		vetor[i]=vetor[i2]
		vetor[i2]=temp
	}
	funcao misturar(){
		para(inteiro i=0;i<tamanho;i++){
			trocar(i,Util.sorteia(0,tamanho-1))
		}
	}
	inteiro tamanhoTemp
	funcao ordenar(){
		tamanhoTemp=tamanho
		enquanto(tamanhoTemp>1){
			logico fimDaTroca=verdadeiro
			inteiro x=0
			enquanto(x<(tamanhoTemp-1)){
				// É possivel organizar em ordem decrescente
				// trocando vetor[x]>vetor[x+1] por vetor[x]<vetor[x+1]
				// > por <
				se(vetor[x]>vetor[x+1]){
					fimDaTroca=falso
					trocar(x,x+1)
				}
				x++
			}
			tamanhoTemp-=1
		}
		
	}
	//Não muito útil
	funcao espaco(){
		escreva("\n")
	}
}