programa
{
	inclua biblioteca Texto --> t
	inclua biblioteca Util --> u
	//Use t.numero_caracteres(cadeia) para textos
	//e u.numero_elementos(vetor) para conjuntos(arrays)
	funcao inicio ()
	{
		cadeia textos[]={
			"Subi no onibus",
			"SubiNoOnibus", //ao remover espaços se torna um palíndromo
			"Socorram Marrocos",
			"Não é palíndromo!",
			"123321",
			"Ovo",
			"987"
		}
		//É possível substituir os espaços " " por vazio ""
		//textos[0]=t.substituir(textos[0]," ","")
		para(inteiro i=0;i<u.numero_elementos(textos);i++){
			cadeia texto=textos[i]
			cadeia textoFiltrado=t.caixa_baixa(texto)
			escreva(texto+"("+inverter(texto)+")")
			se(verificaPalindromo(textoFiltrado))
				escreva(" é um ")
			senao
				escreva(" não é um ")
			escreva("Palíndromo!\n")
		}
	}
	funcao cadeia inverter(cadeia texto){
		cadeia invertido=""
		para(inteiro i=t.numero_caracteres(texto)-1;i>=0;i--)
			invertido+=t.obter_caracter(texto,i)
		retorne invertido
	}
	funcao logico verificaPalindromo(cadeia entrada){
		retorne entrada==inverter(entrada)
	}
}