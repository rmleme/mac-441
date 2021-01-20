<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, Release 5i.1 of January 24, 2000 on May 26, 2001 at 9:14:45 am</time-stamp>


<name-space>
<name>Mac441</name>
<environment>Smalltalk</environment>
<private>false</private>
<imports>
			private Smalltalk.*
			</imports>
<category>As yet unclassified</category>
</name-space>


<class>
<name>Atendimento</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>id usuario descricao dataInicio comentariosFinais </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<methods>
<class-id>Mac441.Atendimento</class-id> <category>acesso</category>

<body>comentariosFinais: umTexto
	comentariosFinais := umTexto</body>

<body><B>dataInicio: umaData 
	</B>dataInicio := umaData</body>

<body>descricao
	^descricao</body>

<body><B>descricao: umTexto 
	</B>descricao := umTexto</body>

<body><B>id
	</B>^id</body>

<body>id: umId
	id := umId</body>

<body><B>terminou
	</B>^comentariosFinais notNil</body>

<body><B>usuario
	</B>^usuario</body>

<body><B>usuario: umUsuario 
	</B>usuario := umUsuario</body>
</methods>


<class>
<name>Item</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>numChamada titulo acervo empresta qtosItens </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<static>
<name>geraNumChamada</name>
<environment>Mac441.Item</environment>
<private>false</private>
<constant>false</constant>
<category>As yet unclassified</category>
</static>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Item class</class-id> <category>inicializacao</category>

<body>new
	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Item</class-id> <category>empresta</category>

<body><B>devolve: umEmprestimo 
	</B>"Associa um item a um objeto da classe Emprestimo."

	empresta remove: umEmprestimo.
	acervo acervoDisp: umEmprestimo itemEmprestado</body>

<body><B>empresta: umEmprestimo 
	</B>"Associa um item a um objeto da classe Emprestimo."

	empresta add: umEmprestimo.
	empresta size = qtosItens ifTrue: [acervo removeDisp: numChamada]</body>
</methods>

<methods>
<class-id>Mac441.Item</class-id> <category>acesso</category>

<body><B>acervo
	</B>"Retorna a qual acervo o item pertence."

	^acervo</body>

<body><B>acervo: umCentroServico 
	</B>"Altera o centro de serviço ao qual o item pertence."

	acervo := umCentroServico</body>

<body><B>adicionaItem
	</B>qtosItens := qtosItens + 1</body>

<body><B>empresta
	</B>"Retorna o status de emprestimo de um item."

	^empresta</body>

<body>numChamada
	"Retorna o numChamada de um item."

	^numChamada</body>

<body>numChamada: umInteiro 
	"Altera o numChamada de um item."

	numChamada := umInteiro</body>

<body>qtosItens
	^qtosItens</body>

<body>titulo
	"Retorna o titulo do item."

	^titulo</body>

<body>titulo: umString 
	"Altera o titulo de um item."

	titulo := umString</body>
</methods>

<methods>
<class-id>Mac441.Item</class-id> <category>inicializacao</category>

<body><B>initialize
	</B>numChamada := nil.
	titulo := nil.
	acervo := nil.
	empresta := Set new.
	qtosItens := 1</body>
</methods>


<class>
<name>TalaOrtopedica</name>
<environment>Mac441</environment>
<super>Mac441.Item</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>


<class>
<name>Emprestimo</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>quemEmprestou itemEmprestado qualCentro dataDeSaida dataDeDevolucao dataPrevistaDevolucao </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<methods>
<class-id>Mac441.Emprestimo</class-id> <category>acesso</category>

<body>dataDeDevolucao
	"Retorna a dataDeDevolucao do item emprestado."

	^dataDeDevolucao</body>

<body>dataDeDevolucao: umaString 
	"Altera a dataDeDevolucao do item emprestado."

	dataDeDevolucao := umaString</body>

<body>dataDeSaida: umaString 
	"Altera a dataDeSaida do item emprestado."

	dataDeSaida := umaString</body>

<body>dataPrevistaDevolucao
	"Retorna a dataPrevistaDevolucao do item emprestado."

	^dataPrevistaDevolucao</body>

<body>dataPrevistaDevolucao: umaString 
	"Altera a dataPrevistaDevolucao do item emprestado."

	dataPrevistaDevolucao := umaString</body>

<body>itemEmprestado
	"Retorna o itemEmprestado."

	^itemEmprestado</body>

<body>itemEmprestado: qualItem 
	"Altera o itemEmprestado."

	itemEmprestado := qualItem</body>

<body><B>qualCentro
	</B>"Retorna qualCentro emprestou o item."

	^qualCentro</body>

<body><B>qualCentro: umCentro 
	</B>"Altera qualCentro emprestou o item."

	qualCentro := umCentro</body>

<body>quemEmprestou
	"Retorna quemEmprestou o item."

	^quemEmprestou</body>

<body>quemEmprestou: umUsuario 
	"Altera quemEmprestou o item."

	quemEmprestou := umUsuario</body>
</methods>


<class>
<name>Livro</name>
<environment>Mac441</environment>
<super>Mac441.Item</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>autores ano </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<methods>
<class-id>Mac441.Livro</class-id> <category>acesso</category>

<body><B>ano
	</B>^ano</body>

<body><B>ano: umAno 
	</B>ano := umAno</body>

<body><B>autores
	</B>"Retorna os autores de um livro."

	^autores</body>

<body><B>autores: umaString 
	</B>"Altera os autores de um livro."

	autores := umaString</body>
</methods>


<class>
<name>Anais</name>
<environment>Mac441</environment>
<super>Mac441.Item</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>ano </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<methods>
<class-id>Mac441.Anais</class-id> <category>acesso</category>

<body><B>ano
	</B>^ano</body>

<body><B>ano: umAno 
	</B>ano := umAno</body>
</methods>


<class>
<name>CentroServico</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>nome acervo coopera acervoDisp usuarios </inst-vars>
<class-inst-vars>geraNumUsuario </class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<static>
<name>geraNumUsuario</name>
<environment>Mac441.CentroServico</environment>
<private>false</private>
<constant>false</constant>
<category>As yet unclassified</category>
</static>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.CentroServico class</class-id> <category>inicializacao</category>

<body><B>new
	</B>^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.CentroServico</class-id> <category>acesso</category>

<body>acervoDisp: umItem
	acervoDisp at: umItem numChamada put: umItem</body>

<body><B>empresta: itemId 
	</B>"Retorna um item do centro de servico se ele existir no seu 
	dicionario de itens disponiveis; 0 caso contrario."

	^acervoDisp at: itemId ifAbsent: [nil]</body>

<body>nome
	^nome</body>

<body><B>nome: umaString 
	</B>"Altera o nome do centro."

	nome := umaString</body>

<body><B>novoItem: umItemId descricao: umObjeto 
	</B>(acervo includesKey: umItemId)
		ifTrue: [(acervo at: umItemId) adicionaItem]
		ifFalse: 
			[umObjeto acervo: self.
			acervo at: umItemId put: umObjeto].
	acervoDisp at: umItemId put: (acervo at: umItemId)</body>
</methods>

<methods>
<class-id>Mac441.CentroServico</class-id> <category>inicializacao</category>

<body><B>initialize
	</B>nome := nil.
	acervo := Dictionary new.
	coopera := Dictionary new.
	acervoDisp := Dictionary new.
	usuarios := Dictionary new.
	geraNumUsuario isNil ifTrue: [geraNumUsuario := 0]</body>
</methods>

<methods>
<class-id>Mac441.CentroServico</class-id> <category>cooperacao</category>

<body><B>associaSe: umCentro 
	</B>"Associa um centro ao outro, adicionando umCentro ao 
	atributo coopera."

	coopera at: umCentro nome put: umCentro</body>
</methods>

<methods>
<class-id>Mac441.CentroServico</class-id> <category>emprestimos</category>

<body><B>devolucaoItem: item por: idUsuario 
	</B>"Implementa a devolucao de um item (acessado via itemId) 
	por um usuario (acessado via idUsuario) ao Centro de Servico."

	| t1 umUsuario qualItem itemId |
	itemId := item numChamada.
	umUsuario := usuarios at: idUsuario ifAbsent: nil.
	umUsuario = nil
		ifTrue: 
			[Transcript cr; show: 'Usuario nao registrado neste centro de servico.'.
			^nil]
		ifFalse: 
			[t1 := umUsuario temEmprestimo: itemId.
			t1 = nil
				ifTrue: 
					[Transcript cr; show: 'Nao ha registro de emprestimo.'.
					^nil]
				ifFalse: [t1 qualCentro = self
						ifTrue: 
							[qualItem := t1 itemEmprestado.
							t1 dataDeDevolucao: Date today.
							qualItem devolve: t1.
							umUsuario removeEmprestimo: itemId.
							^t1]
						ifFalse: 
							[Transcript cr; show: 'O item nao foi emprestado por esta biblioteca.'.
							^nil]]]</body>

<body><B>emprestimoItem: itemId para: idUsuario data: umaData 
	</B>"Implementa o emprestimo de um item (acessado via 
	itemId) do Centro de Servico a um usuario (acessado via 
	idUsuario)."

	| umUsuario qualItem |
	(usuarios includesKey: idUsuario)
		ifTrue: 
			[umUsuario := usuarios at: idUsuario.
			(acervoDisp includesKey: itemId)
				ifTrue: 
					[qualItem := acervo at: itemId.
					umUsuario
						item: qualItem
						centro: self
						data: umaData.
					^true]
				ifFalse: 
					[coopera
						keysAndValuesDo: 
							[:nomeCentroAux :centroAux | 
							qualItem := centroAux empresta: itemId.
							qualItem = nil
								ifFalse: 
									[umUsuario
										item: qualItem
										centro: self
										data: umaData.
									^true]].
					Transcript cr; show: 'Item nao disponivel.']]
		ifFalse: [Transcript cr; show: 'Usuario nao registrado neste centro de servico.'].
	^false</body>

<body><B>emprestimos
	</B>"Retorna um conjunto com todos os itens emprestados pelo 
	centro."

	| itensEmprestados |
	itensEmprestados := Set new.
	acervo keysAndValuesDo: [:numChamada :qualItem | qualItem empresta size = 0 ifFalse: [itensEmprestados add: qualItem]].
	^itensEmprestados</body>

<body><B>removeDisp: itemId
	</B>acervoDisp removeKey: itemId</body>
</methods>

<methods>
<class-id>Mac441.CentroServico</class-id> <category>cadastro</category>

<body><B>cadastrar: umaPessoa 
	</B>| usuario |
	umaPessoa usuario isNil
		ifTrue: 
			[usuario := Usuario new.
			usuario pessoa: umaPessoa.
			geraNumUsuario := geraNumUsuario + 1.
			usuario numero: geraNumUsuario.
			umaPessoa usuario: usuario]
		ifFalse: [usuario := umaPessoa usuario].
	usuario registraSe: self.
	usuarios at: usuario numero put: usuario.
	^usuario numero</body>
</methods>


<class>
<name>Biblioteca</name>
<environment>Mac441</environment>
<super>Mac441.CentroServico</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<static>
<name>UmItem</name>
<environment>Mac441.Biblioteca</environment>
<private>false</private>
<constant>false</constant>
<category>As yet unclassified</category>
</static>

<static>
<name>umItem</name>
<environment>Mac441.Biblioteca</environment>
<private>false</private>
<constant>false</constant>
<category>As yet unclassified</category>
</static>

<static>
<name>nome</name>
<environment>Mac441.Biblioteca</environment>
<private>false</private>
<constant>false</constant>
<category>As yet unclassified</category>
</static>

<static>
<name>Nome</name>
<environment>Mac441.Biblioteca</environment>
<private>false</private>
<constant>false</constant>
<category>As yet unclassified</category>
</static>

<methods>
<class-id>Mac441.Biblioteca</class-id> <category>emprestimos</category>

<body><B>emprestaFasciculoPara: umUsuario titulo: nomePublicacao volume: numVolume numero: oNumero 
	</B>^super
		emprestimoItem: nomePublicacao , numVolume printString , oNumero printString
		para: umUsuario
		data: Date today</body>

<body><B>emprestaLivroPara: umUsuario titulo: nomeLivro autores: osAutores ano: umAno 
	</B>^super
		emprestimoItem: nomeLivro , osAutores , umAno printString
		para: umUsuario
		data: Date today</body>

<body><B>novosAnaisPara: umUsuario titulo: nomeDoEvento ano: umAno 
	</B>^super
		emprestimoItem: nomeDoEvento , umAno printString
		para: umUsuario
		data: Date today</body>
</methods>

<methods>
<class-id>Mac441.Biblioteca</class-id> <category>acesso</category>

<body><B>existeAnais: numChamada 
	</B>acervo at: numChamada ifAbsent: [^false].
	^true</body>

<body><B>existeFasciculo: numChamada 
	</B>acervo at: numChamada ifAbsent: [^false].
	^true</body>

<body><B>existeLivro: numChamada 
	</B>acervo at: numChamada ifAbsent: [^false].
	^true</body>
</methods>

<methods>
<class-id>Mac441.Biblioteca</class-id> <category>criacao</category>

<body><B>novoFasciculo: nomePublicacao volume: numVolume numero: oNumero 
	</B>| numChamada fasciculo |
	numChamada := nomePublicacao , numVolume printString , oNumero printString.
	(self existeFasciculo: numChamada)
		ifFalse: 
			[fasciculo := Fasciculo new.
			fasciculo titulo: nomePublicacao.
			fasciculo numChamada: numChamada.
			fasciculo numero: oNumero volume: numVolume.
			fasciculo acervo: self].
	super novoItem: numChamada descricao: fasciculo.
	^fasciculo</body>

<body><B>novoLivro: nomeLivro autores: osAutores ano: umAno 
	</B>| numChamada livro |
	numChamada := nomeLivro , osAutores , umAno printString.
	(self existeLivro: numChamada)
		ifFalse: 
			[livro := Livro new.
			livro titulo: nomeLivro.
			livro numChamada: numChamada.
			livro autores: osAutores.
			livro ano: umAno.
			livro acervo: self].
	super novoItem: numChamada descricao: livro.
	^livro</body>

<body><B>novosAnais: nomeDoEvento ano: umAno 
	</B>| numChamada anais |
	numChamada := nomeDoEvento , umAno printString.
	(self existeAnais: numChamada)
		ifFalse: 
			[anais := Anais new.
			anais titulo: nomeDoEvento.
			anais numChamada: numChamada.
			anais ano: umAno.
			anais acervo: self].
	super novoItem: numChamada descricao: anais.
	^anais</body>
</methods>


<class>
<name>Fasciculo</name>
<environment>Mac441</environment>
<super>Mac441.Item</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>numero volume </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<methods>
<class-id>Mac441.Fasciculo</class-id> <category>acesso</category>

<body><B>numero
	</B>"Retorna o numero de um periodico."

	^numero</body>

<body>numero: qualNumero volume: qualVolume 
	"Altera o numero e o volume de um periÃ³dico."

	numero := qualNumero.
	volume := qualVolume</body>

<body>volume
	"Retorna o volume de um periÃ³dico."

	^volume</body>
</methods>


<class>
<name>Pessoa</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>nome rg endereco usuario </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<methods>
<class-id>Mac441.Pessoa</class-id> <category>acesso</category>

<body><B>endereco
	</B>^endereco</body>

<body>endereco: umaString
	endereco := umaString</body>

<body>nome
	^nome</body>

<body><B>nome: umaString 
	</B>nome := umaString</body>

<body>rg
	^rg</body>

<body>rg: umInteiro
	rg := umInteiro</body>

<body><B>usuario
	</B>^usuario</body>

<body><B>usuario: umUsuario 
	</B>usuario := umUsuario</body>
</methods>


<class>
<name>Hospital</name>
<environment>Mac441</environment>
<super>Mac441.CentroServico</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>atendimentos </inst-vars>
<class-inst-vars>qualAtendimento </class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<static>
<name>qualAtendimento</name>
<environment>Mac441.Hospital</environment>
<private>false</private>
<constant>false</constant>
<category>As yet unclassified</category>
</static>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Hospital class</class-id> <category>inicializacao</category>

<body><B>new
	</B>^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Hospital</class-id> <category>inicializacao</category>

<body><B>initialize
	</B>atendimentos := Dictionary new.
	qualAtendimento isNil ifTrue: [qualAtendimento := 0].
	super initialize</body>
</methods>

<methods>
<class-id>Mac441.Hospital</class-id> <category>emprestimos</category>

<body><B>emprestaCadeiraDeRodasPara: umUsuario
	</B>^super
		emprestimoItem: 'cadeiraDeRodas'
		para: umUsuario
		data: Date today</body>

<body><B>emprestaMuletaPara: umUsuario 
	</B>^super
		emprestimoItem: 'muleta'
		para: umUsuario
		data: Date today</body>

<body><B>emprestaTalaOrtopedicaPara: umUsuario
	</B>^super
		emprestimoItem: 'talaOrtopedica'
		para: umUsuario
		data: Date today</body>
</methods>

<methods>
<class-id>Mac441.Hospital</class-id> <category>criacao</category>

<body><B>novaCadeiraDeRodas
	</B>| cadeiraDeRodas |
	cadeiraDeRodas := CadeiraDeRodas new.
	cadeiraDeRodas titulo: 'cadeiraDeRodas'.
	cadeiraDeRodas numChamada: 'cadeiraDeRodas'.
	cadeiraDeRodas acervo: self.
	super novoItem: cadeiraDeRodas numChamada descricao: cadeiraDeRodas.
	^cadeiraDeRodas</body>

<body><B>novaMuleta
	</B>| muleta |
	muleta := Muleta new.
	muleta titulo: 'muleta'.
	muleta numChamada: 'muleta'.
	muleta acervo: self.
	super novoItem: muleta numChamada descricao: muleta.
	^muleta</body>

<body><B>novaTalaOrtopedica
	</B>| talaOrtopedica |
	talaOrtopedica := TalaOrtopedica new.
	talaOrtopedica titulo: 'talaOrtopedica'.
	talaOrtopedica numChamada: 'talaOrtopedica'.
	talaOrtopedica acervo: self.
	super novoItem: talaOrtopedica numChamada descricao: talaOrtopedica.
	^talaOrtopedica</body>
</methods>

<methods>
<class-id>Mac441.Hospital</class-id> <category>atendimentos</category>

<body><B>atendimento: idAtendimento descricao: umTexto 
	</B>| atendimento |
	atendimento := atendimentos at: idAtendimento.
	atendimento descricao: atendimento descricao , '    ' , umTexto</body>

<body><B>atendimentosPendentes
	</B>usuarios keysAndValuesDo: [:idUsuario :umUsuario | umUsuario atendimentosPendentes]</body>

<body><B>fimAtendimento: idAtendimento comentariosFinais: umTexto 
	</B>| atendimento usuario |
	atendimento := atendimentos at: idAtendimento.
	atendimento comentariosFinais: umTexto.
	usuario := atendimento usuario.
	usuario removeAtendimento: atendimento</body>

<body><B>novoAtendimentoPara: umUsuario descricao: umTexto dataInicio: umaData 
	</B>| atendimento |
	atendimento := Atendimento new.
	qualAtendimento := qualAtendimento + 1.
	atendimento id: qualAtendimento.
	atendimento usuario: (usuarios at: umUsuario).
	(usuarios at: umUsuario) atendimentos: atendimento.
	atendimento descricao: umTexto.
	atendimento dataInicio: umaData.
	atendimentos at: qualAtendimento put: atendimento.
	^qualAtendimento</body>

<body><B>prontuario: idUsuario 
	</B>| usuario |
	usuario := usuarios at: idUsuario.
	usuario prontuario</body>

<body><B>prontuario: idUsuario atendimento: idAtendimento 
	</B>| atendimento |
	atendimento := atendimentos at: idAtendimento.
	atendimento usuario numero = idUsuario
		ifTrue: [Transcript show: atendimento descricao; cr]
		ifFalse: [Transcript show: 'Usuario nao possui este atendimento.'; cr]</body>
</methods>


<class>
<name>CadeiraDeRodas</name>
<environment>Mac441</environment>
<super>Mac441.Item</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>


<class>
<name>Usuario</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>numero pessoa registraSe empresta atendimentos qtosAtendPend </inst-vars>
<class-inst-vars>geraNumUsuarios </class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Usuario class</class-id> <category>inicializacao</category>

<body>new
	"Construtor."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Usuario</class-id> <category>inicializacao</category>

<body><B>initialize
	</B>"Construtor."

	registraSe := Set new.
	empresta := Dictionary new.
	pessoa := nil.
	numero := nil.
	atendimentos := Set new.
	qtosAtendPend := 0.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Usuario</class-id> <category>registro</category>

<body><B>registraSe: umCentro 
	</B>registraSe add: umCentro</body>
</methods>

<methods>
<class-id>Mac441.Usuario</class-id> <category>atendimentos</category>

<body><B>atendimentosPendentes
	</B>qtosAtendPend &gt; 0
		ifTrue: 
			[Transcript show: pessoa nome , ':  '.
			atendimentos collect: [:umAtendimento | Transcript show: umAtendimento id printString , '  '].
			Transcript cr]</body>

<body><B>prontuario
	</B>atendimentos
		collect: 
			[:umAtendimento | 
			umAtendimento terminou ifFalse: [Transcript show: '*'].
			Transcript show: umAtendimento id printString; cr]</body>

<body><B>removeAtendimento: umAtendimento 
	</B>atendimentos remove: umAtendimento ifAbsent: [^false].
	qtosAtendPend := qtosAtendPend - 1</body>
</methods>

<methods>
<class-id>Mac441.Usuario</class-id> <category>acesso</category>

<body><B>atendimentos: umAtendimento 
	</B>atendimentos add: umAtendimento.
	qtosAtendPend := qtosAtendPend + 1</body>

<body>numero
	^numero</body>

<body>numero: umNumero
	numero := umNumero</body>

<body>pessoa
	^pessoa</body>

<body><B>pessoa: umaPessoa 
	</B>pessoa := umaPessoa</body>

<body><B>temEmprestimo: numChamada 
	</B>"Retorna um objeto emprestimo se o usuario tem um item 
	emprestado; nil caso contrario."

	^empresta at: numChamada ifAbsent: nil</body>
</methods>

<methods>
<class-id>Mac441.Usuario</class-id> <category>emprestimo</category>

<body><B>item: qualItem centro: umCentro data: umaData 
	</B>"Empresta qualItem de umaBiblioteca a um usuario."

	| t1 |
	empresta size &lt; 5
		ifTrue: [qualItem empresta size &lt; qualItem qtosItens
				ifTrue: 
					[t1 := Emprestimo new.
					t1 quemEmprestou: self.
					t1 itemEmprestado: qualItem.
					t1 qualCentro: umCentro.
					t1 dataDeSaida: Date today.
					t1 dataPrevistaDevolucao: umaData.
					empresta at: qualItem numChamada put: t1.
					qualItem empresta: t1]
				ifFalse: [Transcript cr; show: 'Este item ja esta emprestado.']]
		ifFalse: [Transcript cr; show: 'Cota de emprestimo excedida.']</body>

<body><B>removeEmprestimo: numChamada 
	</B>"Retira o emprestimo de um item (acessado via numChamada) 
	de um usuario."

	empresta removeKey: numChamada ifAbsent: nil</body>
</methods>


<class>
<name>Muleta</name>
<environment>Mac441</environment>
<super>Mac441.Item</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>



</st-source>
