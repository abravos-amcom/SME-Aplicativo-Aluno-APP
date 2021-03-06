class Student {
  int codigoEol;
  String nome;
  String nomeSocial;
  String escola;
  int codigoTipoEscola;
  String descricaoTipoEscola;
  String siglaDre;
  String turma;
  String situacaoMatricula;
  String dataNascimento;
  String dataSituacaoMatricula;

  Student(
      {this.codigoEol,
      this.nome,
      this.nomeSocial,
      this.escola,
      this.codigoTipoEscola,
      this.descricaoTipoEscola,
      this.siglaDre,
      this.turma,
      this.situacaoMatricula,
      this.dataNascimento,
      this.dataSituacaoMatricula});

  Student.fromJson(Map<String, dynamic> json) {
    codigoEol = json['codigoEol'];
    nome = json['nome'];
    nomeSocial = json['nomeSocial'];
    escola = json['escola'];
    codigoTipoEscola = json['codigoTipoEscola'];
    descricaoTipoEscola = json['descricaoTipoEscola'];
    siglaDre = json['siglaDre'];
    turma = json['turma'];
    situacaoMatricula = json['situacaoMatricula'];
    dataNascimento = json['dataNascimento'];
    dataSituacaoMatricula = json['dataSituacaoMatricula'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigoEol'] = this.codigoEol;
    data['nome'] = this.nome;
    data['nomeSocial'] = this.nomeSocial;
    data['escola'] = this.escola;
    data['codigoTipoEscola'] = this.codigoTipoEscola;
    data['descricaoTipoEscola'] = this.descricaoTipoEscola;
    data['siglaDre'] = this.siglaDre;
    data['turma'] = this.turma;
    data['situacaoMatricula'] = this.situacaoMatricula;
    data['dataNascimento'] = this.dataNascimento;
    data['dataSituacaoMatricula'] = this.dataSituacaoMatricula;
    return data;
  }
}
