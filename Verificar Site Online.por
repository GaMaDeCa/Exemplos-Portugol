programa
{
	inclua biblioteca Internet
	inclua biblioteca Texto
	funcao inicio ()
	{
		escreva("Verificar Site Online\n\n")
		cadeia endereco=pergunta("Insira o link do site:")
		endereco=formatarLinkWeb(endereco)
		se(Internet.endereco_disponivel(endereco))
			escreva("\nO endereço \""+endereco+"\" está disponível!")
		senao
			escreva("\nSite indisponível! Provavelmente offline!\nVerifique sua conexão com a internet!")
	}
	funcao cadeia pergunta(cadeia texto){
		cadeia entrada
		escreva(texto)
		leia(entrada)
		retorne entrada
	}
	//Se o texto começa com determinada sequência
	funcao logico comeca(cadeia texto,cadeia com){
		inteiro
			tLen=Texto.numero_caracteres(texto),
			cLen=Texto.numero_caracteres(com)
		se(cLen>tLen)
			retorne falso
		para(inteiro i=0;i<tLen;i++){
			se(i==cLen)
				pare
			se(Texto.obter_caracter(texto,i)!=Texto.obter_caracter(com,i))
				retorne falso
		}
		retorne verdadeiro
	}
	funcao cadeia formatarLinkWeb(cadeia link){
		cadeia min=Texto.caixa_baixa(link)
		se(comeca(min,"http://") ou comeca(min,"https://"))
			retorne link
		senao
			retorne "https://"+link
	}
}