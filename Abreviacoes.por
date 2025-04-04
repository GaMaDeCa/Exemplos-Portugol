programa
{
	// Abreviações e algumas funções úteis
	// Extra: 
	//  Simulação de Monte Carlo sobre jogada de moeda(cara ou coroa) incluída
	inclua biblioteca Graficos --> g
	inclua biblioteca Matematica --> m
	inclua biblioteca Tipos --> t
	inclua biblioteca Util --> u
	
	const logico VDD = verdadeiro, FAK = falso
	
	//sortear() = verdadeiro/falso
	funcao logico sortear(){
		retorne u.sorteia(0,1) == 1
	}
	//Função map do p5js
	//remapeia o ponto x ou y de uma dimensão(w,h) pra outra(W,H)
	funcao real remapear(real n, real inicia1, real pare1, real inicia2, real pare2) {
		retorne ((n-inicia1)/(pare1-inicia1))*(pare2-inicia2)+inicia2
	}
	//Se for uma função simples vc não precisa de muitas linhas de código
	//com {} vc pode retirar as linhas.
	funcao real sen(real n){retorne m.seno(n)}
	funcao real cos(real n){retorne m.cosseno(n)}
	funcao real raizQuad(real n){retorne m.raiz(n, 2)}
	
	funcao inteiro cad2int(cadeia cad, inteiro base){
		retorne t.cadeia_para_inteiro(cad, base)
	}
	funcao inteiro cad2int(cadeia cad){
		retorne cad2int(cad, 10) //base do sistema decimal(10)
	}
	funcao real cad2real(cadeia cad){
		retorne t.cadeia_para_real(cad)
	}
	funcao cadeia pergunta(cadeia enunciado){
		escreva(enunciado)
		cadeia resposta
		leia(resposta)
		retorne resposta
	}
	funcao exiba(cadeia mensagem,cadeia fim){
		escreva(mensagem+fim)
	}
	funcao exiba(cadeia mensagem){
		exiba(mensagem,"\n")
	}
	real caras, coroas
	real statCaras, statCoroas
	const inteiro jogadas = 10000000 //10 milhões
	funcao Monte_Carlo(){
		caras = 0
		coroas = 0
		para(inteiro i=0;i<jogadas;i++){
			se (sortear())
				caras++
			senao
				coroas++
		}
		// Para calcular estatística(% = Por 100):
		//    (Parte ÷ Total) × 100
		statCaras = (caras / jogadas) * 100
		statCoroas = (coroas / jogadas) * 100
		exiba("Caras: "+m.arredondar(caras, 0)+" "+m.arredondar(statCaras, 2)+"%")
		exiba("Coroas: "+m.arredondar(coroas, 0)+" "+m.arredondar(statCoroas, 2)+"%")
	}
	funcao inicio(){
		exiba("Remapear ponto N de uma dimensão pra outra")
		inteiro pontoN = cad2int(pergunta("Insira o ponto N(5): ")),
				s = cad2int(pergunta("Insira o inicio(0): ")),
				f = cad2int(pergunta("Insira o fim(10): ")),
				s2 = cad2int(pergunta("Insira o inicio 2(0): ")),
				f2 = cad2int(pergunta("Insira o fim 2(1000): "))
		exiba("Ponto remapeado: "+remapear(pontoN,s,f,s2,f2))
		
		inteiro n = cad2int(pergunta("\nRaiz Quadrada\nInsira um número: "))
		exiba("A raiz quadrada de "+n+" é "+raizQuad(n))
		exiba("\nSimulação Monte Carlo\nJogo de Moeda")
		exiba("Qual lado da moeda cai mais, cara ou coroa?\nNa teoria é 50%/50%, na prática é quase praticamente\nisso mas com algum percentual de diferença(1% ou 2%)")
		exiba("Jogando moedas "+jogadas+" vezes aguarde...")
		Monte_Carlo()
	}
}