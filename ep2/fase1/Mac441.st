<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, Release 5i.1 of January 24, 2000 on May 8, 2001 at 9:32:11 pm</time-stamp>


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

<body><B>diaDaSemana
	</B>^diaDaSemana</body>

<body>diaDaSemana: umaString1 horario: umaString2
	diaDaSemana := umaString1.
	horario := umaString2.</body>

<body><B>horario
	</B>^horario</body>
</methods>


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

<body><B>new
	</B>^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Unidade</class-id> <category>fimDeSemestre</category>

<body><B>fimDeSemestre
	</B>departamentos select: [:umDepartamento | umDepartamento fimDeSemestre]</body>
</methods>

<methods>
<class-id>Mac441.Unidade</class-id> <category>inicializacao</category>

<body><B>initialize
	</B>nome := nil.
	universidade := Universidade new.
	departamentos := Set new.
	setores := Set new.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Unidade</class-id> <category>vinculacao</category>

<body><B>novoDepartamento: umDepartamento 
	</B>departamentos add: umDepartamento.
	umDepartamento unidade: self</body>

<body><B>novoSetor: umSetor
	</B>setores add: umSetor.
	umSetor unidade: self.</body>
</methods>

<methods>
<class-id>Mac441.Unidade</class-id> <category>acesso</category>

<body>departamentos
	^departamentos</body>

<body>nome
	^nome</body>

<body>nome: umaString
	nome := umaString</body>

<body>setores
	^setores</body>
</methods>

<methods>
<class-id>Mac441.Unidade</class-id> <category>pagamento</category>

<body><B>folhaDePagamento
	</B>Transcript show: nome; cr.
	setores select: [:umSetor | umSetor folhaDePagamento]</body>
</methods>

<methods>
<class-id>Mac441.Unidade</class-id> <category>catalogo</category>

<body><B>catalogo
	</B>Transcript show: nome; cr.
	departamentos select: [:umDepartamento | umDepartamento catalogo]</body>
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

<body><B>new
	</B>^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Departamento</class-id> <category>vinculacao</category>

<body><B>atribui: umInteiro a: umDocente horario: umSet 
	</B>| turma disciplina |
	turma := Turma new.
	disciplina := disciplinas at: umInteiro.
	disciplina &lt;&gt; nil
		ifTrue: [umDocente qtasTurmas &lt;= 4
				ifTrue: [(umDocente horarioLivre: umSet)
						ifTrue: 
							[turma disciplina: disciplina.
							turma docente: umDocente.
							turma horarios: umSet.
							umDocente turmas: turma.
							disciplina turmas: turma.
							^turma]
						ifFalse: 
							[Transcript show: 'Um professor nao pode se responsabilizar por duas turmas no mesmo horario.'; cr.
							^nil]]
				ifFalse: 
					[Transcript show: 'Um professor nao pode se responsabilizar por mais que quatro turmas'; cr.
					^nil]]
		ifFalse: 
			[Transcript show: 'Nao existe a disciplina ' , umInteiro; cr.
			^nil]</body>

<body><B>matricula: umInteiroAluno naDisciplina: umInteiroDisciplina naTurma: umaTurma horario: umSet 
	</B>| aluno disciplina matricula |
	aluno := alunos at: umInteiroAluno.
	aluno &lt;&gt; nil
		ifTrue: 
			[disciplina := disciplinas at: umInteiroDisciplina.
			disciplina &lt;&gt; nil
				ifTrue: [umaTurma disciplina = disciplina
						ifTrue: [aluno qtasTurmas &lt; 10
								ifTrue: [(aluno matriculado: disciplina horario: umSet)
										ifFalse: 
											[matricula := Matricula new.
											matricula aluno: aluno.
											matricula turma: umaTurma.
											aluno matriculas: matricula.
											umaTurma matriculas: matricula.
											^matricula]
										ifTrue: 
											[Transcript show: 'Aluno ja tem uma matricula nesta disciplina ou neste horario.'; cr.
											^nil]]
								ifFalse: 
									[Transcript show: 'Aluno nao pode se matricular em mais que 10 turmas.'; cr.
									^nil]]
						ifFalse: 
							[Transcript show: 'Esta turma nao corresponde a esta disciplina.'; cr.
							^nil]]
				ifFalse: 
					[Transcript show: 'A disciplina ' , umInteiroDisciplina , ' nao existe neste departamento.'; cr.
					^nil]]
		ifFalse: 
			[Transcript show: 'O aluno ' , umInteiroAluno , ' nao existe neste departamento.'; cr.
			^nil]</body>

<body><B>novaDisciplina: umInteiro nome: umaString1 ementa: umaString2 preRequisitos: umSet 
	</B>| disciplina |
	disciplina := Disciplina new.
	disciplina numero: umInteiro.
	disciplina nome: umaString1.
	disciplina ementa: umaString2.
	disciplina preRequisitos: umSet.
	disciplina departamento: self.
	disciplinas at: disciplina numero put: disciplina.
	^disciplina</body>

<body><B>novoAluno: umaPessoa 
	</B>| aluno |
	aluno := Aluno new.
	aluno pessoa: umaPessoa.
	aluno departamento: self.
	alunos at: aluno numeroUSP put: aluno.
	^aluno</body>

<body><B>novoDocente: umaPessoa 
	</B>| docente |
	docente := Docente new.
	docente pessoa: umaPessoa.
	docente departamento: self.
	docentes at: umaPessoa nome put: docente.
	^docente</body>
</methods>

<methods>
<class-id>Mac441.Departamento</class-id> <category>carga</category>

<body><B>cargaDidaticaDe: umaString 
	</B>| umDocente |
	umDocente := docentes at: umaString ifAbsent: [nil].
	umDocente &lt;&gt; nil ifTrue: [umDocente cargaDidatica]</body>
</methods>

<methods>
<class-id>Mac441.Departamento</class-id> <category>acesso</category>

<body>alunos
	^alunos</body>

<body><B>docentes
	</B>^docentes</body>

<body>nome: umaString
	nome := umaString</body>

<body>unidade: umaUnidade
	unidade := umaUnidade.</body>
</methods>

<methods>
<class-id>Mac441.Departamento</class-id> <category>chamada</category>

<body><B>listaDeChamadaPara: umInteiro professor: umaString 
	</B>| umDocente umaDisciplina |
	umDocente := docentes at: umaString ifAbsent: [nil].
	umDocente &lt;&gt; nil
		ifTrue: 
			[umaDisciplina := disciplinas at: umInteiro ifAbsent: [nil].
			umaDisciplina &lt;&gt; nil
				ifTrue: [umDocente listaDeChamadaDa: umaDisciplina]
				ifFalse: [Transcript show: 'Nao existe esta disciplina neste departamento.'; cr]]
		ifFalse: [Transcript show: 'Nao existe este docente neste departamento.'; cr]</body>
</methods>

<methods>
<class-id>Mac441.Departamento</class-id> <category>catalogo</category>

<body><B>catalogo
	</B>Transcript show: nome; cr.
	disciplinas keysAndValuesDo: [:numDisciplina :umaDisciplina | Transcript show: umaDisciplina nome; cr]</body>
</methods>

<methods>
<class-id>Mac441.Departamento</class-id> <category>historico</category>

<body><B>historicoEscolarDe: umInteiro 
	</B>| aluno |
	aluno := alunos at: umInteiro ifAbsent: [nil].
	aluno &lt;&gt; nil
		ifTrue: [^aluno historicoEscolar]
		ifFalse: [^nil]</body>

<body><B>situacaoNoSemestre: umInteiro 
	</B>| aluno |
	aluno := alunos at: umInteiro ifAbsent: [nil].
	aluno &lt;&gt; nil
		ifTrue: [^aluno situacaoNoSemestre]
		ifFalse: [^nil]</body>
</methods>

<methods>
<class-id>Mac441.Departamento</class-id> <category>inicializacao</category>

<body><B>initialize
	</B>nome := nil.
	unidade := nil.
	disciplinas := Dictionary new.
	docentes := Dictionary new.
	alunos := Dictionary new.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Departamento</class-id> <category>fimDeSemestre</category>

<body><B>fimDeSemestre
	</B>docentes keysAndValuesDo: [:nomeDocente :umDocente | umDocente fimDeSemestre]</body>
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

<body><B>new
	</B>^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Disciplina</class-id> <category>inicializacao</category>

<body><B>initialize
	</B>numero := nil.
	nome := nil.
	ementa := nil.
	departamento := nil.
	turmas := Set new.
	preRequisitos := Set new.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Disciplina</class-id> <category>acesso</category>

<body><B>departamento: umDepartamento 
	</B>departamento := umDepartamento</body>

<body><B>ementa: umaString 
	</B>ementa := umaString</body>

<body>nome
	^nome</body>

<body>nome: umaString
	nome := umaString</body>

<body>numero
	^numero</body>

<body><B>numero: umInteiro 
	</B>numero := umInteiro</body>

<body><B>preRequisitos: umSet 
	</B>preRequisitos := umSet</body>

<body><B>turmas: umaTurma 
	</B>turmas add: umaTurma</body>
</methods>


<class>
<name>Turma</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>disciplina docente matriculas horarios </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Turma class</class-id> <category>inicializacao</category>

<body><B>new
	</B>^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Turma</class-id> <category>fimDeSemestre</category>

<body><B>fimDeSemestre
	</B>| alunoAux historicoEscolar |
	matriculas keysAndValuesDo: [:numUSP :umaMatricula | umaMatricula nota = nil ifTrue: [^false]].
	matriculas
		keysAndValuesDo: 
			[:numUSP :umaMatricula | 
			historicoEscolar := HistoricoEscolar new.
			historicoEscolar nomeDisciplina: disciplina nome.
			historicoEscolar notaFinal: umaMatricula nota.
			historicoEscolar frequencia: umaMatricula frequencia.
			alunoAux := umaMatricula aluno.
			alunoAux historicoEscolar: historicoEscolar.
			alunoAux removeMatricula: umaMatricula].
	matriculas := nil.
	^true</body>
</methods>

<methods>
<class-id>Mac441.Turma</class-id> <category>inicializacao</category>

<body><B>initialize
	</B>disciplina := nil.
	docente := nil.
	matriculas := Dictionary new.
	horario := Set new.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Turma</class-id> <category>acesso</category>

<body><B>dadosDoAluno: numUSP 
	</B>^matriculas at: numUSP ifAbsent: [nil]</body>

<body>disciplina
	^disciplina</body>

<body>disciplina: umaDisciplina
	disciplina := umaDisciplina</body>

<body>docente
	^docente</body>

<body><B>docente: umDocente 
	</B>docente := umDocente</body>

<body><B>horario: umSet 
	</B>horario := umSet</body>

<body><B>horarios: umSet 
	</B>horarios := umSet</body>

<body><B>matriculas: umaMatricula 
	</B>matriculas at: umaMatricula aluno numeroUSP put: umaMatricula</body>

<body><B>nota: umInteiro para: numUSP senha: umaString 
	</B>| umaMatricula |
	(docente confereSenha: umaString)
		ifTrue: 
			[umaMatricula := matriculas at: numUSP ifAbsent: [nil].
			umaMatricula &lt;&gt; nil
				ifTrue: [umaMatricula nota: umInteiro]
				ifFalse: [Transcript show: 'Este aluno nao esta matriculado nesta disciplina.'; cr]]
		ifFalse: [Transcript show: 'Senha invalida ! ! !'; cr]</body>
</methods>

<methods>
<class-id>Mac441.Turma</class-id> <category>checagem</category>

<body><B>verificaHorario: umDiaEHorario 
	</B>horarios select: [:umHorarioAux | (umDiaEHorario diaDaSemana = umHorarioAux diaDaSemana and: [umDiaEHorario horario = umHorarioAux horario])
			ifTrue: [^false]].
	^true</body>
</methods>

<methods>
<class-id>Mac441.Turma</class-id> <category>chamada</category>

<body><B>listaDeChamada
	</B>Transcript show: disciplina nome.
	matriculas keysAndValuesDo: [:numUSP :umaMatricula | umaMatricula imprimeFrequencia]</body>
</methods>

<methods>
<class-id>Mac441.Turma</class-id> <category>carga</category>

<body><B>cargaDidaticaDisciplina
	</B>Transcript show: disciplina nome; cr.
	horarios select: [:umHorario | Transcript show: umHorario diaDaSemana , '   ' , umHorario horario; cr]</body>
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

<body><B>pagamento: umPagamento 
	</B>pagamento := umPagamento</body>

<body>pessoa
	^pessoa</body>

<body>pessoa: umaPessoa
	pessoa := umaPessoa</body>

<body><B>setor: umSetor 
	</B>setor := umSetor</body>
</methods>

<methods>
<class-id>Mac441.Funcionario</class-id> <category>pagamento</category>

<body><B>horasTrabalhadas: umInteiro 
	</B>pagamento qtasHorasTrab: umInteiro</body>

<body>salario
	^pagamento calculaSalario</body>
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

<body><B>qtasHorasTrab: umInteiro 
	</B>qtasHorasTrab := umInteiro</body>

<body>salarioBase: umInteiro
	salarioBase := umInteiro</body>
</methods>

<methods>
<class-id>Mac441.Pagamento</class-id> <category>imposto</category>

<body><B>impostoDeRenda: umInteiro 
	</B>umInteiro &lt;= 600
		ifTrue: [^0]
		ifFalse: [umInteiro &lt;= 1200
				ifTrue: [^umInteiro * 0.12]
				ifFalse: [^umInteiro * 0.3]]</body>
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

<body><B>new
	</B>^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Concursado</class-id> <category>inicializacao</category>

<body><B>initialize
</B>	qtasHorasTrab := 0.
	salarioBase := nil.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Concursado</class-id> <category>pagamento</category>

<body><B>calculaSalario
	</B>| salario |
	180 - qtasHorasTrab / 8 &gt; 5
		ifTrue: [salario := salarioBase - (salarioBase * 0.06)]
		ifFalse: [salario := salarioBase].
	salario := salario - (super impostoDeRenda: salario).
	^salario</body>
</methods>


<class>
<name>Universidade</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>nome unidades </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Universidade class</class-id> <category>inicializacao</category>

<body><B>new
	</B>^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Universidade</class-id> <category>fimDeSemestre</category>

<body><B>fimDeSemestre
	</B>unidades keysAndValuesDo: [:nomeUnidade :umaUnidade | umaUnidade fimDeSemestre]</body>
</methods>

<methods>
<class-id>Mac441.Universidade</class-id> <category>inicializacao</category>

<body><B>initialize
	</B>nome := nil.
	unidades := Dictionary new.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Universidade</class-id> <category>acesso</category>

<body><B>nome: umaString
	</B>nome := umaString.</body>
</methods>

<methods>
<class-id>Mac441.Universidade</class-id> <category>malaDireta</category>

<body><B>malaDiretaAlunos: umaString 
	</B>unidades keysAndValuesDo: [:nomeUnidade :umaUnidade | self malaDiretaAlunos: umaString daUnidade: umaUnidade]</body>

<body><B>malaDiretaAlunos: umaString daUnidade: umaUnidade 
	</B>umaUnidade departamentos select: [:umDepartamento | self
			malaDiretaAlunos: umaString
			daUnidade: umaUnidade
			departamento: umDepartamento]</body>

<body><B>malaDiretaAlunos: umaString daUnidade: umaUnidade departamento: umDepartamento 
	</B>umDepartamento alunos select: [:umAluno | Transcript show: 'Carta para: ' , umAluno pessoa nome; cr; show: 'Endereco: ' , umAluno pessoa endereco; cr; show: 'Conteudo: ' , umaString; cr]</body>

<body><B>malaDiretaFuncionarios: umaString 
	</B>unidades keysAndValuesDo: [:nomeUnidade :umaUnidade | self malaDiretaFuncionarios: umaString daUnidade: umaUnidade]</body>

<body><B>malaDiretaFuncionarios: umaString daUnidade: umaUnidade 
	</B>umaUnidade setores select: [:umSetor | self
			malaDiretaFuncionarios: umaString
			daUnidade: umaUnidade
			setor: umSetor]</body>

<body><B>malaDiretaFuncionarios: umaString daUnidade: umaUnidade setor: umSetor 
	</B>umSetor funcionarios select: [:umFunc | Transcript show: 'Carta para: ' , umFunc pessoa nome; cr; show: 'Endereco: ' , umFunc pessoa endereco; cr; show: 'Conteudo: ' , umaString; cr]</body>

<body><B>malaDiretaProfessores: umaString 
	</B>unidades keysAndValuesDo: [:nomeUnidade :umaUnidade | self malaDiretaProfessores: umaString daUnidade: umaUnidade]</body>

<body><B>malaDiretaProfessores: umaString daUnidade: umaUnidade 
	</B>umaUnidade departamentos select: [:umDepartamento | self
			malaDiretaProfessores: umaString
			daUnidade: umaUnidade
			departamento: umDepartamento]</body>

<body><B>malaDiretaProfessores: umaString daUnidade: umaUnidade departamento: umDepartamento 
	</B>umDepartamento docentes select: [:umDocente | Transcript show: 'Carta para: ' , umDocente pessoa nome; cr; show: 'Endereco: ' , umDocente pessoa endereco; cr; show: 'Conteudo: ' , umaString; cr]</body>
</methods>

<methods>
<class-id>Mac441.Universidade</class-id> <category>pagamento</category>

<body><B>folhaDePagamento
	</B>unidades keysAndValuesDo: [:nomeUnidade :umaUnidade | self folhaDePagamentoPara: nomeUnidade]</body>

<body><B>folhaDePagamentoPara: nomeUnidade 
	</B>| umaUnidade |
	umaUnidade := unidades at: nomeUnidade.
	umaUnidade folhaDePagamento</body>
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

<body><B>frequencia
	</B>^frequencia</body>

<body><B>imprimeFrequencia
	</B>Transcript show: aluno pessoa nome , '   frequencia: ' , frequencia</body>

<body>nota
	^nota</body>

<body>nota: umInteiro
	nota := umInteiro</body>

<body>turma
	^turma</body>

<body><B>turma: umaTurma 
	</B>turma := umaTurma</body>
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

<body><B>new
	</B>^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.CLT</class-id> <category>inicializacao</category>

<body><B>initialize
</B>	qtasHorasTrab := 0.
	salarioBase := nil.
	^self</body>
</methods>

<methods>
<class-id>Mac441.CLT</class-id> <category>pagamento</category>

<body><B>calculaSalario
	</B>| salario |
	salario := salarioBase - (0.09 * salarioBase) - (0.03 * salarioBase) - ((180 - qtasHorasTrab / 8) floor * (salarioBase / 30)).
	salario := salario - (super impostoDeRenda: salario).
	^salario</body>
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

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.HistoricoEscolar class</class-id> <category>inicializacao</category>

<body><B>new
	</B>^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.HistoricoEscolar</class-id> <category>acesso</category>

<body><B>frequencia: umInteiro 
	</B>frequencia := umInteiro</body>

<body>nomeDisciplina: umaString
	nomeDisciplina := umaString</body>

<body><B>notaFinal: umInteiro 
	</B>notaFinal := umInteiro</body>
</methods>


<class>
<name>Pessoa</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>nome rg endereco </inst-vars>
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

<body>rg: umInteiro
	rg := umInteiro</body>
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

<body><B>new
	</B>^super new initialize</body>
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

<body><B>calculaSalario
	</B>| salario |
	salario := qtasHorasTrab * salarioBase.
	salario := salario - (self impostoDeRenda: salario).
	^salario</body>

<body><B>impostoDeRenda: umInteiro 
	</B>^umInteiro * 0.1</body>
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

<body><B>new
	</B>^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Setor</class-id> <category>inicializacao</category>

<body><B>initialize
	</B>nome := nil.
	unidade := nil.
	funcionarios := Set new.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Setor</class-id> <category>contratacao</category>

<body>novoFuncionarioCLT: umaPessoa salarioBase: umInteiro
	|func pagto|
	func := Funcionario new.
	func pessoa: umaPessoa.
	func setor: self.
	pagto := CLT new.
	pagto salarioBase: umInteiro.
	func pagamento: pagto.
	funcionarios add: func.</body>
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

<body><B>folhaDePagamento
	</B>Transcript show: nome; cr.
	funcionarios select: [:umFuncionario | Transcript show: umFuncionario nome , '    R$' , umFuncionario salario; cr]</body>
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

<body><B>new
	</B>^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Docente</class-id> <category>inicializacao</category>

<body><B>initialize
	</B>departamento := nil.
	pessoa := nil.
	senha := nil.
	turmas := Set new.
	qtasTurmas := 0.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Docente</class-id> <category>acesso</category>

<body><B>departamento: umDepartamento 
	</B>departamento := umDepartamento</body>

<body>pessoa
	^pessoa</body>

<body>pessoa: umaPessoa
	pessoa := umaPessoa</body>

<body><B>qtasTurmas
	</B>^qtasTurmas</body>

<body>registraSenha: umaString
	senha := umaString</body>

<body><B>turmas: umaTurma 
	</B>qtasTurmas := qtasTurmas + 1.
	turmas add: umaTurma</body>
</methods>

<methods>
<class-id>Mac441.Docente</class-id> <category>checagem</category>

<body><B>horarioLivre: umSet 
	</B>umSet select: [:umDiaEHorario | turmas select: [:umaTurma | umaTurma verificaHorario: umDiaEHorario ifFalse: [^false]]].
	^true</body>
</methods>

<methods>
<class-id>Mac441.Docente</class-id> <category>chamada</category>

<body><B>listaDeChamadaDa: umaDisciplina 
	</B>turmas select: [:umaTurma | umaTurma disciplina = umaDisciplina ifTrue: [umaTurma listaDeChamada]]</body>
</methods>

<methods>
<class-id>Mac441.Docente</class-id> <category>carga</category>

<body><B>cargaDidatica
	</B>Transcript show: 'Carga didatica de ' , pessoa nome.
	turmas select: [:umaTurma | umaTurma cargaDidaticaDisciplina]</body>
</methods>

<methods>
<class-id>Mac441.Docente</class-id> <category>fimDeSemestre</category>

<body><B>fimDeSemestre
	</B>turmas select: [:umaTurma | umaTurma fimDeSemestre
			ifTrue: 
				[qtasTurmas := qtasTurmas - 1.
				turmas remove: umaTurma]
			ifFalse: [Transcript show: 'Docente ' , pessoa nome , ' favor entregar as notas'; cr]]</body>
</methods>


<class>
<name>Aluno</name>
<environment>Mac441</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>numeroUSP pessoa departamento matriculas qtasTurmas historicoEscolar </inst-vars>
<class-inst-vars>qtosAlunos </class-inst-vars>
<imports></imports>
<category>Mac441-Projeto</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Aluno class</class-id> <category>inicializacao</category>

<body><B>new
	</B>^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Mac441.Aluno</class-id> <category>inicializacao</category>

<body><B>initialize
	</B>numeroUSP := nil.
	pessoa := nil.
	matriculas := Set new.
	departamento := nil.
	qtasTurmas := 0.
	historicoEscolar := Set new.
	^self</body>
</methods>

<methods>
<class-id>Mac441.Aluno</class-id> <category>acesso</category>

<body><B>historicoEscolar
	</B>^historicoEscolar</body>

<body><B>historicoEscolar: umHistoricoEscolar 
	</B>historicoEscolar := umHistoricoEscolar</body>

<body><B>matriculas: umaMatricula 
	</B>matriculas add: umaMatricula.
	qtasTurmas := qtasTurmas + 1</body>

<body>numeroUSP
	^numeroUSP</body>

<body>pessoa
	^pessoa</body>

<body>qtasTurmas
	^qtasTurmas</body>

<body><B>removeMatricula: umaMatricula 
	</B>qtasTurmas := qtasTurmas - 1.
	matriculas remove: umaMatricula</body>

<body><B>situacaoNoSemestre
	</B>Transcript show: pessoa nome; cr.
	matriculas select: [:umaMatricula | Transcript show: umaMatricula turma disciplina nome , '    ' , umaMatricula turma docente pessoa nome; cr]</body>
</methods>

<methods>
<class-id>Mac441.Aluno</class-id> <category>checagem</category>

<body><B>matriculado: umaDisciplina horario: umSet 
	</B>matriculas select: [:umaMatricula | umaMatricula turma disciplina = umaDisciplina ifTrue: [^true]].
	^false</body>
</methods>



</st-source>
