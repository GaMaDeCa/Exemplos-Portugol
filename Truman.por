programa
{
	// "Bom Dia, Boa Tarde e Boa Noite." - Truman Burbank
	inclua biblioteca Calendario --> cal
	funcao inicio ()
	{
		inteiro hora=cal.hora_atual(falso)
		escreva("Tenha ")
		se(hora>=6 e hora<12)
			escreva("um Bom Dia!\n\t   ⛅")
		se(hora>=12 e hora<18)
			escreva("uma Boa Tarde!\n\t\t☀️")
		se(hora>=18 ou hora<6)
			escreva("uma Boa Noite!\n\t\t🌙")
	}
}