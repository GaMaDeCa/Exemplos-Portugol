programa
{
	//Soma e Conversão de Tipos
	inclua biblioteca Tipos --> tp
	inclua biblioteca Texto
	funcao inicio ()
	{
		cadeia cad=entrada("Insira uma simples soma(2+2):")
		
		inteiro tamanho=contarCar(cad,'+')+1
		cadeia vetor[tamanho]
		cortarCad(vetor,cad,'+')
		
		//Converter vetor para vetor numérico decimal(base 10)
		inteiro vNum[tamanho]
		para(inteiro i=0;i<tamanho;i++)
			vNum[i]=tp.cadeia_para_inteiro(vetor[i],10)
		
		inteiro soma=0
		para(inteiro i=0;i<tamanho;i++)
			soma+=vNum[i]
		
		escreva(cad+"="+soma)
	}
	// igual o input(message) do Python
	funcao cadeia entrada(cadeia mensagem){
		escreva(mensagem)
		cadeia retorno
		leia(retorno)
		retorne retorno
	}
	//Cortar Cadeia em Conjunto de Cadeias, e.g.
	//	cortarCad(2,vetor,"2+5",'+') = vetor={2,5}
	funcao cortarCad(cadeia vetor[],cadeia texto,caracter corte){
		cadeia secao=""
		inteiro k=0
		para(inteiro i=0;i<Texto.numero_caracteres(texto);i++){
			caracter
				t=Texto.obter_caracter(texto,i)
			se(t==corte){
				vetor[k++]=secao
				secao=""
			}senao{
				secao+=t
			}
		}
		se(secao!="")
			vetor[k]=secao
	}
	//contarCar("2!2!2!!!",'!') == 5
	funcao inteiro contarCar(cadeia cad,caracter car){
		inteiro qto=0
		para(inteiro i=0;i<Texto.numero_caracteres(cad);i++){
			se(Texto.obter_caracter(cad,i)==car)
				qto++
		}
		retorne qto
	}
}