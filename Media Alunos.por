programa
{
	// A biblioteca de utilidades matemáticas é
	// traduzida como Math em diversas linguagens.
	inclua biblioteca Matematica --> Math
	inclua biblioteca Util --> Utils
	// Um TODO é usado para mostrar o que precisa ser
	// feito futuramente no código, em uma tradução
	// literal é o mesmo que "A FAZER:"
	/*TODO:
		- Melhorar código no geral
	*/
	funcao inicio ()
	{
		// Introdução com um intervalo de 2 segundos
		escreva("[Introdução]\nPergunta(tipo de dado, exemplo padrão)?\n\n")
		Utils.aguarde(2*1000)
		inteiro qtoAlunos,periodo
		escreva("Quantos Alunos(inteiro, 3)?\n")
		leia(qtoAlunos)
		escreva("Período, quantas provas(inteiro, 2)?\n")
		leia(periodo)
		escreva()
		
		cadeia alunos[qtoAlunos]
		// Quantidade de provas = Alunos × Provas(Ou Período)
		real notas[qtoAlunos*periodo]
		// é possível configurar quantas provas quiser
		
		/* Loop para obter os nomes e notas dos alunos
		
		Índice sempre começa com 0
		Índice é a posição do item no conjunto(array).
		É comum usarem a letra "i" para representar o índice.
		Índice++ = índice+1
		*/
		inteiro iNotas=0,iP
		para(inteiro indice=0;indice<qtoAlunos;indice++){
			escreva("Insira o nome do aluno "+(indice+1)+"(cadeia):")
			leia(alunos[indice])
			para(iP=0;iP<periodo;iP++){
				escreva((iP+1)+"ª nota do aluno "+alunos[indice]+"(real):")
				leia(notas[iNotas+iP])
			}
			iNotas+=periodo
			// \n = Nova Linha
			escreva("\n")
		}
		// Mínimo para aprovar o aluno, geralmente 5 ou 7
		real minAprovar
		escreva("Qual é a nota mínima de aprovação(real, 5-7)?")
		leia(minAprovar)
		// i2 é o mesmo que iNotas, e o i = indice,
		// i2 é usado como ponteiro, se o periodo for 3
		// a cada loop é somado 3 ao i2, a variável iP
		// é usada para pegar os valores do conjunto de dados
		// somando em um loop o i2+"índice do periodo".
		inteiro i2=0
		//Loop para somar as notas, calcular a média
		//e exibir na tela a aprovação do aluno
		para(inteiro i=0;i<qtoAlunos;i++){
			// Para obter a média vc deve somar o
			// valor de todas as provas do aluno,
			// depois dividir o resultado da soma
			// pela quantidade de provas(período).
			
			// Função de soma(é possível somar com um único loop)
			real somaNotas=0
			// quando o loop só tem uma função, vc pode omitir
			// o fechamento {}
			para(iP=0;iP<periodo;iP++)
				somaNotas+=notas[i2+iP]
			
			// A soma das notas dividido por período(quantidade de provas),
			// depois arredondado em 2 casas decimais N.XX
			real media=Math.arredondar(somaNotas/periodo,2)
			
			// Se a media for menor que o mínimo então a
			// situacao muda para Reprovado
			cadeia situacao="Aprovado"
			se(media<minAprovar)
				situacao="Reprovado"
				
			escreva("\n"+alunos[i]+" foi "+situacao+"(a)!")
			escreva("\nNota média: "+media)
			escreva("\nProvas: "+periodo)
			
			i2+=periodo
			escreva("\n")
			// Aguarda 3 segundos
			Utils.aguarde(3000)
		}
	}
}