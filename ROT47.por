programa
{
	inclua biblioteca Texto
	cadeia ASCII_REDUZIDO = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
	//Converte caractere em decimal inteiro ASCII
	funcao inteiro ord(caracter c)
	{
		retorne Texto.posicao_texto(""+c,ASCII_REDUZIDO,0)+32
	}
	//Converte o decimal inteiro para caractere novamente
	funcao caracter chr(inteiro d){
		retorne Texto.obter_caracter(ASCII_REDUZIDO, d-32)
	}
	funcao inicio ()
	{
		escreva("Cifra ROT47\n\n")
		
		cadeia entrada
		escreva("Insira o texto a ser codificado/decodificado:\n")
		leia(entrada)
		
		cadeia saida = ROT47(entrada)
		escreva("Codificado:\n")
		escreva(saida)
		
		escreva("\nDecodificado:\n"+ROT47(saida))
	}
	//Cifra ROT47
	funcao cadeia ROT47(cadeia CADEIA){
		cadeia CADEIA_ROT47 = ""
		para(inteiro indice = 0; indice < Texto.numero_caracteres(CADEIA); indice++){
			caracter car = Texto.obter_caracter(CADEIA, indice)
			inteiro ascii = ord(car)
			se ( ascii >= 33 e ascii <= 126 ) {
				CADEIA_ROT47 += chr(33 + ((ascii + 14) % 94))
			} senao
				CADEIA_ROT47 += car
		}
		retorne CADEIA_ROT47
	}
}