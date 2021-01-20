<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, Release 5i.1 of January 24, 2000 on June 12, 2001 at 2:13:11 pm</time-stamp>


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
<name>Unidade</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>objects</indexed-type>
<inst-vars>nome universidade departamentos setores </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Unidade class</class-id> <category>inicializacao</category>

<body>new
	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Unidade</class-id> <category>fimDeSemestre</category>

<body>fimDeSemestre
	departamentos collect: [:umDepartamento | umDepartamento fimDeSemestre]</body>
</methods>

<methods>
<class-id>Mac441.Unidade</class-id> <category>inicializacao</category>

<body>initialize
	nome := nil.
	universidade := Universidade new.
	universidade adicionaUnidade: self.
	departamentos := Set new.
	setores := Set new.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Unidade</class-id> <category>vinculacao</category>

<body>novoDepartamento: umDepartamento 
	departamentos add: umDepartamento.
	umDepartamento unidade: self</body>

<body>novoSetor: umSetor
	setores add: umSetor.
	umSetor unidade: self.</body>
</methods>

<methods>
<class-id>Mac441.Unidade</class-id> <category>acesso</category>

<body>departamentos
	^departamentos</body>

<body>displayString
	^nome isNil ifFalse: [nome]
		ifTrue: ['']</body>

<body>nome
	^nome</body>

<body>nome: umaString
	nome := umaString</body>

<body>setores
	^setores</body>

<body>universidade
	^universidade</body>

<body>universidade: umaUniversidade 
	universidade := umaUniversidade</body>
</methods>

<methods>
<class-id>Mac441.Unidade</class-id> <category>pagamento</category>

<body>folhaDePagamento
	Transcript show: nome; cr.
	setores collect: [:umSetor | umSetor folhaDePagamento]</body>
</methods>

<methods>
<class-id>Mac441.Unidade</class-id> <category>catalogo</category>

<body>catalogo
	Transcript show: nome; cr.
	departamentos collect: [:umDepartamento | umDepartamento catalogo]</body>
</methods>


<class>
<name>UICadCargaDidatica</name>
<environment>Mac441</environment>
<super>UI.ApplicationModel</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>janelaPrinc uspAdap unidadeAdap departamentoAdap disciplinaAdap horarioAdap setHorarioAdap docenteAdap turmaAdap listaDocentes ementa nomeDisciplina aspectDepartamento aspectUnidade aspectDisciplina ncaspectDia ncaspectNome nclistaHorarios ncaspectHora ncaspectSenha listaDepartamentos listaUnidades listaDisciplinas nclistaNomes </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<static>
<name>DisciplinaAtual</name>
<environment>Mac441.UICadCargaDidatica</environment>
<private>false</private>
<constant>false</constant>
<category>As yet unclassified</category>
</static>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.UICadCargaDidatica class</class-id> <category>interface specs</category>

<body>novaCarga
	"UIPainter new openOnClass: self andSelector: #novaCarga"

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec} 
		#window: 
		#(#{UI.WindowSpec} 
			#label: #tituloJanelaNC 
			#bounds: #(#{Graphics.Rectangle} 191 217 609 415 ) ) 
		#component: 
		#(#{UI.SpecCollection} 
			#collection: #(
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 0 -1 ) 
					#name: #labDocente 
					#label: 'Docente' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 126 -1 ) 
					#name: #labSenha 
					#label: 'Senha' ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 127 18 215 39 ) 
					#name: #edtSenha 
					#flags: 40 
					#model: #ncaspectSenha 
					#callbacksSpec: 
					#(#{UI.UIEventCallbackSubSpec} 
						#requestValueChangeSelector: 
						#ncverificaSenha: ) 
					#type: #password ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 220 16 269 41 ) 
					#name: #btnConfirma 
					#flags: 40 
					#model: #ncconfirmaSenha 
					#label: 'Confirma' 
					#defaultable: true ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 2 90 ) 
					#name: #labDia 
					#label: 'Dia' ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 5 109 53 129 ) 
					#name: #idDia 
					#flags: 40 
					#model: #ncaspectDia ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 61 90 ) 
					#name: #labHorarioInic 
					#label: 'HorÃÂ¡rio' ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 63 109 166 130 ) 
					#name: #idHora 
					#flags: 40 
					#model: #ncaspectHora ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 183 95 211 120 ) 
					#name: #idInsere 
					#flags: 40 
					#model: #ncadicionaHora 
					#label: '&gt;&gt;' 
					#defaultable: true ) 
				#(#{UI.SequenceViewSpec} 
					#layout: #(#{Graphics.Rectangle} 217 91 417 152 ) 
					#name: #idListaHorarios 
					#flags: 45 
					#model: #nclistaHorarios 
					#callbacksSpec: 
					#(#{UI.UIEventCallbackSubSpec} 
						#requestValueChangeSelector: 
						#ncverificaListaHorario: ) 
					#useModifierKeys: true 
					#selectionType: #highlight ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 183 120 211 145 ) 
					#name: #idRemove 
					#flags: 40 
					#model: #ncremoveHora 
					#label: '&lt;&lt;' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 164 167 213 192 ) 
					#name: #idOk 
					#flags: 40 
					#model: #nccriaTurma 
					#label: 'Ok' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 218 167 267 192 ) 
					#name: #btnCancela 
					#model: #nccancelar 
					#label: 'Cancela' 
					#defaultable: true ) 
				#(#{UI.SequenceViewSpec} 
					#layout: #(#{Graphics.Rectangle} 2 18 119 77 ) 
					#model: #nclistaNomes 
					#callbacksSpec: 
					#(#{UI.UIEventCallbackSubSpec} 
						#valueChangeSelector: #ncativaConfirmacao ) 
					#useModifierKeys: true 
					#selectionType: #highlight ) ) ) )</body>

<body>windowSpec
	"UIPainter new openOnClass: self andSelector: #windowSpec"

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec} 
		#window: 
		#(#{UI.WindowSpec} 
			#label: 'Carga didÃÂ¡tica' 
			#bounds: #(#{Graphics.Rectangle} 5 160 360 568 ) ) 
		#component: 
		#(#{UI.SpecCollection} 
			#collection: #(
				#(#{UI.DividerSpec} 
					#layout: #(#{Graphics.Rectangle} -32 167 522 171 ) ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 2 -1 ) 
					#name: #labUnidade 
					#label: 'Unidade' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 167 -1 ) 
					#name: #labDepartamento 
					#label: 'Departamento' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 5 93 ) 
					#name: #labDisciplina 
					#label: 'Disciplina' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 3 170 ) 
					#label: 'Nome da Disciplina' ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 6 194 340 221 ) 
					#model: #nomeDisciplina 
					#callbacksSpec: 
					#(#{UI.UIEventCallbackSubSpec} 
						#requestValueChangeSelector: #verificaNomeDisciplina ) 
					#tabable: false 
					#isReadOnly: true ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 3 226 ) 
					#name: #labDocente 
					#label: 'Docentes e HorÃÂ¡rios' ) 
				#(#{UI.SequenceViewSpec} 
					#layout: #(#{Graphics.Rectangle} 4 244 308 290 ) 
					#name: #lsbDocentes 
					#model: #listaDocentes 
					#useModifierKeys: true 
					#selectionType: #highlight ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 5 297 ) 
					#label: 'Ementa' ) 
				#(#{UI.TextEditorSpec} 
					#layout: #(#{Graphics.Rectangle} 5 318 165 402 ) 
					#model: #ementa 
					#isReadOnly: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 218 323 267 348 ) 
					#name: #btnOk 
					#model: #confirma 
					#label: 'Ok' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 218 358 267 383 ) 
					#name: #btnNovo 
					#flags: 40 
					#model: #novaCargaDidatica 
					#label: 'Novo' 
					#defaultable: true ) 
				#(#{UI.SequenceViewSpec} 
					#layout: #(#{Graphics.Rectangle} 4 22 149 90 ) 
					#model: #listaUnidades 
					#callbacksSpec: 
					#(#{UI.UIEventCallbackSubSpec} 
						#valueChangeSelector: #atualizaDepartamentos ) 
					#useModifierKeys: true 
					#selectionType: #highlight ) 
				#(#{UI.SequenceViewSpec} 
					#layout: #(#{Graphics.Rectangle} 169 22 336 90 ) 
					#model: #listaDepartamentos 
					#callbacksSpec: 
					#(#{UI.UIEventCallbackSubSpec} 
						#valueChangeSelector: #atualizaDisciplinas ) 
					#useModifierKeys: true 
					#selectionType: #highlight ) 
				#(#{UI.SequenceViewSpec} 
					#layout: #(#{Graphics.Rectangle} 6 115 216 163 ) 
					#model: #listaDisciplinas 
					#callbacksSpec: 
					#(#{UI.UIEventCallbackSubSpec} 
						#valueChangeSelector: #atualizaTurmas ) 
					#useModifierKeys: true 
					#selectionType: #highlight ) ) ) )</body>
</methods>

<methods>
<class-id>Mac441.UICadCargaDidatica class</class-id> <category>atualizacao</category>

<body>tituloJanelaNC
	| texto |
	DisciplinaAtual numero isNil ifFalse: [texto := 'Nova turma de ' , DisciplinaAtual numero]
		ifTrue: [texto := 'Nova turma'].
	^texto</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.UICadCargaDidatica</class-id> <category>actionsnc</category>

<body>listaDocentesDoDepartamento
	| lista departamento |
	lista := List new.
	departamento := departamentoAdap value.
	departamento docentes collect: [:umDoc | umDoc isNil ifFalse: [lista add: umDoc]].
	nclistaNomes list: lista</body>

<body>ncadicionaHora
	horarioAdap value diaDaSemana isNil ifFalse: [horarioAdap value horario isNil
			ifFalse: 
				[self nclistaHorarios list add: horarioAdap value.
				setHorarioAdap add: horarioAdap value.
				horarioAdap value: DiaEHorario new]]</body>

<body>nccancelar
	^self closeRequest</body>

<body>ncconfirmaSenha
	| w |
	docenteAdap value senha = ncaspectSenha value ifFalse: [Dialog warn: 'Senha incorreta.']
		ifTrue: 
			[w := self builder componentAt: #idDia.
			w enable.
			w := self builder componentAt: #idHora.
			w enable.
			w := self builder componentAt: #idListaHorarios.
			w enable.
			w := self builder componentAt: #idInsere.
			w enable.
			w := self builder componentAt: #idRemove.
			w enable.
			w := self builder componentAt: #idOk.
			w enable]</body>

<body>nccriaTurma
	departamentoAdap value
		atribui: disciplinaAdap value numero
		a: docenteAdap value
		horario: setHorarioAdap.
	self atualizaTurmas.
	self closeRequest</body>

<body>ncremoveHora
	| index horarioRemovido |
	index := nclistaHorarios selectionIndex.
	index = 0
		ifTrue: [Dialog warn: 'Selecione o horÃÂ¡rio a ser removido.']
		ifFalse: 
			[horarioRemovido := nclistaHorarios selection.
			setHorarioAdap remove: horarioRemovido.
			nclistaHorarios list removeAtIndex: index]</body>
</methods>

<methods>
<class-id>Mac441.UICadCargaDidatica</class-id> <category>actions</category>

<body>changeRequest
	^true</body>

<body>confirma
	janelaPrinc window sensor eventQuit: nil</body>

<body>listaDepartamentosDa: umaUnidade 
	| lista |
	lista := List new.
	umaUnidade departamentos do: [:umDepto | lista add: umDepto].
	^lista</body>

<body>listaDisciplinasDo: umDepto 
	| lista |
	lista := List new.
	umDepto disciplinas keysAndValuesDo: [:numeroDisc :umaDisc | lista add: umaDisc].
	^lista</body>

<body>listaDocenteDa: umaDisciplina 
	| lista |
	lista := List new.
	umaDisciplina turmas do: [:umaTurma | lista add: umaTurma].
	^lista</body>

<body>listaUnidadesDaUniversidade
	| lista |
	lista := List new.
	Universidade new unidades collect: [:umaUnidade | umaUnidade isNil ifFalse: [lista add: umaUnidade]].
	listaUnidades list: lista</body>

<body>novaCargaDidatica
	disciplinaAdap value departamento isNil
		ifFalse: 
			[self initializeNC.
			self openInterface: #novaCarga]
		ifTrue: [Dialog warn: 'Escolha um nome vÃÂ¡lido de uma disciplina.']</body>

<body>sair
	janelaPrinc window sensor eventQuit: nil</body>
</methods>

<methods>
<class-id>Mac441.UICadCargaDidatica</class-id> <category>atualizacao</category>

<body>atualizaDepartamentos
	| unidade |
	unidade := listaUnidades selection.
	unidadeAdap value: unidade.
	unidade nome isNil ifFalse: [listaDepartamentos list: (self listaDepartamentosDa: unidade)]</body>

<body>atualizaDisciplinas
	| departamento |
	departamento := listaDepartamentos selection.
	departamentoAdap value: departamento.
	departamento nome isNil ifFalse: [listaDisciplinas list: (self listaDisciplinasDo: departamento)]</body>

<body>atualizaTurmas
	| disciplina w |
	w := self builder componentAt: #btnNovo.
	w isNil ifFalse: [w enable].
	disciplina := listaDisciplinas selection.
	disciplinaAdap value: disciplina.
	DisciplinaAtual := disciplina." asValue."
	disciplina nome isNil ifFalse: [listaDocentes list: (self listaDocenteDa: disciplina)]</body>
</methods>

<methods>
<class-id>Mac441.UICadCargaDidatica</class-id> <category>aspectsnc</category>

<body>ncaspectDia
	ncaspectDia := AspectAdaptor subjectChannel: horarioAdap.
	ncaspectDia forAspect: #diaDaSemana.
	ncaspectDia accessWith: #diaDaSemana assignWith: #diaDaSemana:.
	ncaspectDia subjectSendsUpdates: true.
	^ncaspectDia</body>

<body>ncaspectHora
	ncaspectHora := AspectAdaptor subjectChannel: horarioAdap.
	ncaspectHora forAspect: #horario.
	ncaspectHora accessWith: #horario assignWith: #horario:.
	ncaspectHora subjectSendsUpdates: true.
	^ncaspectHora</body>

<body>ncaspectNome
	ncaspectNome := AspectAdaptor subjectChannel: docenteAdap.
	ncaspectNome forAspect: #pessoa.
	ncaspectNome accessWith: #nome assignWith: #nome:.
	ncaspectNome subjectSendsUpdates: true.
	^ncaspectNome</body>

<body>ncaspectSenha
	^ncaspectSenha isNil
		ifTrue: [ncaspectSenha := String new asValue]
		ifFalse: [ncaspectSenha]</body>

<body>nclistaHorarios
	^nclistaHorarios isNil
		ifTrue: [nclistaHorarios := SelectionInList new]
		ifFalse: [nclistaHorarios]</body>

<body>nclistaNomes
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."

	^nclistaNomes isNil
		ifTrue:
			[nclistaNomes := SelectionInList new]
		ifFalse:
			[nclistaNomes]</body>
</methods>

<methods>
<class-id>Mac441.UICadCargaDidatica</class-id> <category>aspects</category>

<body>ementa
	ementa := AspectAdaptor subjectChannel: disciplinaAdap.
	ementa forAspect: #ementa.
	ementa accessWith: #ementa assignWith: #ementa:.
	ementa subjectSendsUpdates: true.
	^ementa</body>

<body>listaDepartamentos
	^listaDepartamentos isNil
		ifTrue: [listaDepartamentos := SelectionInList new]
		ifFalse: [listaDepartamentos]</body>

<body>listaDisciplinas
	^listaDisciplinas isNil
		ifTrue: [listaDisciplinas := SelectionInList new]
		ifFalse: [listaDisciplinas]</body>

<body>listaDocentes
	^listaDocentes isNil
		ifTrue: [listaDocentes := SelectionInList new]
		ifFalse: [listaDocentes]</body>

<body>listaUnidades
	^listaUnidades isNil
		ifTrue: [listaUnidades := SelectionInList new]
		ifFalse: [listaUnidades]</body>

<body>nomeDisciplina
	nomeDisciplina := AspectAdaptor subjectChannel: disciplinaAdap.
	nomeDisciplina forAspect: #nome.
	nomeDisciplina accessWith: #nome assignWith: #nome:.
	nomeDisciplina subjectSendsUpdates: true.
	^nomeDisciplina</body>
</methods>

<methods>
<class-id>Mac441.UICadCargaDidatica</class-id> <category>inicializacao</category>

<body>initialize
	uspAdap := Universidade new.
	unidadeAdap := Unidade new asValue.
	departamentoAdap := Departamento new asValue.
	disciplinaAdap := Disciplina new asValue.
	self listaUnidades.
	self listaDepartamentos.
	self listaDisciplinas.
	self listaDocentes.
	DisciplinaAtual := Disciplina new.
	janelaPrinc := nil.
	self listaUnidadesDaUniversidade</body>

<body>initializeNC
	docenteAdap := Docente new asValue.
	horarioAdap := DiaEHorario new asValue.
	turmaAdap := Turma new asValue.
	nclistaHorarios := SelectionInList new.
	setHorarioAdap := Set new.
	ncaspectSenha := String new asValue.
	self nclistaNomes.
	self listaDocentesDoDepartamento</body>

<body>openInterface: aInterface 
	janelaPrinc isNil
		ifTrue: [janelaPrinc := super openInterface: aInterface]
		ifFalse: [super openInterface: aInterface].
	"DisciplinaAtual := disciplinaAdap"</body>
</methods>

<methods>
<class-id>Mac441.UICadCargaDidatica</class-id> <category>verificacaonc</category>

<body>ncativaConfirmacao
	| w |
	docenteAdap value: nclistaNomes selection.
	w := self builder componentAt: #btnConfirma.
	w enable.
	w := self builder componentAt: #edtSenha.
	w enable</body>

<body>ncverificaListaHorario: entradaListaHorario 
	^true</body>

<body>ncverificaNome: entradaNome 
	| temp w |
	w := self builder componentAt: #idDia.
	w disable.
	w := self builder componentAt: #idHora.
	w disable.
	w := self builder componentAt: #idListaHorarios.
	w disable.
	w := self builder componentAt: #idInsere.
	w disable.
	w := self builder componentAt: #idRemove.
	w disable.
	w := self builder componentAt: #idOk.
	w disable.
	temp := departamentoAdap value docentes at: entradaNome editValue ifAbsent: [nil].
	temp isNil
		ifTrue: [^false]
		ifFalse: 
			[docenteAdap value: temp.
			^true]</body>

<body>ncverificaSenha: entradaSenha 
	| w |
	w := self builder componentAt: #idDia.
	w disable.
	w := self builder componentAt: #idHora.
	w disable.
	w := self builder componentAt: #idListaHorarios.
	w disable.
	w := self builder componentAt: #idInsere.
	w disable.
	w := self builder componentAt: #idRemove.
	w disable.
	w := self builder componentAt: #idOk.
	w disable.
	^true</body>
</methods>

<methods>
<class-id>Mac441.UICadCargaDidatica</class-id> <category>verificacao</category>

<body>verificaDepartamento: entradaDepartamento 
	disciplinaAdap value: Disciplina new.
	listaDocentes list: List new.
	unidadeAdap value departamentos collect: [:umDepto | umDepto nome = entradaDepartamento editValue
			ifTrue: 
				[departamentoAdap value: umDepto.
				^true]].
	departamentoAdap value: Departamento new.
	^false</body>

<body>verificaDisciplina: entradaDisciplina 
	| temp |
	listaDocentes list: List new.
	temp := departamentoAdap value disciplinas at: entradaDisciplina editValue ifAbsent: [nil].
	temp isNil
		ifTrue: 
			[disciplinaAdap value: Disciplina new.
			^false]
		ifFalse: 
			[disciplinaAdap value: temp.
			^true]</body>

<body>verificaDocentes
	^true</body>

<body>verificaUnidade: entradaUnidade 
	departamentoAdap value: Departamento new.
	disciplinaAdap value: Disciplina new.
	listaDocentes list: List new.
	uspAdap unidades collect: [:umaUnidade | umaUnidade nome = entradaUnidade editValue
			ifTrue: 
				[unidadeAdap value: umaUnidade.
				^true]].
	unidadeAdap value: Unidade new.
	^false</body>
</methods>


<class>
<name>Relogio</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>dia mes ano </inst-vars>
<class-inst-vars>Processo </class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<static>
<name>Processo</name>
<environment>Mac441.Relogio</environment>
<private>false</private>
<constant>false</constant>
<category>As yet unclassified</category>
</static>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Relogio</class-id> <category>acesso</category>

<body>ano
	^ano</body>

<body>ano: umNumero 
	ano := umNumero</body>

<body>dia
	^dia</body>

<body>dia: umNumero 
	(umNumero &gt; 0 and: [umNumero &lt;= 28])
		ifTrue: [^dia := umNumero].
	mes isNil
		ifFalse: 
			[mes even
				ifTrue: [mes = 2
						ifTrue: [umNumero = 29 ifTrue: [ano isNil ifFalse: [(ano rem: 4)
										= 0 ifTrue: [^dia := umNumero]]]]
						ifFalse: [(umNumero = 29 or: [umNumero = 30])
								ifTrue: [^dia := umNumero]]]
				ifFalse: [(umNumero &gt; 28 and: [umNumero &lt;= 31])
						ifTrue: [^dia := umNumero]].
			self mes: self mes + 1]
		ifTrue: [(umNumero &gt;= 29 and: [umNumero &lt;= 31])
				ifTrue: [^dia := umNumero]].
	^dia := 1</body>

<body>mes
	^mes</body>

<body>mes: umNumero 
	(umNumero &gt; 0 and: [umNumero &lt;= 12])
		ifTrue: [mes := umNumero]
		ifFalse: 
			[mes := 1.
			self ano: self ano + 1]</body>
</methods>


<class>
<name>Fachada</name>
<environment>Mac441</environment>
<super>UI.ApplicationModel</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Fachada class</class-id> <category>interface specs</category>

<body>windowSpec
	"UIPainter new openOnClass: self andSelector: #windowSpec"

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec} 
		#window: 
		#(#{UI.WindowSpec} 
			#label: 'Sistema de Controle de Universidade' 
			#min: #(#{Core.Point} 285 218 ) 
			#max: #(#{Core.Point} 427 352 ) 
			#bounds: #(#{Graphics.Rectangle} 187 124 472 342 ) ) 
		#component: 
		#(#{UI.SpecCollection} 
			#collection: #(
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 69 39 218 74 ) 
					#name: #btnMatricula 
					#model: #abreMatricula 
					#label: 'MatrÃ­cula' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 69 74 218 109 ) 
					#name: #btnCarga 
					#model: #abreCargaDidatica 
					#label: 'Carga didÃ¡tica' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 69 109 218 144 ) 
					#name: #btnRelogio 
					#model: #abreRelogio 
					#label: 'RelÃ³gio' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 69 144 218 179 ) 
					#name: #btnSair 
					#model: #sair 
					#label: 'Fim' 
					#defaultable: true ) ) ) )</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Fachada</class-id> <category>opcoesDoMenu</category>

<body>abreCargaDidatica
	UICadCargaDidatica open</body>

<body>abreMatricula
	UICadMatricula open</body>

<body>abreRelogio
	UIRelogio open</body>

<body>sair
	self closeRequest</body>
</methods>


<class>
<name>Pagamento</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>salarioBase qtasHorasTrab </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<methods>
<class-id>Mac441.Pagamento</class-id> <category>pagamento</category>

<body>calculaSalario
	^salarioBase</body>
</methods>

<methods>
<class-id>Mac441.Pagamento</class-id> <category>acesso</category>

<body>qtasHorasTrab: umInteiro 
	qtasHorasTrab := umInteiro</body>

<body>salarioBase: umInteiro
	salarioBase := umInteiro</body>
</methods>

<methods>
<class-id>Mac441.Pagamento</class-id> <category>imposto</category>

<body>impostoDeRenda: umInteiro 
	umInteiro &lt;= 600
		ifTrue: [^0]
		ifFalse: [umInteiro &lt;= 1200
				ifTrue: [^umInteiro * 0.12]
				ifFalse: [^umInteiro * 0.3]]</body>
</methods>


<class>
<name>Aluno</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>numeroUSP pessoa departamento matriculas qtasTurmas historicoEscolar senha </inst-vars>
<class-inst-vars>qtosAlunos </class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Aluno class</class-id> <category>inicializacao</category>

<body>new
	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Aluno</class-id> <category>inicializacao</category>

<body>initialize
	numeroUSP := nil.
	pessoa := nil.
	matriculas := Set new.
	departamento := nil.
	qtasTurmas := 0.
	historicoEscolar := Set new.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Aluno</class-id> <category>acesso</category>

<body>departamento
	^departamento</body>

<body>departamento: umDepartamento 
	departamento := umDepartamento</body>

<body>historicoEscolar
	^historicoEscolar</body>

<body>historicoEscolar: umHistoricoEscolar 
	historicoEscolar add: umHistoricoEscolar</body>

<body>matriculas
	^matriculas</body>

<body>matriculas: umaMatricula 
	matriculas add: umaMatricula.
	qtasTurmas := qtasTurmas + 1</body>

<body>numeroUSP
	^numeroUSP</body>

<body>numeroUSP: umInteiro 
	numeroUSP := umInteiro</body>

<body>pessoa
	^pessoa</body>

<body>pessoa: umaPessoa 
	pessoa := umaPessoa</body>

<body>qtasTurmas
	^qtasTurmas</body>

<body>removeMatricula: umaMatricula 
	qtasTurmas := qtasTurmas - 1.
	matriculas remove: umaMatricula ifAbsent: [nil]</body>

<body>senha
	^senha</body>

<body>senha: umaString 
	senha := umaString</body>

<body>situacaoNoSemestre
	Transcript show: pessoa nome; cr.
	matriculas collect: [:umaMatricula | Transcript show: 'Disciplina: ', umaMatricula turma disciplina nome , '    docente: ' , umaMatricula turma docente pessoa nome; cr]</body>
</methods>

<methods>
<class-id>Mac441.Aluno</class-id> <category>checagem</category>

<body>historicoPossui: umaDisciplinaNome 
	historicoEscolar collect: [:umHistEsc | umHistEsc nomeDisciplina = umaDisciplinaNome ifTrue: [^true]].
	^false</body>

<body>matriculado: umaDisciplina horario: umSet 
	(matriculas contains: [:umaMatricula | umaMatricula turma disciplina = umaDisciplina])
		ifTrue: [^true].
	(matriculas contains: [:umaMatricula | umaMatricula turma conflitoDeHorario: umSet])
		ifTrue: [^true]
		ifFalse: [^false]</body>

<body>preRequisitos: umaDisciplina 
	umaDisciplina preRequisitos do: [:discip | (self historicoPossui: discip nome)
			ifFalse: [^false]].
	^true</body>
</methods>


<class>
<name>DiaEHorario</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>diaDaSemana horario </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<methods>
<class-id>Mac441.DiaEHorario</class-id> <category>acesso</category>

<body>diaDaSemana
	^diaDaSemana</body>

<body>diaDaSemana: umaString
	diaDaSemana := umaString</body>

<body>diaDaSemana: umaString1 horario: umaString2
	diaDaSemana := umaString1.
	horario := umaString2.</body>

<body>displayString
	| texto |
	texto := diaDaSemana , '  ' , horario.
	^texto</body>

<body>horario
	^horario</body>

<body>horario: umaString 
	horario := umaString</body>
</methods>


<class>
<name>Setor</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>nome unidade funcionarios </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Setor class</class-id> <category>inicializacao</category>

<body>new
	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Setor</class-id> <category>inicializacao</category>

<body>initialize
	nome := nil.
	unidade := nil.
	funcionarios := Set new.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Setor</class-id> <category>contratacao</category>

<body>novoFuncionarioAutonomo: umaPessoa salarioBase: umInteiro 
	| func pagto |
	func := Funcionario new.
	func pessoa: umaPessoa.
	func setor: self.
	pagto := Autonomo new.
	pagto salarioBase: umInteiro.
	func pagamento: pagto.
	funcionarios add: func.
	^func</body>

<body>novoFuncionarioCLT: umaPessoa salarioBase: umInteiro
	|func pagto|
	func := Funcionario new.
	func pessoa: umaPessoa.
	func setor: self.
	pagto := CLT new.
	pagto salarioBase: umInteiro.
	func pagamento: pagto.
	funcionarios add: func.
	^func</body>

<body>novoFuncionarioConcursado: umaPessoa salarioBase: umInteiro 
	| func pagto |
	func := Funcionario new.
	func pessoa: umaPessoa.
	func setor: self.
	pagto := Concursado new.
	pagto salarioBase: umInteiro.
	func pagamento: pagto.
	funcionarios add: func.
	^func</body>
</methods>

<methods>
<class-id>Mac441.Setor</class-id> <category>acesso</category>

<body>funcionarios
	^funcionarios</body>

<body>nome: umaString
	nome := umaString</body>

<body>unidade: umaUnidade
	unidade := umaUnidade</body>
</methods>

<methods>
<class-id>Mac441.Setor</class-id> <category>pagamento</category>

<body>folhaDePagamento
	Transcript show: nome; cr.
	funcionarios collect: [:umFuncionario | Transcript show: umFuncionario pessoa nome , '    R$' , umFuncionario salario printString; cr]</body>
</methods>


<class>
<name>Concursado</name>
<environment>Mac441</environment>
<super>Mac441.Pagamento</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Concursado class</class-id> <category>inicializacao</category>

<body>new
	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Concursado</class-id> <category>inicializacao</category>

<body>initialize
	qtasHorasTrab := 0.
	salarioBase := nil.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Concursado</class-id> <category>pagamento</category>

<body>calculaSalario
	| salario |
	180 - qtasHorasTrab / 8 &gt; 5
		ifTrue: [salario := salarioBase - (salarioBase * 0.06)]
		ifFalse: [salario := salarioBase].
	salario := salario - (super impostoDeRenda: salario).
	^salario</body>
</methods>


<class>
<name>Docente</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>departamento pessoa senha turmas qtasTurmas </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Docente class</class-id> <category>inicializacao</category>

<body>new
	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Docente</class-id> <category>inicializacao</category>

<body>initialize
	departamento := nil.
	pessoa := nil.
	senha := nil.
	turmas := Set new.
	qtasTurmas := 0.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Docente</class-id> <category>acesso</category>

<body>departamento: umDepartamento 
	departamento := umDepartamento</body>

<body>displayString
	^pessoa nome</body>

<body>nome
	^pessoa isNil
		ifTrue: [nil]
		ifFalse: [pessoa nome]</body>

<body>nome: umaString 
	pessoa isNil	ifFalse: [	pessoa nome: umaString]</body>

<body>pessoa
	^pessoa</body>

<body>pessoa: umaPessoa
	pessoa := umaPessoa</body>

<body>qtasTurmas
	^qtasTurmas</body>

<body>registraSenha: umaString
	senha := umaString</body>

<body>senha
	^senha</body>

<body>turmas: umaTurma 
	qtasTurmas := qtasTurmas + 1.
	turmas add: umaTurma</body>
</methods>

<methods>
<class-id>Mac441.Docente</class-id> <category>checagem</category>

<body>confereSenha: umaString 
	^umaString = senha</body>

<body>horarioLivre: umSet 
	umSet isNil ifFalse: [(turmas contains: [:umaTurma | umaTurma verificaSetDeHorarios: umSet])
			ifTrue: [^false]
			ifFalse: [^true]] ifTrue: [^true]</body>
</methods>

<methods>
<class-id>Mac441.Docente</class-id> <category>chamada</category>

<body>listaDeChamadaDa: umaDisciplina 
	turmas collect: [:umaTurma | umaTurma disciplina = umaDisciplina ifTrue: [umaTurma listaDeChamada]]</body>
</methods>

<methods>
<class-id>Mac441.Docente</class-id> <category>carga</category>

<body>cargaDidatica
	Transcript show: 'Carga didatica de ' , pessoa nome; cr.
	turmas collect: [:umaTurma | umaTurma cargaDidaticaDisciplina]</body>
</methods>

<methods>
<class-id>Mac441.Docente</class-id> <category>fimDeSemestre</category>

<body>fimDeSemestre
	turmas collect: [:umaTurma | umaTurma fimDeSemestre
			ifTrue: 
				[qtasTurmas := qtasTurmas - 1.
				turmas remove: umaTurma]
			ifFalse: [Transcript show: 'Docente ' , pessoa nome , ' favor entregar as notas'; cr]]</body>
</methods>


<class>
<name>Autonomo</name>
<environment>Mac441</environment>
<super>Mac441.Pagamento</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Autonomo class</class-id> <category>inicializacao</category>

<body>new
	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Autonomo</class-id> <category>inicializacao</category>

<body>initialize
	qtasHorasTrab := 0.
	salarioBase := nil.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Autonomo</class-id> <category>pagamento</category>

<body>calculaSalario
	| salario |
	salario := qtasHorasTrab * salarioBase.
	salario := salario - (self impostoDeRenda: salario).
	^salario</body>

<body>impostoDeRenda: umInteiro 
	^umInteiro * 0.1</body>
</methods>


<class>
<name>UIRelogio</name>
<environment>Mac441</environment>
<super>UI.ApplicationModel</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>processo relogioAdap fimDia mensagem aDia fimMes aMes aAno fimAno </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.UIRelogio class</class-id> <category>interface specs</category>

<body>windowSpec
	"UIPainter new openOnClass: self andSelector: #windowSpec"

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec} 
		#window: 
		#(#{UI.WindowSpec} 
			#label: 'RelÃÂ³gio' 
			#bounds: #(#{Graphics.Rectangle} 280 137 502 427 ) ) 
		#component: 
		#(#{UI.SpecCollection} 
			#collection: #(
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 82 0 ) 
					#label: 'Data inÃÂ­cio' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 2 17 ) 
					#label: 'Dia' ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 2 41 61 70 ) 
					#model: #aDia 
					#callbacksSpec: 
					#(#{UI.UIEventCallbackSubSpec} 
						#requestValueChangeSelector: 
						#validaDia: ) 
					#type: #number ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 80 17 ) 
					#label: 'MÃÂªs' ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 80 41 139 70 ) 
					#model: #aMes 
					#callbacksSpec: 
					#(#{UI.UIEventCallbackSubSpec} 
						#requestValueChangeSelector: 
						#validaMes: ) 
					#type: #number ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 158 17 ) 
					#label: 'Ano' ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 158 41 217 70 ) 
					#model: #aAno 
					#callbacksSpec: 
					#(#{UI.UIEventCallbackSubSpec} 
						#requestValueChangeSelector: 
						#validaAno: ) 
					#type: #number ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 70 90 ) 
					#label: 'Fim do semestre' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 2 107 ) 
					#label: 'Dia' ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 2 131 61 160 ) 
					#model: #fimDia 
					#callbacksSpec: 
					#(#{UI.UIEventCallbackSubSpec} 
						#requestValueChangeSelector: 
						#validaDia: ) 
					#type: #number ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 81 107 ) 
					#label: 'MÃÂªs' ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 81 131 140 160 ) 
					#model: #fimMes 
					#callbacksSpec: 
					#(#{UI.UIEventCallbackSubSpec} 
						#requestValueChangeSelector: 
						#validaMes: ) 
					#type: #number ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 159 107 ) 
					#label: 'Ano' ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 160 131 219 160 ) 
					#model: #fimAno 
					#type: #number ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 2 173 ) 
					#label: 'Mensagem' ) 
				#(#{UI.TextEditorSpec} 
					#layout: #(#{Graphics.Rectangle} 3 191 221 246 ) 
					#model: #mensagem 
					#isReadOnly: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 51 255 106 285 ) 
					#model: #inicio 
					#label: 'Iniciar' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 114 255 169 285 ) 
					#name: #btnParar 
					#flags: 40 
					#model: #parar 
					#label: 'Parar' 
					#defaultable: true ) ) ) )</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.UIRelogio</class-id> <category>actions</category>

<body>inicio
	| w relogioAux |
	w := self builder componentAt: #btnParar.
	w enable.
	relogioAux := relogioAdap value.
	processo := [
			[(Delay forSeconds: 1) wait.
			relogioAux dia: relogioAux dia + 1.
			relogioAdap value: relogioAux] repeat]
				forkAt: Processor userBackgroundPriority</body>

<body>parar
	processo terminate</body>

<body>verificaFimDeSemestre
	relogioAdap value ano = fimAno value ifTrue: [relogioAdap value mes = fimMes value ifTrue: [relogioAdap value dia = fimDia value
				ifTrue: 
					[mensagem value: mensagem value , 'Fim do semestre.'.
					Universidade new fimDeSemestre]]]</body>
</methods>

<methods>
<class-id>Mac441.UIRelogio</class-id> <category>validacao</category>

<body>validaAno: entradaAno 
	| dado mes |
	dado := entradaAno editValue.
	(dado rem: 4)
		= 0
		ifFalse: 
			[mes := relogioAdap value mes.
			mes isNil ifFalse: [mes = 2 ifTrue: [relogioAdap value dia = 29
						ifTrue: 
							[relogioAdap value: Relogio new.
							^false]]]].
	^true</body>

<body>validaDia: entradaDia 
	| dado |
	dado := entradaDia editValue.
	(dado &gt; 0 and: [dado &lt;= 31])
		ifTrue: [^true].
	relogioAdap value: Relogio new.
	^false</body>

<body>validaMes: entradaMes 
	| dado dia ano |
	dado := entradaMes editValue.
	(dado &gt; 0 and: [dado &lt;= 12])
		ifTrue: 
			[dia := relogioAdap value dia.
			ano := relogioAdap value ano.
			dia isNil ifFalse: [dado even
					ifTrue: [dado = 2
							ifTrue: [dia = 29 ifTrue: [ano isNil
										ifTrue: [^true]
										ifFalse: [(ano rem: 4)
												= 0 ifTrue: [^true]]]]
							ifFalse: [(dia = 29 or: [dia])
									ifTrue: [^true]]]
					ifFalse: [(dia &gt; 28 and: [dia &lt;= 31])
							ifTrue: [^true]]].
			^true].
	relogioAdap value: Relogio new.
	^false</body>
</methods>

<methods>
<class-id>Mac441.UIRelogio</class-id> <category>inicializacao</category>

<body>initialize
	relogioAdap := Relogio new asValue.
	aAno := 0 asValue.
	aMes := 0 asValue.
	aDia := 0 asValue.
	relogioAdap onChangeSend: #verificaFimDeSemestre to: self</body>
</methods>

<methods>
<class-id>Mac441.UIRelogio</class-id> <category>aspects</category>

<body>aAno
	aAno := AspectAdaptor subjectChannel: relogioAdap.
	aAno forAspect: #ano.
	aAno accessWith: #ano assignWith: #ano:.
	aAno subjectSendsUpdates: true.
	^aAno</body>

<body>aDia
	aDia := AspectAdaptor subjectChannel: relogioAdap.
	aDia forAspect: #dia.
	aDia accessWith: #dia assignWith: #dia:.
	aDia subjectSendsUpdates: true.
	^aDia</body>

<body>aMes
	aMes := AspectAdaptor subjectChannel: relogioAdap.
	aMes forAspect: #mes.
	aMes accessWith: #mes assignWith: #mes:.
	aMes subjectSendsUpdates: true.
	^aMes</body>

<body>fimAno
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."

	^fimAno isNil
		ifTrue:
			[fimAno := 0 asValue]
		ifFalse:
			[fimAno]</body>

<body>fimDia
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."

	^fimDia isNil
		ifTrue:
			[fimDia := 0 asValue]
		ifFalse:
			[fimDia]</body>

<body>fimMes
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."

	^fimMes isNil
		ifTrue:
			[fimMes := 0 asValue]
		ifFalse:
			[fimMes]</body>

<body>mensagem
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."

	^mensagem isNil
		ifTrue:
			[mensagem := String new asValue]
		ifFalse:
			[mensagem]</body>
</methods>


<class>
<name>Turma</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>disciplina docente matriculas horarios nome </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Turma class</class-id> <category>inicializacao</category>

<body>new
	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Turma</class-id> <category>fimDeSemestre</category>

<body>fimDeSemestre
	| alunoAux historicoEscolar notasCompletas |
	notasCompletas := true.
	disciplina removeTurma: self.
	matriculas keysAndValuesDo: [:numUSP :umaMatricula | umaMatricula nota = nil
			ifTrue: [notasCompletas := false]
			ifFalse: [matriculas
					keysAndValuesDo: 
						[:numeroUSP :umaMatriculaAux | 
						historicoEscolar := HistoricoEscolar new.
						historicoEscolar nomeDisciplina: disciplina nome.
						historicoEscolar notaFinal: umaMatriculaAux nota.
						historicoEscolar frequencia: umaMatriculaAux frequencia.
						alunoAux := umaMatricula aluno.
						alunoAux historicoEscolar: historicoEscolar.
						alunoAux removeMatricula: umaMatriculaAux]]].
	notasCompletas = true ifTrue: [matriculas := nil].
	^notasCompletas</body>
</methods>

<methods>
<class-id>Mac441.Turma</class-id> <category>inicializacao</category>

<body>initialize
	disciplina := nil.
	docente := nil.
	matriculas := Dictionary new.
	horarios := Set new.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Turma</class-id> <category>acesso</category>

<body>dadosDoAluno: numUSP 
	^matriculas at: numUSP ifAbsent: [nil]</body>

<body>disciplina
	^disciplina</body>

<body>disciplina: umaDisciplina
	disciplina := umaDisciplina</body>

<body>displayString
	| texto |
	texto := docente pessoa nome.
	horarios isNil ifFalse: [horarios collect: [:umHorario | texto := texto , '  ' , umHorario diaDaSemana , '  ' , umHorario horario , '  ']].
	^texto</body>

<body>docente
	^docente</body>

<body>docente: umDocente 
	docente := umDocente</body>

<body>horarios
	^horarios</body>

<body>horarios: umSet 
	horarios := umSet</body>

<body>matriculas: umaMatricula 
	matriculas at: umaMatricula aluno numeroUSP put: umaMatricula</body>

<body>nome: umaString 
	nome := umaString</body>

<body>nota: umInteiro para: numUSP senha: umaString 
	| umaMatricula |
	(docente confereSenha: umaString)
		ifTrue: 
			[umaMatricula := matriculas at: numUSP ifAbsent: [nil].
			umaMatricula = nil
				ifFalse: [umaMatricula nota: umInteiro]
				ifTrue: [Transcript show: 'Este aluno nao esta matriculado nesta disciplina.'; cr]]
		ifFalse: [Transcript show: 'Senha invalida ! ! !'; cr]</body>
</methods>

<methods>
<class-id>Mac441.Turma</class-id> <category>checagem</category>

<body>conflitoDeHorario: umSet 
	^umSet contains: [:umDiaEHorario | self verificaHorario: umDiaEHorario]</body>

<body>verificaHorario: umDiaEHorario 
	"Retorna true se umDiaEHorario esta em horarios"

	^horarios contains: [:umHorarioAux | umDiaEHorario diaDaSemana = umHorarioAux diaDaSemana and: [umDiaEHorario horario = umHorarioAux horario]]</body>

<body>verificaSetDeHorarios: umSet 
	^umSet contains: [:umDiaEHorario | self verificaHorario: umDiaEHorario]</body>
</methods>

<methods>
<class-id>Mac441.Turma</class-id> <category>chamada</category>

<body>listaDeChamada
	Transcript show: disciplina nome;cr.
	matriculas keysAndValuesDo: [:numUSP :umaMatricula | umaMatricula imprimeFrequencia]</body>
</methods>

<methods>
<class-id>Mac441.Turma</class-id> <category>carga</category>

<body>cargaDidaticaDisciplina
	Transcript show: disciplina nome; cr.
	horarios collect: [:umHorario | Transcript show: umHorario diaDaSemana , '   ' , umHorario horario; cr]</body>
</methods>


<class>
<name>CLT</name>
<environment>Mac441</environment>
<super>Mac441.Pagamento</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.CLT class</class-id> <category>inicializacao</category>

<body>new
	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.CLT</class-id> <category>inicializacao</category>

<body>initialize
	qtasHorasTrab := 0.
	salarioBase := nil.
	^self</body>
</methods>

<methods>
<class-id>Mac441.CLT</class-id> <category>pagamento</category>

<body>calculaSalario
	| salario |
	salario := salarioBase - (0.09 * salarioBase) - (0.03 * salarioBase) - ((180 - qtasHorasTrab / 8) floor * (salarioBase / 30)).
	salario := salario - (super impostoDeRenda: salario).
	^salario</body>
</methods>


<class>
<name>Departamento</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>nome unidade disciplinas docentes alunos </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Departamento class</class-id> <category>inicializacao</category>

<body>new
	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Departamento</class-id> <category>vinculacao</category>

<body>atribui: umInteiro a: umDocente horario: umSet 
	| turma disciplina |
	turma := Turma new.
	disciplina := disciplinas at: umInteiro.
	disciplina notNil
		ifTrue: [umDocente qtasTurmas &lt; 4
				ifTrue: [(umDocente horarioLivre: umSet)
						ifTrue: 
							[turma disciplina: disciplina.
							turma docente: umDocente.
							turma horarios: umSet.
							umDocente turmas: turma.
							disciplina turmas: turma.
							^turma]
						ifFalse: 
							[Dialog warn: 'Um professor nÃÂ£o pode se responsabilizar por duas turmas no mesmo horÃÂ¡rio.'.
							^nil]]
				ifFalse: 
					[Dialog warn: 'Um professor nÃÂ£o pode se responsabilizar por mais que quatro turmas'.
					^nil]]
		ifFalse: 
			[Dialog warn: 'NÃÂ£o existe a disciplina ' , umInteiro , '.'.
			^nil]</body>

<body>matricula: umInteiroAluno naDisciplina: umInteiroDisciplina naTurma: umaTurma horario: umSet 
	| aluno disciplina matricula |
	aluno := alunos at: umInteiroAluno.
	aluno = nil
		ifFalse: 
			[disciplina := disciplinas at: umInteiroDisciplina.
			disciplina = nil ifFalse: [umaTurma disciplina = disciplina
					ifTrue: [aluno qtasTurmas &lt; 10
							ifTrue: [(aluno matriculado: disciplina horario: umaTurma horarios)
									ifFalse: [(aluno preRequisitos: disciplina)
											ifTrue: 
												[matricula := Matricula new.
												matricula aluno: aluno.
												matricula turma: umaTurma.
												aluno matriculas: matricula.
												umaTurma matriculas: matricula.
												^matricula]
											ifFalse: 
												[Dialog warn: 'O aluno nÃÂ£o tem os prÃÂ©-requisitos necessÃÂ¡rios.'.
												^nil]]
									ifTrue: 
										[Dialog warn: 'Aluno jÃÂ¡ tem uma matrÃÂ­cula nesta disciplina ou neste horÃÂ¡rio.'.
										^nil]]
							ifFalse: 
								[Dialog warn: 'Aluno nÃÂ£o pode se matricular em mais que 10 turmas.'.
								^nil]]
					ifFalse: 
						[Dialog warn: 'Esta turma nÃÂ£o corresponde a esta disciplina.'.
						^nil]]
				ifTrue: 
					[Dialog warn: 'A disciplina ' , umInteiroDisciplina , ' nÃÂ£o existe neste departamento.'.
					^nil]]
		ifTrue: 
			[Dialog warn: 'O aluno ' , umInteiroAluno , ' nÃÂ£o existe neste departamento.'.
			^nil]</body>

<body>novaDisciplina: umInteiro nome: umaString1 ementa: umaString2 preRequisitos: umSet 
	| disciplina |
	disciplina := Disciplina new.
	disciplina numero: umInteiro.
	disciplina nome: umaString1.
	disciplina ementa: umaString2.
	disciplina preRequisitos: umSet.
	disciplina departamento: self.
	disciplinas at: disciplina numero put: disciplina.
	^disciplina</body>

<body>novoAluno: umaPessoa 
	| aluno numUSP |
	aluno := Aluno new.
	numUSP := unidade universidade geraNumUSP.
	aluno pessoa: umaPessoa.
	aluno departamento: self.
	aluno numeroUSP: numUSP.
	alunos at: aluno numeroUSP put: aluno.
	^aluno</body>

<body>novoDocente: umaPessoa 
	| docente |
	docente := Docente new.
	docente pessoa: umaPessoa.
	docente departamento: self.
	docentes at: umaPessoa nome put: docente.
	^docente</body>
</methods>

<methods>
<class-id>Mac441.Departamento</class-id> <category>carga</category>

<body>cargaDidaticaDe: umaString 
	| umDocente |
	umDocente := docentes at: umaString ifAbsent: [nil].
	umDocente = nil ifFalse: [umDocente cargaDidatica]</body>
</methods>

<methods>
<class-id>Mac441.Departamento</class-id> <category>acesso</category>

<body>alunos
	^alunos</body>

<body>disciplinas
	^disciplinas</body>

<body>displayString
	^nome isNil ifFalse: [nome] ifTrue: ['']</body>

<body>docentes
	^docentes</body>

<body>nome
	^nome</body>

<body>nome: umaString
	nome := umaString</body>

<body>unidade: umaUnidade
	unidade := umaUnidade.</body>
</methods>

<methods>
<class-id>Mac441.Departamento</class-id> <category>chamada</category>

<body>listaDeChamadaPara: umInteiro professor: umaString 
	| umDocente umaDisciplina |
	umDocente := docentes at: umaString ifAbsent: [nil].
	umDocente = nil
		ifFalse: 
			[umaDisciplina := disciplinas at: umInteiro ifAbsent: [nil].
			umaDisciplina = nil
				ifFalse: [umDocente listaDeChamadaDa: umaDisciplina]
				ifTrue: [Transcript show: 'Nao existe esta disciplina neste departamento.'; cr]]
		ifTrue: [Transcript show: 'Nao existe este docente neste departamento.'; cr]</body>
</methods>

<methods>
<class-id>Mac441.Departamento</class-id> <category>catalogo</category>

<body>catalogo
	Transcript show: nome; cr.
	disciplinas keysAndValuesDo: [:numDisciplina :umaDisciplina | Transcript show: umaDisciplina nome; cr]</body>
</methods>

<methods>
<class-id>Mac441.Departamento</class-id> <category>historico</category>

<body>historicoEscolarDe: umInteiro 
	| aluno |
	aluno := alunos at: umInteiro ifAbsent: [nil].
	aluno = nil ifFalse: [^aluno historicoEscolar]
		ifTrue: [^nil]</body>

<body>situacaoNoSemestre: umInteiro 
	| aluno |
	aluno := alunos at: umInteiro ifAbsent: [nil].
	aluno = nil ifFalse: [^aluno situacaoNoSemestre]
		ifTrue: [^nil]</body>
</methods>

<methods>
<class-id>Mac441.Departamento</class-id> <category>inicializacao</category>

<body>initialize
	nome := nil.
	unidade := nil.
	disciplinas := Dictionary new.
	docentes := Dictionary new.
	alunos := Dictionary new.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Departamento</class-id> <category>fimDeSemestre</category>

<body>fimDeSemestre
	docentes keysAndValuesDo: [:nomeDocente :umDocente | umDocente fimDeSemestre]</body>
</methods>


<class>
<name>Universidade</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>nome unidades geraNumUSP </inst-vars>
<class-inst-vars>SoleInstance </class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<static>
<name>SoleInstance</name>
<environment>Mac441.Universidade</environment>
<private>false</private>
<constant>false</constant>
<category>As yet unclassified</category>
</static>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Universidade class</class-id> <category>inicializacao</category>

<body>destroi
	SoleInstance := nil</body>

<body>new
	SoleInstance isNil ifTrue: [SoleInstance := super new initialize].
	^SoleInstance</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Universidade</class-id> <category>inicializacao</category>

<body>initialize
	nome := nil.
	unidades := Set new.
	geraNumUSP := 0.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Universidade</class-id> <category>fimDeSemestre</category>

<body>fimDeSemestre
	unidades collect: [:umaUnidade | umaUnidade fimDeSemestre]</body>
</methods>

<methods>
<class-id>Mac441.Universidade</class-id> <category>acesso</category>

<body>adicionaUnidade: umaUnidade 
	unidades add: umaUnidade</body>

<body>geraNumUSP
	geraNumUSP := geraNumUSP + 1.
	^geraNumUSP</body>

<body>nome: umaString
	nome := umaString.</body>

<body>unidades
	^unidades</body>
</methods>

<methods>
<class-id>Mac441.Universidade</class-id> <category>malaDireta</category>

<body>malaDiretaAlunos: umaString 
	unidades collect: [:umaUnidade | self malaDiretaAlunos: umaString daUnidade: umaUnidade]</body>

<body>malaDiretaAlunos: umaString daUnidade: umaUnidade 
	umaUnidade departamentos collect: [:umDepartamento | self
			malaDiretaAlunos: umaString
			daUnidade: umaUnidade
			departamento: umDepartamento]</body>

<body>malaDiretaAlunos: umaString daUnidade: umaUnidade departamento: umDepartamento 
	umDepartamento alunos collect: [:umAluno | Transcript show: 'Carta para: ' , umAluno pessoa nome; cr; show: 'Endereco: ' , umAluno pessoa endereco; cr; show: 'Conteudo: ' , umaString; cr]</body>

<body>malaDiretaFuncionarios: umaString 
	unidades collect: [:umaUnidade | self malaDiretaFuncionarios: umaString daUnidade: umaUnidade]</body>

<body>malaDiretaFuncionarios: umaString daUnidade: umaUnidade 
	umaUnidade setores collect: [:umSetor | self
			malaDiretaFuncionarios: umaString
			daUnidade: umaUnidade
			setor: umSetor]</body>

<body>malaDiretaFuncionarios: umaString daUnidade: umaUnidade setor: umSetor 
	umSetor funcionarios collect: [:umFunc | Transcript show: 'Carta para: ' , umFunc pessoa nome; cr; show: 'Endereco: ' , umFunc pessoa endereco; cr; show: 'Conteudo: ' , umaString; cr]</body>

<body>malaDiretaProfessores: umaString 
	unidades collect: [:umaUnidade | self malaDiretaProfessores: umaString daUnidade: umaUnidade]</body>

<body>malaDiretaProfessores: umaString daUnidade: umaUnidade 
	umaUnidade departamentos collect: [:umDepartamento | self
			malaDiretaProfessores: umaString
			daUnidade: umaUnidade
			departamento: umDepartamento]</body>

<body>malaDiretaProfessores: umaString daUnidade: umaUnidade departamento: umDepartamento 
	umDepartamento docentes collect: [:umDocente | Transcript show: 'Carta para: ' , umDocente pessoa nome; cr; show: 'Endereco: ' , umDocente pessoa endereco; cr; show: 'Conteudo: ' , umaString; cr]</body>

<body>malaDiretaTodos: umaString 
	self malaDiretaAlunos: umaString.
	self malaDiretaProfessores: umaString.
	self malaDiretaFuncionarios: umaString</body>

<body>malaDiretaTodos: umaString daUnidade: umaUnidade 
	self malaDiretaAlunos: umaString daUnidade: umaUnidade.
	self malaDiretaProfessores: umaString daUnidade: umaUnidade.
	self malaDiretaFuncionarios: umaString daUnidade: umaUnidade</body>
</methods>

<methods>
<class-id>Mac441.Universidade</class-id> <category>pagamento</category>

<body>folhaDePagamento
	unidades collect: [:umaUnidade | self folhaDePagamentoPara: umaUnidade nome]</body>

<body>folhaDePagamentoPara: nomeUnidade 
	unidades collect: [:umaUnidade | umaUnidade nome = nomeUnidade ifTrue: [umaUnidade folhaDePagamento]]</body>
</methods>


<class>
<name>HistoricoEscolar</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>nomeDisciplina frequencia notaFinal </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<methods>
<class-id>Mac441.HistoricoEscolar</class-id> <category>acesso</category>

<body>frequencia: umInteiro 
	frequencia := umInteiro</body>

<body>nomeDisciplina
	^nomeDisciplina</body>

<body>nomeDisciplina: umaString
	nomeDisciplina := umaString</body>

<body>notaFinal: umInteiro 
	notaFinal := umInteiro</body>
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

<body>endereco
	^endereco</body>

<body>endereco: umaString
	endereco := umaString</body>

<body>nome
	^nome</body>

<body>nome: umaString 
	nome := umaString</body>

<body>rg
	^rg</body>

<body>rg: umInteiro
	rg := umInteiro</body>

<body>usuario
	^usuario</body>

<body>usuario: umUsuario 
	usuario := umUsuario</body>
</methods>


<class>
<name>Matricula</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>aluno turma nota frequencia </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<methods>
<class-id>Mac441.Matricula</class-id> <category>acesso</category>

<body>aluno
	^aluno</body>

<body>aluno: umAluno
	aluno := umAluno</body>

<body>displayString
	| texto |
	texto := String new.
	turma horarios collect: [:umHorario | texto := texto , umHorario diaDaSemana , ' ÃÂ s ' , umHorario horario , '   '].
	texto := turma disciplina numero , ' (' , turma disciplina nome , ') - ' , texto.
	^texto</body>

<body>frequencia
	^frequencia</body>

<body>imprimeFrequencia
	Transcript show: aluno pessoa nome , '   frequencia: ' , frequencia printString; cr.</body>

<body>nota
	^nota</body>

<body>nota: umInteiro
	nota := umInteiro</body>

<body>turma
	^turma</body>

<body>turma: umaTurma 
	turma := umaTurma</body>
</methods>


<class>
<name>Disciplina</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>numero nome ementa departamento turmas preRequisitos </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Disciplina class</class-id> <category>inicializacao</category>

<body>new
	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Disciplina</class-id> <category>inicializacao</category>

<body>initialize
	numero := nil.
	nome := nil.
	ementa := nil.
	departamento := nil.
	turmas := Set new.
	preRequisitos := Set new.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Disciplina</class-id> <category>acesso</category>

<body>departamento
	^departamento</body>

<body>departamento: umDepartamento 
	departamento := umDepartamento</body>

<body>displayString
	^numero isNil ifFalse: [numero]
		ifTrue: ['']</body>

<body>ementa
	^ementa</body>

<body>ementa: umaString 
	ementa := umaString</body>

<body>nome
	^nome</body>

<body>nome: umaString
	nome := umaString</body>

<body>numero
	^numero</body>

<body>numero: umInteiro 
	numero := umInteiro</body>

<body>preRequisitos
	^preRequisitos</body>

<body>preRequisitos: umSet 
	preRequisitos := umSet</body>

<body>removeTurma: umaTurma
	turmas remove: umaTurma</body>

<body>turmas
	^turmas</body>

<body>turmas: umaTurma 
	turmas add: umaTurma</body>
</methods>


<class>
<name>UICadMatricula</name>
<environment>Mac441</environment>
<super>UI.ApplicationModel</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>janelaPrinc nomeAluno listaMatriculas numeroUSP novoSenha novoCodDisciplina novoNomeAluno novoNumeroUSP novoNomeDisciplina novoListaHorarios novoListaTurmas alunoAtual pessoaAtual unidadeAtual departamentoAtual disciplinaAtual novoEmenta novoListaUnid novoListaDisc novoListaDepto novoListaDep </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.UICadMatricula class</class-id> <category>interface specs</category>

<body>novaMatriculaWindow
	"UIPainter new openOnClass: self andSelector: #novaMatriculaWindow"

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec} 
		#window: 
		#(#{UI.WindowSpec} 
			#label: 'Nova matrÃÂ­cula' 
			#bounds: #(#{Graphics.Rectangle} 261 22 836 342 ) ) 
		#component: 
		#(#{UI.SpecCollection} 
			#collection: #(
				#(#{UI.SequenceViewSpec} 
					#layout: #(#{Graphics.Rectangle} 6 220 310 277 ) 
					#name: #lsbTurmas 
					#model: #novoListaTurmas 
					#useModifierKeys: true 
					#selectionType: #highlight ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 5 202 ) 
					#name: #lsbTurmas 
					#label: 'Turmas' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 3 -1 ) 
					#name: #labNumeroUSP 
					#label: 'NÃÂºmero USP' ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 4 54 219 75 ) 
					#name: #edtNomeAluno 
					#model: #novoNomeAluno 
					#isReadOnly: true ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 3 37 ) 
					#name: #labNomeAluno 
					#label: 'Nome do aluno' ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 104 16 192 35 ) 
					#name: #edtSenha 
					#model: #novoSenha 
					#callbacksSpec: 
					#(#{UI.UIEventCallbackSubSpec} 
						#requestValueChangeSelector: 
						#verificaSenha: ) 
					#type: #password ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 103 -1 ) 
					#name: #labSenha 
					#label: 'Senha' ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 197 14 246 39 ) 
					#name: #btnConfirma 
					#model: #confirmaSenha 
					#label: 'Confirma' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 227 288 276 313 ) 
					#name: #btnOk 
					#flags: 40 
					#model: #confirmaMatricula 
					#label: 'Ok' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 280 288 329 313 ) 
					#name: #btnCancela 
					#model: #cancelaMatricula 
					#label: 'Cancela' 
					#defaultable: true ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 332 104 570 124 ) 
					#name: #edtNomeDisciplina 
					#model: #novoNomeDisciplina 
					#isReadOnly: true ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 330 86 ) 
					#name: #labNomeDisciplina 
					#label: 'Nome da disciplina' ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 4 16 100 35 ) 
					#name: #edtNumeroUSP 
					#model: #novoNumeroUSP 
					#isReadOnly: true 
					#type: #number ) 
				#(#{UI.DividerSpec} 
					#layout: #(#{Graphics.Rectangle} -38 82 604 86 ) ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 332 125 ) 
					#name: #labEmenta 
					#label: 'Ementa' ) 
				#(#{UI.TextEditorSpec} 
					#layout: #(#{Graphics.Rectangle} 334 144 537 237 ) 
					#name: #txtEmenta 
					#model: #novoEmenta 
					#isReadOnly: true ) 
				#(#{UI.SequenceViewSpec} 
					#layout: #(#{Graphics.Rectangle} 5 104 105 204 ) 
					#name: #lsbUnidades 
					#model: #novoListaUnid 
					#callbacksSpec: 
					#(#{UI.UIEventCallbackSubSpec} 
						#valueChangeSelector: #atualizaDepartamentos ) 
					#useModifierKeys: true 
					#selectionType: #highlight ) 
				#(#{UI.SequenceViewSpec} 
					#layout: #(#{Graphics.Rectangle} 116 104 216 204 ) 
					#name: #lsbDepartamentos 
					#model: #novoListaDep 
					#callbacksSpec: 
					#(#{UI.UIEventCallbackSubSpec} 
						#valueChangeSelector: #atualizaDisciplinas ) 
					#useModifierKeys: true 
					#selectionType: #highlight ) 
				#(#{UI.SequenceViewSpec} 
					#layout: #(#{Graphics.Rectangle} 227 104 327 204 ) 
					#name: #lsbDisciplinas 
					#model: #novoListaDisc 
					#callbacksSpec: 
					#(#{UI.UIEventCallbackSubSpec} 
						#valueChangeSelector: #atualizaTurmas ) 
					#useModifierKeys: true 
					#selectionType: #highlight ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 3 85 ) 
					#name: #labUnidades 
					#label: 'Unidades' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 115 85 ) 
					#name: #labDepartamentos 
					#label: 'Departamentos' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 224 86 ) 
					#name: #labDisciplinas 
					#label: 'Disciplinas' ) ) ) )</body>

<body>windowSpec
	"UIPainter new openOnClass: self andSelector: #windowSpec"

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec} 
		#window: 
		#(#{UI.WindowSpec} 
			#label: 'MatrÃÂ­cula' 
			#max: #(#{Core.Point} 462 287 ) 
			#bounds: #(#{Graphics.Rectangle} 192 186 654 415 ) ) 
		#component: 
		#(#{UI.SpecCollection} 
			#collection: #(
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 3 0 ) 
					#name: #labNumeroUSP 
					#label: 'NÃÂºmero USP' ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 4 55 157 75 ) 
					#name: #edtNomeAluno 
					#model: #nomeAluno 
					#isReadOnly: true ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 3 38 ) 
					#name: #labNomeAluno 
					#label: 'Nome do aluno' ) 
				#(#{UI.SequenceViewSpec} 
					#layout: #(#{Graphics.Rectangle} 4 95 459 192 ) 
					#name: #lsbMatriculas 
					#model: #listaMatriculas 
					#menu: #menuMatriculas 
					#useModifierKeys: true 
					#selectionType: #highlight ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 3 78 ) 
					#name: #labMatriculas 
					#label: 'MatrÃÂ­culas' ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 184 199 233 224 ) 
					#name: #labOk 
					#model: #sair 
					#label: 'Ok' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 242 199 291 224 ) 
					#name: #labNovo 
					#model: #novaMatricula 
					#label: 'Novo' 
					#defaultable: true ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 4 17 83 36 ) 
					#name: #edtNumeroUSP 
					#model: #numeroUSP 
					#callbacksSpec: 
					#(#{UI.UIEventCallbackSubSpec} 
						#requestFocusOutSelector: 
						#numeroUSPValid: ) 
					#type: #number ) ) ) )</body>
</methods>

<methods>
<class-id>Mac441.UICadMatricula class</class-id> <category>resources</category>

<body>menuMatriculas
	"MenuEditor new openOnClass: self andSelector: #menuMatriculas"

	&lt;resource: #menu&gt;
	^#(#{UI.Menu} #(
			#(#{UI.MenuItem} 
				#rawLabel: 'Remove' 
				#value: #removeMatricula ) ) #(1 ) nil ) decodeAsLiteralArray</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.UICadMatricula</class-id> <category>actions</category>

<body>changeRequest
	^true</body>

<body>novaMatricula
	alunoAtual value numeroUSP notNil
		ifTrue: 
			[self initializeNM.
			self openInterface: #novaMatriculaWindow]
		ifFalse: [Dialog warn: 'Escolha um aluno vÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¡lido.']</body>

<body>sair
	janelaPrinc window sensor eventQuit: nil</body>
</methods>

<methods>
<class-id>Mac441.UICadMatricula</class-id> <category>actionsnm</category>

<body>cancelaMatricula
	self closeRequest</body>

<body>confirmaMatricula
	disciplinaAtual value isNil ifFalse: [novoListaTurmas selectionIndex = 0
			ifTrue: [Dialog warn: 'Selecione uma turma primeiro.']
			ifFalse: 
				[alunoAtual value departamento
					matricula: alunoAtual value numeroUSP
					naDisciplina: disciplinaAtual value numero
					naTurma: novoListaTurmas selection
					horario: Set new.
				self atualizaMatriculas.
				self closeRequest]]
		ifTrue: [Dialog warn: 'Selecione uma disciplina primeiro.']</body>

<body>confirmaSenha
	| widget |
	alunoAtual value senha = novoSenha value ifFalse: [Dialog warn: 'Senha incorreta.']
		ifTrue: 
			[widget := self builder componentAt: #btnOk.
			widget enable]</body>

<body>listaDepartamentosDa: umaUnidade 
	| lista |
	lista := List new.
	umaUnidade departamentos do: [:umDepartamento | lista add: umDepartamento].
	^lista</body>

<body>listaDisciplinasDo: umDepartamento 
	| lista |
	lista := List new.
	umDepartamento disciplinas keysAndValuesDo: [:numeroDisc :umaDisciplina | lista add: umaDisciplina].
	^lista</body>

<body>listaTurmasDa: umaDisciplina 
	| lista |
	lista := List new.
	umaDisciplina turmas do: [:umaTurma | lista add: umaTurma].
	^lista</body>

<body>listaUnidadesDaUniversidade
	| lista |
	lista := List new.
	Universidade new unidades collect: [:umaUnidade | umaUnidade isNil ifFalse: [lista add: umaUnidade]].
	novoListaUnid list: lista</body>
</methods>

<methods>
<class-id>Mac441.UICadMatricula</class-id> <category>aspects</category>

<body>listaMatriculas
	^listaMatriculas isNil
		ifTrue: [listaMatriculas := SelectionInList new]
		ifFalse: [listaMatriculas]</body>

<body>nomeAluno
	nomeAluno := AspectAdaptor subjectChannel: pessoaAtual.
	nomeAluno forAspect: #nome.
	nomeAluno accessWith: #nome assignWith: #nome:.
	nomeAluno subjectSendsUpdates: true.
	^nomeAluno</body>

<body>numeroUSP
	numeroUSP := AspectAdaptor subjectChannel: alunoAtual.
	numeroUSP forAspect: #numeroUSP.
	numeroUSP accessWith: #numeroUSP assignWith: #numeroUSP:.
	numeroUSP subjectSendsUpdates: true.
	^numeroUSP</body>
</methods>

<methods>
<class-id>Mac441.UICadMatricula</class-id> <category>aspectsnm</category>

<body>novoEmenta
	novoEmenta := AspectAdaptor subjectChannel: disciplinaAtual.
	novoEmenta forAspect: #ementa.
	novoEmenta accessWith: #ementa assignWith: #ementa:.
	novoEmenta subjectSendsUpdates: true.
	^novoEmenta</body>

<body>novoListaDep
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."

	^novoListaDep isNil
		ifTrue:
			[novoListaDep := SelectionInList new]
		ifFalse:
			[novoListaDep]</body>

<body>novoListaDisc
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."

	^novoListaDisc isNil
		ifTrue:
			[novoListaDisc := SelectionInList new]
		ifFalse:
			[novoListaDisc]</body>

<body>novoListaTurmas
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."

	^novoListaTurmas isNil
		ifTrue:
			[novoListaTurmas := SelectionInList new]
		ifFalse:
			[novoListaTurmas]</body>

<body>novoListaUnid
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."

	^novoListaUnid isNil
		ifTrue:
			[novoListaUnid := SelectionInList new]
		ifFalse:
			[novoListaUnid]</body>

<body>novoNomeAluno
	novoNomeAluno := AspectAdaptor subjectChannel: pessoaAtual.
	novoNomeAluno forAspect: #nome.
	novoNomeAluno accessWith: #nome assignWith: #nome:.
	novoNomeAluno subjectSendsUpdates: true.
	^novoNomeAluno</body>

<body>novoNomeDisciplina
	novoNomeDisciplina := AspectAdaptor subjectChannel: disciplinaAtual.
	novoNomeDisciplina forAspect: #nome.
	novoNomeDisciplina accessWith: #nome assignWith: #nome:.
	novoNomeDisciplina subjectSendsUpdates: true.
	^novoNomeDisciplina</body>

<body>novoNumeroUSP
	novoNumeroUSP := AspectAdaptor subjectChannel: alunoAtual.
	novoNumeroUSP forAspect: #numeroUSP.
	novoNumeroUSP accessWith: #numeroUSP assignWith: #numeroUSP:.
	novoNumeroUSP subjectSendsUpdates: true.
	^novoNumeroUSP</body>

<body>novoSenha
	^novoSenha isNil
		ifTrue: [novoSenha := String new asValue]
		ifFalse: [novoSenha]</body>
</methods>

<methods>
<class-id>Mac441.UICadMatricula</class-id> <category>atualizacoes</category>

<body>atualizaDepartamentos
	| unidade |
	unidade := novoListaUnid selection.
	unidadeAtual value: unidade.
	unidade nome isNil ifFalse: [novoListaDep list: (self listaDepartamentosDa: unidade)]</body>

<body>atualizaDisciplinas
	| departamento |
	departamento := novoListaDep selection.
	departamentoAtual value: departamento.
	departamento nome isNil ifFalse: [novoListaDisc list: (self listaDisciplinasDo: departamento)]</body>

<body>atualizaMatriculas
	| listaAux |
	listaAux := List new.
	alunoAtual value matriculas collect: [:umaMatricula | listaAux add: umaMatricula].
	listaMatriculas list: listaAux</body>

<body>atualizaTurmas
	| disciplina |
	disciplina := novoListaDisc selection.
	disciplinaAtual value: disciplina.
	disciplina nome isNil ifFalse: [novoListaTurmas list: (self listaTurmasDa: disciplina)]</body>
</methods>

<methods>
<class-id>Mac441.UICadMatricula</class-id> <category>inicializacao</category>

<body>initialize
	alunoAtual := Aluno new asValue.
	pessoaAtual := Pessoa new asValue.
	listaMatriculas := SelectionInList new.
	alunoAtual onChangeSend: #atualizaMatriculas to: self.
	janelaPrinc := nil</body>

<body>initializeNM
	novoSenha := String new asValue.
	unidadeAtual := Unidade new asValue.
	departamentoAtual := Unidade new asValue.
	disciplinaAtual := Disciplina new asValue.
	self novoListaUnid.
	self novoListaDep.
	self novoListaDisc.
	self novoListaTurmas.
	self listaUnidadesDaUniversidade</body>

<body>openInterface: aInterface 
	janelaPrinc isNil
		ifTrue: [janelaPrinc := super openInterface: aInterface]
		ifFalse: [super openInterface: aInterface]</body>
</methods>

<methods>
<class-id>Mac441.UICadMatricula</class-id> <category>verificacao</category>

<body>numeroUSPValid: edtNumeroUSP 
	| universidade alunosDoDepto alunoAux |
	pessoaAtual value: Pessoa new.
	listaMatriculas list: List new.
	universidade := Universidade new.
	universidade unidades collect: [:umaUnidade | umaUnidade departamentos
			collect: 
				[:umDepartamento | 
				alunosDoDepto := umDepartamento alunos.
				alunoAux := alunosDoDepto at: edtNumeroUSP editValue ifAbsent: [nil].
				alunoAux notNil
					ifTrue: 
						[alunoAtual value: alunoAux.
						pessoaAtual value: alunoAux pessoa.
						^true]]].
	alunoAtual value: Aluno new.
	^true</body>
</methods>

<methods>
<class-id>Mac441.UICadMatricula</class-id> <category>verificacaonm</category>

<body>verificaDepartamento: lsbDepartamentos 
	disciplinaAtual value: Disciplina new.
	novoListaTurmas list: List new.
	unidadeAtual value departamentos collect: [:umDepartamento | umDepartamento nome = lsbDepartamentos editValue
			ifTrue: 
				[departamentoAtual value: umDepartamento.
				^true]].
	departamentoAtual value: Departamento new.
	^false</body>

<body>verificaDisciplina: lsbDisciplinas 
	| temp |
	novoListaTurmas list: List new.
	temp := departamentoAtual value disciplinas at: lsbDisciplinas editValue ifAbsent: [nil].
	temp isNil
		ifTrue: 
			[disciplinaAtual value: Disciplina new.
			^false]
		ifFalse: 
			[disciplinaAtual value: temp.
			^true]</body>

<body>verificaSenha: umaSenha 
	| widget |
	"widget := self builder componentAt: #edtCodDisciplina.
	widget disable."
	widget := self builder componentAt: #btnOk.
	widget disable.
	^true</body>

<body>verificaUnidade: lsbUnidades 
	departamentoAtual value: Departamento new.
	disciplinaAtual value: Disciplina new.
	novoListaTurmas list: List new.
	Universidade new unidades collect: [:umaUnidade | umaUnidade nome = lsbUnidades editValue
			ifTrue: 
				[unidadeAtual value: umaUnidade.
				^true]].
	unidadeAtual value: Unidade new.
	^false</body>
</methods>

<methods>
<class-id>Mac441.UICadMatricula</class-id> <category>opcoesDoMenu</category>

<body>removeMatricula
	| indiceMatric |
	indiceMatric := listaMatriculas selectionIndex.
	indiceMatric = 0
		ifTrue: [Dialog warn: 'Selecione uma matrÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ­cula primeiro.']
		ifFalse: [(Dialog confirm: 'Deseja mesmo apagar esta matrÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ­cula?')
				ifTrue: 
					[alunoAtual value removeMatricula: listaMatriculas selection.
					listaMatriculas list removeAtIndex: indiceMatric]]</body>
</methods>


<class>
<name>Funcionario</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>setor pagamento pessoa </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<methods>
<class-id>Mac441.Funcionario</class-id> <category>acesso</category>

<body>pagamento: umPagamento 
	pagamento := umPagamento</body>

<body>pessoa
	^pessoa</body>

<body>pessoa: umaPessoa
	pessoa := umaPessoa</body>

<body>setor: umSetor 
	setor := umSetor</body>
</methods>

<methods>
<class-id>Mac441.Funcionario</class-id> <category>pagamento</category>

<body>horasTrabalhadas: umInteiro 
	pagamento qtasHorasTrab: umInteiro</body>

<body>salario
	^pagamento calculaSalario</body>
</methods>



</st-source>
