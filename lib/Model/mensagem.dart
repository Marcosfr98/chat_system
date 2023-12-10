class Mensagem {
  Codigo? codigo;

  Mensagem({this.codigo});

  Mensagem.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'] != null ? Codigo.fromJson(json['codigo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (codigo != null) {
      data['codigo'] = codigo!.toJson();
    }
    return data;
  }
}

class Codigo {
  Horario? horario;

  Codigo({this.horario});

  Codigo.fromJson(Map<String, dynamic> json) {
    horario =
        json['horario'] != null ? Horario.fromJson(json['horario']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (horario != null) {
      data['horario'] = horario!.toJson();
    }
    return data;
  }
}

class Horario {
  String? uid;

  Horario({this.uid});

  Horario.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    return data;
  }
}
