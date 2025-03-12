programa
{
	//arredondar números
	inclua biblioteca Matematica
	//diminuir para letras minúsculas(caixa baixa)
	inclua biblioteca Texto
	//contar número de elementos e sortear números
	inclua biblioteca Util
	
	//Quiz simples de 12 perguntas
	//de 5 alternativas cada, com descrição
	//das respostas corretas e contador de acertos
	
  //Recursos: https://www.todamateria.com.br/perguntas-respostas-conhecimentos-gerais-nivel-facil/
	funcao inicio ()
	{
		logico aguardar=verdadeiro//marcar falso se quiser um quiz mais rápido
		cadeia perguntas[]={
			"Qual substância faz parte da composição do vidro?",
			"O que é um tsunami?",
			"Qual o satélite natural da Terra?",
			"Em que país de localiza o Taj Mahal?",
			"Qual o nome popular do cloreto de sódio?",
			"Kryptonita é a fraqueza de qual super-herói?",
			"Quais as duas línguas mais faladas no mundo?",
			"Qual a maior floresta tropical do mundo?",
			"Quantos continentes existem?",
			"Qual o maior planeta do sistema solar?",
			"Quanto é 2+2×2",
			"A que temperatura a água ferve?"
		}
		cadeia respostas[][]={
			{"Petróleo","Fibra","Celulose","Areia","Álcool"},
			{"Um ciclone","Um tornado","Um maremoto","Um terremoto","Um incêndio"},
			{"SCD-1","Ganimedes","Sol","Amazonia 1","Lua"},
			{"Egito","Índia","Inglaterra","Brasil","França"},
			{"Sal de cozinha","Vinagre","Água","Fermento","Papel"},
			{"Batman","Hulk","Super-Homem","Homem-Aranha","Flash"},
			{"Inglês e espanhol","Inglês e mandarim chinês","Mandarim chinês e francês","Inglês e português","Inglês e espanhol"},
			{"Mata Atlântica","Pampas","Pantanal","Floresta Amazônica","Caatinga"},
			{"2","8","4","6","3"},
			{"Marte","Lua","Saturno","Terra","Júpiter"},
			{"6","8","2","10","12"},
			{"200 ºC","-10 ºC","180 ºC","0 ºC","100 ºC"}
		}
		cadeia descricoes[]={
			"Além da areia (sílica), bicarbonato de sódio e\ncálcio também fazem parte da composição do vidro.",
			"Tsunami é um desastre natural que consiste na\nformação de ondas gigantes. Na década de 50, um\ntsunami no Alasca atingiu 500 metros de altura.",
			"Há dezenas de satélites naturais no Sistema Solar,\nmas a Lua é o único satélite natural da Terra.",
			"O Taj Mahal, uma das construções mais famosas da\nÍndia, é uma das 7 Maravilhas do Mundo Moderno.",
			"Cloreto de sódio (NaCl) é popularmente conhecido\ncomo sal de cozinha, porque é o sal que utilizamos\npara dar mais sabor aos alimentos.",
			"A kryptonita é um mineral que está ligado à\ndestruição do planeta do Super-Homem. Se ele ficar\nexposto a sua radiação durante bastante tempo pode\nmesmo morrer.",
			"O inglês e o mandarim chinês são as línguas que\ntêm mais falantes (nativos e estrangeiros) no mundo.",
			"A Floresta Amazônica ocupa quase 50 % do território\nbrasileiro e, além do Brasil, também está presente\nem mais 8 países: Bolívia, Colômbia, Equador,\nVenezuela, Guiana, Guiana Francesa, Peru e Suriname.",
			"Há 6 continentes: América, Europa, África, Ásia,\nOceania e Antártida (ou Antártica).",
			"Júpiter é 1300 vezes maior que a Terra, sendo o\nmaior planeta do sistema solar.",
			"6 é o resultado da operação 2+2×2, pois a ordem\ncorreta da operação aritmética é primeiro resolver\n× ou ÷,depois + ou -:\n2+2×2=2+4=6",
			"100 ºC é conhecido como o ponto de ebulição da\nágua."
		}
		cadeia alternativas[]={
			"a) ",
			"b) ",
			"c) ",
			"d) ",
			"e) "
		}
		inteiro respostas_corretas[]={
			3,
			2,
			4,
			1,
			0,
			2,
			1,
			3,
			3,
			4,
			0,
			4
		}
		inteiro ordem[]={0,1,2,3,4,5,6,7,8,9,10,11}//12 perguntas(contando com 0)
		
		//Loop para misturar a ordem das perguntas(embaralhador de vetores)
		para(inteiro x=0;x<Util.numero_elementos(ordem);x++){
			inteiro y=Util.sorteia(0,Util.numero_elementos(ordem)-1)
			se(x!=y){
				inteiro temp=ordem[x]
				ordem[x]=ordem[y]
				ordem[y]=temp
			}
		}
		
		inteiro corretas=0,erradas=0
		inteiro qtoPerguntas=Util.numero_elementos(perguntas)
		//Loop Quiz
		para(inteiro i=0;i<qtoPerguntas;i++){
			inteiro ord=ordem[i]
			
			escreva(perguntas[ord]+"\n\n")
			para(inteiro r=0;r<Util.numero_elementos(alternativas);r++)
				escreva(alternativas[r]+respostas[ord][r]+"\n")
			
			escreva("\nEscolha uma alternativa pela letra(a,b,c,d,e):")
			cadeia resposta
			inteiro ir=0
			leia(resposta)
			resposta=Texto.caixa_baixa(resposta)
			escolha(resposta){
				caso "a":
					ir=0
					pare
				caso "b":
					ir=1
					pare
				caso "c":
					ir=2
					pare
				caso "d":
					ir=3
					pare
				caso "e":
					ir=4
					pare
				caso contrario:
					escreva("Nenhuma alternativa escolhida,\n")
					escreva(" → escolhido alternativa padrão \"a\".\n\n")
					pare
			}
			escreva("Sua resposta está...")
			se(aguardar)Util.aguarde(1000)
			escreva(" absolutamente...")
			se(aguardar)Util.aguarde(2000)
			escreva(" E")
			se(aguardar)Util.aguarde(3000)
			inteiro rc=respostas_corretas[ord]
			se(ir==rc){
				escreva("XATA!\n :)")
				corretas++
			}
			senao{
				escreva("RRADA!\n :(")
				erradas++
			}
			escreva("\n\n")
			escreva("Sua escolha:\n "+alternativas[ir]+respostas[ord][ir])
			se(aguardar)Util.aguarde(2000)
			escreva("\n\nResposta correta:\n ")
			escreva(alternativas[rc]+respostas[ord][rc])
			escreva("\n\n"+descricoes[ord])
			se(aguardar)Util.aguarde(3000)
			escreva("\n\n")
		}
		escreva("   [FIM DO QUIZ!] \n\nResultados:\n ")
		escreva(qtoPerguntas+" perguntas no total\n ")
		escreva(corretas+" respostas corretas\n ")
		escreva(erradas+" respostas erradas\n")
		//Fórmula da porcentagem:
		//	(n÷t)×100
		//
		// Onde t é o tamanho dos dados, a soma do conjunto de números.
		// n é um número dentro desse conjunto de dados(e n é menor que t).
		
		// Ambos os inteiros devem ser convertidos para o tipo
		// real para o cálculo ficar correto.
		real n=corretas,t=qtoPerguntas
		real porcentagem=Matematica.arredondar(((n/t)*100),2)
		escreva("\nTaxa de acertos: "+porcentagem+"%")
	}
}