programa
{
	//inclua biblioteca Matematica --> m
	funcao inicio ()
	{
		/*Sua empresa aplicou um capital de
		R$ 3.000,00 a juros simples durante
		três anos a uma taxa de 11,25% am.
		Obtenha o valor dos juros e o montante
		após os 3 anos. Calcule os juros e o montante*/
		
		// R$ 3000 reais de investimento inicial
		real Capital=3000
		
		// Taxa de juros, em porcentagem(%)
		//dividido por 100, ou resumidamente 0.1125
		real Taxa=11.25
		
		// O período que queremos calcular
		// quanto de juros rende durante x tempo
		real Tempo=3
		// Lembrando que esse período é em anos na
		//pergunta acima
		
		//A unidade de tempo dos juros é algo que precisa
		//levar em consideração ao calcular juros, se o
		//juros for ao mês e o tempo for ao ano é necessário
		//calcular essa diferença.
		//
		// É usado ad, am e aa, suas respectivas 
		//    siglas podem ser traduzidas como:
		//  - ad = ao dia
		//  - am = ao mês
		//  - aa = ao ano
		cadeia Unidade="am"
		
		escreva("Juros Simples:\n Capital: R$ "+Capital+
				"\n Taxa de Juros: "+Taxa+"% "+Unidade+
				" ("+(Taxa/100)+")\n Período: "+Tempo+
				" anos ("+(Tempo*12)+" meses)"+"\n\n")

		//Precisa converter antes de calcular:
		// 100% = 100/100 = 1
		//Nesse caso:
		// 50% = 50/100 = 0.5
		Taxa=converterPorcentagem(Taxa)
		
		//A unidade de tempo nem sempre precisa ser convertida
		//mas como os juros são ao mês e o período(tempo)
		//é ao ano vc precisa converter o ano em meses:
		Tempo=Tempo*12 //=anos para meses, meses para anos=Tempo/12
		//1 ano = 12 meses
		
		real juros=simples(Capital,Taxa,Tempo)
		real montante=Capital+juros
		escreva("Juros:    R$ "+juros+" ("+Capital+"×"+Taxa+"×"+Tempo+")"+
				"\nMontante: R$ "+montante+" ("+Capital+"+"+juros+")")
		//Sabendo que o resultado dos juros é R$ 12.150
		//como descobrir agora em quanto tempo, ou qual
		//a taxa de juros ou até o capital inicial que
		//rendeu esses juros:
		// É só aplicar a equação do 2º grau no que estiver faltando.
		// Invertendo a conta(multiplicação para divisão)
		// Para obter o Capital(C), J=C×i×t vira J÷t÷i=C
		
		//Exemplo:
		// Qual capital inicial foi aplicado ao juros simples
		// de R$ 12.150 sabendo que a taxa de juros é 11,25%(11,25÷100=0,1125)
		// am e o período é 3 anos(3×12=36).
		// 12150÷36÷0,1125=3000
	}
	funcao real simples(real C,real i,real t){
		retorne C*i*t
	}
	//TODO: Criar novo exemplo com Juros Compostos
	/*funcao real composto(real C,real i,real t){
		retorne composto(C,i,t,verdadeiro)
	}
	funcao real composto(real C,real i,real t,logico valoriza){
		se(valoriza)
			retorne C*m.potencia(1+i,t)
		senao
			retorne C*m.potencia(-1+i,t)
	}*/
	funcao real converterPorcentagem(real prcnt){
		retorne prcnt/100
	}
}