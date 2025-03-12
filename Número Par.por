programa
{
	inclua biblioteca Util --> u
	funcao inicio ()
	{
		//Sorteia 10 números aleatórios, de 0 a 100
		para(inteiro i=0;i<10;i++){
			inteiro numero=u.sorteia(0,100)
			
			escreva(numero+" é ")
			se(ePar(numero))
				escreva("Par")
			senao
				escreva("Impar")
			escreva("!\n")
		}
	}
	funcao logico ePar(inteiro numero){
		retorne numero%2==0
	}
}