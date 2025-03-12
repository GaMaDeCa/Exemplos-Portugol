programa
{
	inclua biblioteca Internet --> net
	inclua biblioteca Texto
	cadeia SEE_IP_API="https://api.seeip.org",IP_API="http://ip-api.com"
	cadeia GOOGLE="https://www.google.com"
	funcao inicio ()
	{
		//Uma forma simples de checar se a internet funciona no geral
		//é verificando se o endereço Google e está disponível.
		se(net.endereco_disponivel(GOOGLE))
			escreva("Google Disponível!\n")
		
		se(net.endereco_disponivel(SEE_IP_API))
			exibirDadosDoEnderecoIP()
		senao
			escreva("Sem conexão com internet!\nVerifique sua conexão com a Internet!")
	}
	funcao exibirDadosDoEnderecoIP(){
		cadeia ip_externo=net.obter_texto(SEE_IP_API)
		escreva("Meu IP é: "+ip_externo)
		
		cadeia API_JSON=IP_API+"/json/{query}",TAG="{query}"
		API_JSON=Texto.substituir(API_JSON,TAG,ip_externo)
		
		cadeia json=net.obter_texto(API_JSON)
		json=Texto.substituir(json,",",",\n")
		
		escreva("\nDados completos em JSON:\n"+json)
	}
}
