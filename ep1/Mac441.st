<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, Release 5i.1 of January 24, 2000 on April 27, 2001 at 2:57:07 pm</time-stamp>


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
<name>Universidade</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>nome vinculaSe </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Universidade class</class-id> <category>inicializacao</category>

<body><B>new
	</B>"Construtor."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Universidade</class-id> <category>acesso</category>

<body><B>nome
	</B>"Retorna o nome de uma universidade."

	^nome</body>

<body><B>nome: umaString 
	</B>"Altera o nome de uma universidade."

	nome := umaString</body>

<body><B>vinculos
	</B>"Retorna o conjunto de vínculos de uma universidade."

	^vinculaSe</body>
</methods>

<methods>
<class-id>Mac441.Universidade</class-id> <category>vinculo</category>

<body><B>vinculaSe: umVinculo 
	</B>"Adiciona umVinculo ao conjunto de vínculos de uma 
	universidade."

	vinculaSe add: umVinculo</body>
</methods>

<methods>
<class-id>Mac441.Universidade</class-id> <category>inicializacao</category>

<body><B>initialize
	</B>"Construtor."

	nome := nil.
	vinculaSe := Set new.
	^self</body>
</methods>


<class>
<name>Vinculo</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>data vinculaSe universidade </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<methods>
<class-id>Mac441.Vinculo</class-id> <category>vinculo</category>

<body><B>vinculaSe: umUsuario universidade: umaUniversidade 
	</B>"Cria um vínculo entre umUsuario e umaUniversidade."

	universidade = nil
		ifTrue: 
			[vinculaSe := umUsuario.
			universidade := umaUniversidade.
			umaUniversidade vinculaSe: self.
			umUsuario vinculaSe: self]
		ifFalse: [Transcript show: 'Vínculo já existente com outra universidade.']</body>
</methods>

<methods>
<class-id>Mac441.Vinculo</class-id> <category>registro</category>

<body><B>registraSe
	</B>"Permite que um vínculo seja registrado como usuário de uma 
	biblioteca"

	^true</body>
</methods>

<methods>
<class-id>Mac441.Vinculo</class-id> <category>acesso</category>

<body><B>data
	</B>"Retorna a data de um vínculo."

	^data</body>

<body><B>data: umaString 
	</B>"Altera a data de um vínculo."

	data := umaString</body>
</methods>


<class>
<name>Item</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>numChamada titulo qualBiblioteca empresta </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<methods>
<class-id>Mac441.Item</class-id> <category>empresta</category>

<body><B>empresta: umEmprestimo 
	</B>"Associa um item a um objeto da classe Emprestimo."

	empresta := umEmprestimo</body>
</methods>

<methods>
<class-id>Mac441.Item</class-id> <category>acesso</category>

<body><B>empresta
	</B>"Retorna o status de empréstimo de um item."

	^empresta</body>

<body><B>numChamada
	</B>"Retorna o numChamada de um item."

	^numChamada</body>

<body><B>numChamada: umInteiro 
	</B>"Altera o numChamada de um item."

	numChamada := umInteiro</body>

<body><B>printString
	</B>"Imprime os atributos de instância de um item."

	Transcript cr.
	^'titulo: ' , titulo , '   numChamada: ' , numChamada printString</body>

<body><B>qualBiblioteca
	</B>"Retorna qualBiblioteca o item pertence."

	^qualBiblioteca</body>

<body><B>qualBiblioteca: umaBiblioteca 
	</B>"Altera qualBiblioteca o item pertence."

	qualBiblioteca := umaBiblioteca</body>

<body><B>titulo
	</B>"Retorna o titulo do item."

	^titulo</body>

<body><B>titulo: umString 
	</B>"Altera o titulo de um item."

	titulo := umString</body>
</methods>


<class>
<name>Periodico</name>
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
<class-id>Mac441.Periodico</class-id> <category>acesso</category>

<body><B>numero
	</B>"Retorna o numero de um periódico."

	^numero</body>

<body><B>numero: qualNumero volume: qualVolume 
	</B>"Altera o numero e o volume de um periódico."

	numero := qualNumero.
	volume := qualVolume</body>

<body><B>printString
	</B>"Retorna os atributos de instância de um periódico."

	Transcript cr.
	^'titulo: ' , titulo , '   numChamada: ' , numChamada printString , '   numero: ' , numero printString , '   volume: ' , volume printString</body>

<body><B>volume
	</B>"Retorna o volume de um periódico."

	^volume</body>
</methods>


<class>
<name>Proceedings</name>
<environment>Mac441</environment>
<super>Mac441.Item</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>evento </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<methods>
<class-id>Mac441.Proceedings</class-id> <category>acesso</category>

<body><B>evento
	</B>"Retorna o evento de um proceedings."

	^evento</body>

<body><B>evento: umaString 
	</B>"Altera o evento de um proceedings."

	evento := umaString</body>

<body><B>printString
	</B>"Retorna os atributos de instância de um proceedings."

	Transcript cr.
	^'titulo: ' , titulo , '   numChamada: ' , numChamada printString , '   evento: ' , evento</body>
</methods>


<class>
<name>Biblioteca</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>nome registraSe empresta itens </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

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

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Biblioteca class</class-id> <category>inicializacao</category>

<body><B>new
	</B>"Construtor."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Biblioteca</class-id> <category>associacao</category>

<body><B>associaSe: umaBiblioteca 
	</B>"Associa uma biblioteca a outra, adicionando umaBiblioteca ao 
	atributo empresta."

	empresta at: umaBiblioteca nome put: umaBiblioteca</body>
</methods>

<methods>
<class-id>Mac441.Biblioteca</class-id> <category>emprestimo</category>

<body><B>empresta: numChamada 
	</B>"Retorna um item da biblioteca se ele existir no seu dicionário de 
	itens; 0 caso contrário."

	^itens at: numChamada ifAbsent: [nil]</body>

<body><B>emprestimos
	</B>"Retorna um conjunto com todos os itens emprestador pela 
	biblioteca."

	| itensEmprestados |
	itensEmprestados := Set new.
	itens keysAndValuesDo: [:numChamada :qualItem | qualItem empresta = nil ifFalse: [itensEmprestados add: qualItem]].
	^itensEmprestados</body>

<body><B>existeItem: qualItem 
	</B>"Retorna true se qualItem existe na biblioteca; false caso 
	contrário."

	^(itens find: qualItem ifAbsent: nil)
		&lt;&gt; nil</body>

<body><B>usuario: nomeUsuario devolve: numChamada 
	</B>"Implementa a devolução de um item (acessado via 
	numChamada) por um usuário (acessado via nomeUsuario) à 
	biblioteca."

	| t1 umUsuario qualItem |
	umUsuario := registraSe at: nomeUsuario ifAbsent: nil.
	umUsuario = nil
		ifTrue: 
			[Transcript cr; show: 'Usuário não registrado nesta biblioteca.'.
			^nil]
		ifFalse: 
			[t1 := umUsuario temEmprestimo: numChamada.
			t1 = nil
				ifTrue: 
					[Transcript cr; show: 'Não há registro de empréstimo.'.
					^nil]
				ifFalse: [t1 qualBiblioteca = self
						ifTrue: 
							[qualItem := t1 itemEmprestado.
							t1 dataDeDevolucao: Date today.
							qualItem empresta: nil.
							umUsuario removeEmprestimo: numChamada.
							^t1]
						ifFalse: 
							[Transcript cr; show: 'O item não foi emprestado por esta biblioteca.'.
							^nil]]]</body>

<body><B>usuario: nomeUsuario empresta: numChamada 
	</B>"Implementa o empréstimo de um item (acessado via 
	numChamada) da biblioteca a um usuário (acessado via 
	nomeUsuario)."

	| umUsuario qualItem |
	(registraSe includesKey: nomeUsuario)
		ifTrue: 
			[umUsuario := registraSe at: nomeUsuario.
			(itens includesKey: numChamada)
				ifTrue: 
					[qualItem := itens at: numChamada.
					umUsuario item: qualItem biblioteca: self.
					^true]
				ifFalse: 
					[empresta
						keysAndValuesDo: 
							[:nomeBibAux :bibAux | 
							qualItem := bibAux empresta: numChamada.
							qualItem = nil
								ifFalse: 
									[umUsuario item: qualItem biblioteca: self.
									^true]].
					Transcript cr; show: 'Item não disponível.']]
		ifFalse: [Transcript cr; show: 'Usuário não registrado nesta biblioteca.'].
	^false</body>
</methods>

<methods>
<class-id>Mac441.Biblioteca</class-id> <category>aquisicao</category>

<body><B>adquiri: qualItem 
	</B>"Faz com que a biblioteca adquira um novo item."

	itens at: qualItem numChamada put: qualItem.
	qualItem qualBiblioteca: self.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Biblioteca</class-id> <category>inicializacao</category>

<body><B>initialize
	</B>"Construtor."

	nome := nil.
	registraSe := Dictionary new.
	empresta := Dictionary new.
	itens := Dictionary new.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Biblioteca</class-id> <category>acesso</category>

<body><B>nome
	</B>"Retorna o nome da biblioteca."

	^nome</body>

<body><B>nome: umaString 
	</B>"Altera o nome da biblioteca."

	nome := umaString</body>

<body><B>registraSe: umUsuario 
	</B>"Registra umUsuario na biblioteca."

	registraSe at: umUsuario nome put: umUsuario</body>
</methods>


<class>
<name>Livro</name>
<environment>Mac441</environment>
<super>Mac441.Item</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>autor </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<methods>
<class-id>Mac441.Livro</class-id> <category>acesso</category>

<body><B>autor
	</B>"Retorna o autor de um livro."

	^autor</body>

<body><B>autor: umaString 
	</B>"Altera o autor de um livro."

	autor := umaString</body>

<body><B>printString
	</B>"Retorna os atributos de instância de um livro."

	Transcript cr.
	^'titulo: ' , titulo , '   numChamada: ' , numChamada printString , '   autor: ' , autor</body>
</methods>


<class>
<name>Funcionario</name>
<environment>Mac441</environment>
<super>Mac441.Vinculo</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>cargo </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<methods>
<class-id>Mac441.Funcionario</class-id> <category>acesso</category>

<body><B>cargo
	</B>"Retorna o cargo do funcionário."

	^cargo</body>

<body><B>cargo: umaString 
	</B>"Altera o cargo do funcionário."

	cargo := umaString</body>
</methods>

<methods>
<class-id>Mac441.Funcionario</class-id> <category>registraSe</category>

<body><B>registraSe
	</B>"Não permite que um funcionário seja registrado como usuário de 
	uma biblioteca"

	Transcript cr; show: 'Vínculo inválido.'.
	^false</body>
</methods>


<class>
<name>Professor</name>
<environment>Mac441</environment>
<super>Mac441.Vinculo</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>disciplina </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<methods>
<class-id>Mac441.Professor</class-id> <category>acesso</category>

<body><B>disciplina
	</B>"Retorna a disciplina de um professor."

	^disciplina</body>

<body><B>disciplina: umaString 
	</B>"Altera a disciplina de um professor."

	disciplina := umaString</body>
</methods>


<class>
<name>Aluno</name>
<environment>Mac441</environment>
<super>Mac441.Vinculo</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>numUSP </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<methods>
<class-id>Mac441.Aluno</class-id> <category>acesso</category>

<body><B>numUSP
	</B>"Retorna o numUSP do aluno."

	^numUSP</body>

<body><B>numUSP: umInteiro 
	</B>"Altera o numUSP do aluno."

	numUSP := umInteiro</body>
</methods>


<class>
<name>Emprestimo</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>quemEmprestou itemEmprestado qualBiblioteca dataDeSaida dataDeDevolucao dataPrevistaDevolucao </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<methods>
<class-id>Mac441.Emprestimo</class-id> <category>acesso</category>

<body><B>dataDeDevolucao
	</B>"Retorna a dataDeDevolucao do item emprestado."

	^dataDeDevolucao</body>

<body><B>dataDeDevolucao: umaString 
	</B>"Altera a dataDeDevolucao do item emprestado."

	dataDeDevolucao := umaString</body>

<body><B>dataDeSaida: umaString 
	</B>"Altera a dataDeSaida do item emprestado."

	dataDeSaida := umaString</body>

<body><B>dataPrevistaDevolucao
	</B>"Retorna a dataPrevistaDevolucao do item emprestado."

	^dataPrevistaDevolucao</body>

<body><B>dataPrevistaDevolucao: umaString 
	</B>"Altera a dataPrevistaDevolucao do item emprestado."

	dataPrevistaDevolucao := umaString</body>

<body><B>itemEmprestado
	</B>"Retorna o itemEmprestado."

	^itemEmprestado</body>

<body><B>itemEmprestado: qualItem 
	</B>"Altera o itemEmprestado."

	itemEmprestado := qualItem</body>

<body><B>qualBiblioteca
	</B>"Retorna qualBiblioteca emprestou o item."

	^qualBiblioteca</body>

<body><B>qualBiblioteca: umaBiblioteca 
	</B>"Altera qualBiblioteca emprestou o item."

	qualBiblioteca := umaBiblioteca</body>

<body><B>quemEmprestou
	</B>"Retorna quemEmprestou o item."

	^quemEmprestou</body>

<body><B>quemEmprestou: umUsuario 
	</B>"Altera quemEmprestou o item."

	quemEmprestou := umUsuario</body>
</methods>


<class>
<name>Usuario</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>nome rg registraSe vinculaSe empresta </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Usuario class</class-id> <category>inicializacao</category>

<body><B>new
	</B>"Construtor."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Usuario</class-id> <category>inicializacao</category>

<body><B>initialize
	</B>"Construtor."

	nome := nil.
	rg := nil.
	registraSe := Set new.
	vinculaSe := Dictionary new.
	empresta := Dictionary new.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Usuario</class-id> <category>registro</category>

<body><B>registraSe: umaBiblioteca 
	</B>"Adiciona umaBiblioteca ao conjunto de bibliotecas registradas de 
	um usuário."

	vinculaSe registraSe
		ifTrue: 
			[registraSe add: umaBiblioteca.
			umaBiblioteca registraSe: self]</body>
</methods>

<methods>
<class-id>Mac441.Usuario</class-id> <category>acesso</category>

<body><B>nome
	</B>"Retorna o nome de um usuário."

	^nome</body>

<body><B>nome: umaString 
	</B>"Altera o nome de um usuário."

	nome := umaString</body>

<body><B>rg
	</B>"Retorna o rg de um usuário."

	^rg</body>

<body><B>rg: umInteiro 
	</B>"Altera o rg de um usuário."

	rg := umInteiro</body>

<body><B>temEmprestimo: numChamada 
	</B>"Retorna um objeto empréstimo se o usuário tem um item 
	emprestado; nil caso contrário."

	^empresta at: numChamada ifAbsent: nil</body>

<body><B>vinculaSe: umVinculo 
	</B>"Altera o vinculaSe de um usuário."

	vinculaSe := umVinculo</body>
</methods>

<methods>
<class-id>Mac441.Usuario</class-id> <category>emprestimo</category>

<body><B>item: qualItem biblioteca: umaBiblioteca 
	</B>"Empresta qualItem de umaBiblioteca a um usuário."

	| t1 |
	empresta size &lt; 3
		ifTrue: [qualItem empresta = nil
				ifTrue: 
					[t1 := Emprestimo new.
					t1 quemEmprestou: self.
					t1 itemEmprestado: qualItem.
					t1 qualBiblioteca: umaBiblioteca.
					t1 dataDeSaida: Date today.
					t1 dataPrevistaDevolucao: (Date today addDays: 7).
					empresta at: qualItem numChamada put: t1.
					qualItem empresta: t1]
				ifFalse: [Transcript cr; show: 'Este item já está emprestado.']]
		ifFalse: [Transcript cr; show: 'Cota de empréstimo excedida.']</body>

<body><B>removeEmprestimo: numChamada 
	</B>"Retira o empréstimo de um item (acessado via numChamada) 
	de um usuário."

	empresta removeKey: numChamada ifAbsent: nil</body>
</methods>



</st-source>
