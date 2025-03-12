programa
{
	funcao inicio ()
	{
		//Swap Challenge(Desafio de Troca usando apenas 2 variáveis)
		// Consegue trocar o valor de 2 variáveis numéricas
		// usando somente elas mesmas? aqui abaixo está a solução
		// de como fazer isso.
		
		inteiro a=36,b=98
		
		escreva("Antes da troca:\n")
		exiba(a,b)
		
		a=a+b
		b=a-b
		a=a-b
		
		/*
		  O truque consiste na lógica matemática, nos
		  usamos uma variável para somar(a+b), a segunda
		  variável contem o valor de uma delas(a ou b),
		  ao subtrair o valor dela com a soma obtém o
		  outro valor somado:
		   36+98=134
		   134-98=36
		   134-36=98
		*/
		
		escreva("\nDepois:\n")
		exiba(a,b)
	}
	//essa função não tem relação com o desafio
	//ela apenas exibe as variáveis na tela formatadas
	funcao exiba(inteiro a,inteiro b){
		escreva("a="+a+"\nb="+b)
	}
}