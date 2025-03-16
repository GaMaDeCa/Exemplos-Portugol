programa
{
	//Calcular Porcentagem de Animais em uma Fazenda
	cadeia animais[]={
		"Porcos",
		"Galinhas",
		"Vacas",
		"Bois",
		"Ovelhas"
	}
	inteiro quantidades[]={
		9,
		8,
		3,
		2,
		5
	}
	inteiro qtoTiposAnimais=5
	inclua biblioteca Matematica
	inclua biblioteca Texto
	funcao inicio ()
	{
		escreva("Fazenda do Campo Verde\n\n")
		para(inteiro i=0;i<qtoTiposAnimais;i++){
			escreva(
				preencher_a_direita(
					' ',10,animais[i]+":"
				)+quantidades[i]+"\n"
			)
		}
		escreva("\nRepresentação em porcentagens...\n")
		
		real soma=somar(quantidades,qtoTiposAnimais)
		real porcentagens[qtoTiposAnimais]
		para(inteiro i=0;i<qtoTiposAnimais;i++){
			// Porcentagem = Por cem = ÷ ou × por 100
			real quantidade=quantidades[i]
			porcentagens[i]=(quantidade/soma)*100
			escreva(
				preencher_a_direita(
					' ',10,animais[i]+":"
				)+
				Texto.preencher_a_esquerda(
					' ',8,Matematica.arredondar(porcentagens[i],2)+"%\n"
				)
			)
		}
	}
	funcao inteiro somar(inteiro numeros[],inteiro tamanho){
		inteiro soma=0
		para(inteiro n=0;n<tamanho;n++){
			soma+=numeros[n]
		}
		retorne soma
	}
	//Baseado em Texto.preencher_a_esquerda(letra,tamanho,cad)
	funcao cadeia preencher_a_direita(caracter car,inteiro len,cadeia cad){
		cadeia ret=cad
		inteiro strlen=Texto.numero_caracteres(cad)
		enquanto(strlen<len){
			ret+=car
			strlen++
		}
		retorne ret
	}
}