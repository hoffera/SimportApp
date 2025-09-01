class UserModel {
  final String nome;
  final String foto;
  final String associadoDesde;

  UserModel({
    required this.nome,
    required this.foto,
    required this.associadoDesde,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      nome: json["nome"] as String? ?? "",
      foto: json["foto"] as String? ?? "",
      associadoDesde: json["associadoDesde"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {"nome": nome, "foto": foto, "associadoDesde": associadoDesde};
  }

  UserModel copyWith({String? nome, String? foto, String? associadoDesde}) {
    return UserModel(
      nome: nome ?? this.nome,
      foto: foto ?? this.foto,
      associadoDesde: associadoDesde ?? this.associadoDesde,
    );
  }
}
