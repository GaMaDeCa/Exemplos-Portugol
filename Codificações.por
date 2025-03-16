programa
{
	//Texto para ASCII, Hexadecimal e Binário
	inclua biblioteca Matematica --> m
	inclua biblioteca Tipos
	inclua biblioteca Texto --> t
	inclua biblioteca Util --> u
	cadeia ASCII =     " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
	//Função retirada do exemplo de internet do Portugol Web
	funcao inteiro converterParaASCII(caracter c)
	{
		retorne t.posicao_texto(""+c,ASCII,0)+32
	}
	//Como mostra a função acima só é suportado caracteres acima de 32
	//abaixo pode causar conflitos, como o '\0'
	funcao inicio ()
	{
		cadeia texto
		escreva("Insira o texto a ser codificado:\n")
		leia(texto)
		
		//Converter texto para vetor ASCII(bytes de 0 a 255, 256 contando com 0)
		inteiro decimalASCII[t.numero_caracteres(texto)]
		para(inteiro indice=0;indice<t.numero_caracteres(texto);indice++){
			decimalASCII[indice]=converterParaASCII(t.obter_caracter(texto,indice))
		}
		escreva("\nVetor decimal(Base 10) ASCII:\n"+decimalASCII)
		escreva("\n\nHexadecimal(Base 16):\n"+ASCIIPraHexadecimal(decimalASCII," "))
		escreva("\n\nBinário(Base 2):\n"+ASCIIPraBinario8Bits(decimalASCII," "))
	}
	//Hexadecimal também conhecido como base 16
	//Base 16 = 16 "números/objetos" de contagem numérica
	cadeia HEXADECIMAL="0123456789ABCDEF" //tamanho=16
	funcao cadeia ASCIIPraHexadecimal(inteiro vetorASCII[],cadeia separador){
		cadeia hex=""
		para(inteiro i=0;i<u.numero_elementos(vetorASCII);i++){
			inteiro a=vetorASCII[i]
			hex+=t.obter_caracter(HEXADECIMAL,(a/16)%16)
			hex+=t.obter_caracter(HEXADECIMAL,a%16)+separador
		}
		retorne hex
	}
	cadeia BINARIO="01" //Base 2
	//É binário 8 bits pq é separado em cada 8 dígitos
	funcao cadeia ASCIIPraBinario8Bits(inteiro vetorASCII[],cadeia separador){
		cadeia bin=""
		para(inteiro i=0;i<u.numero_elementos(vetorASCII);i++){
			inteiro a=vetorASCII[i]
			para(inteiro j=0;j<8;j++){
				bin+=t.obter_caracter(BINARIO,(a/m.potencia(2,7-j))%2)
			}
			bin+=separador
		}
		retorne bin
	}
}

/*Exemplo de saída:

Insira o texto a ser codificado:
GaMaDeCa

Vetor decimal(Base 10) ASCII:
71,97,77,97,68,101,67,97

Hexadecimal(Base 16):
47 61 4D 61 44 65 43 61 

Binário(Base 2):
01000111 01100001 01001101 01100001 01000100 01100101 01000011 01100001 

Programa finalizado. Tempo de execução:6399 milissegundos
*/