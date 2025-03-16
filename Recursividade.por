programa
{
	// Recursividade
	funcao inicio ()
	{
		escreva("Fatorial de 5:\n 5!="+fatorial(5))
		escreva("\n\nDe 5 a 1:\n")
		contarAteZerar(5)
		inteiro vetor[5]={1,2,3,4,5}
		escreva("\n\nA soma do vetor "+vetor+" é "+somar(vetor,0,5,1))
		//Não executar, este loop é infinito
		//e vai travar em algum momento.
		//digaSim()
	}
	// Fatorial Recursivo
	//Recursividade é a característica de uma função
	//chamar ela mesma por "x" quantidade de vezes,
	//na programação recursividade tem limites,
	//ela não pode ser infinita(igual um loop infinito)
	//e não pode ultrapassar o limite de memória.
	
	//Ao executar: fatorial(5)
	//  5×4×3×2×1
	//  5×fatorial(5-1)....
	funcao inteiro fatorial(inteiro numero){
		se(numero==1)
			retorne numero
		retorne numero*fatorial(numero-1)
	}
	//Essa função recursiva para somar vetores pode
	//entrar em loop infinito se for mal configurada.
	// > Inicio é o índice inicial do vetor.
	// > Fim é a condição de término do loop, e deve ser igual ao início em algum momento.
	// > Passo é somado ao inicio em cada iteração(cada loop).
	//Para travar:
	// somar(vetor,1,0,0)
	funcao inteiro somar(inteiro vetor[],inteiro inicio,inteiro fim,inteiro passo){
		se(inicio==fim)
			retorne 0
		retorne vetor[inicio]+somar(vetor,inicio+passo,fim,passo)
	}
	//Quem precisa de um loop para(...) de contar?
	funcao contarAteZerar(inteiro numero){
		se(numero<=0)
			retorne //ao vazio(função vazia, void)
		se(numero%2==0)
			escreva(numero+" Par\n")
		senao
			escreva(numero+" Impar\n")
		contarAteZerar(numero-1)
	}
	//Este é um loop recursivo "infinito".
	//Esse loop não tem fim, é quase o mesmo que fazer:
	// enquanto(verdadeiro){}
	// ou
	// para(;;){}
	funcao digaSim(){
		escreva("Sim\n")
		//Vc pode parar um possível loop
		//infinito usando o comando "pare",
		//teste abaixo descomentando ele abaixo:
		//pare
		//Lembre de colocar "pare" antes do loop.
		digaSim()
	}
}