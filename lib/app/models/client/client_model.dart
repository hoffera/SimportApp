class Client {
  final String? identificacao;
  final String nome;
  final String? logo;
  final List<ViewClass>? views;
  final String? id;
  final Map<String, dynamic>? themeLight;
  final Map<String, dynamic>? themeDark;

  Client({
    this.identificacao,
    required this.nome,
    this.logo,
    this.views,
    this.id,
    this.themeLight,
    this.themeDark,
  });

  Client copyWith({
    String? identificacao,
    String? nome,
    String? logo,
    List<ViewClass>? views,
    String? id,
    Map<String, dynamic>? themeLight,
    Map<String, dynamic>? themeDark,
  }) => Client(
    identificacao: identificacao ?? this.identificacao,
    nome: nome ?? this.nome,
    logo: logo ?? this.logo,
    views: views ?? this.views,
    id: id ?? this.id,
    themeLight: themeLight ?? this.themeLight,
    themeDark: themeDark ?? this.themeDark,
  );

  factory Client.fromJson(Map<String, dynamic> json) {
    List<ViewClass> parseViews(dynamic jsonViews) {
      if (jsonViews == null) return [];

      List<ViewClass> result = [];

      for (final item in jsonViews) {
        if (item is List) {
          result.addAll(item.map<ViewClass>((x) => ViewClass.fromJson(x)));
        } else if (item is Map<String, dynamic>) {
          result.add(ViewClass.fromJson(item));
        }
      }

      return result;
    }

    final theme = json["theme"] as Map<String, dynamic>?;

    return Client(
      identificacao: json["identificacao"],
      nome: json["nome"],
      logo: json["logo"],
      views: parseViews(json["views"]),
      id: json["id"],
      themeLight: theme != null && theme.containsKey("light")
          ? Map<String, dynamic>.from(theme["light"])
          : null,
      themeDark: theme != null && theme.containsKey("dark")
          ? Map<String, dynamic>.from(theme["dark"])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "identificacao": identificacao,
    "nome": nome,
    "logo": logo,
    "views": views?.map((v) => v.toJson()).toList(),
    "id": id,
    "theme": {"light": themeLight, "dark": themeDark},
  };
}

class ViewClass {
  final int? id;
  final String? titulo;
  final Map<String, dynamic>? skeleton;
  final bool? principal;

  ViewClass({this.id, this.titulo, this.skeleton, this.principal});

  ViewClass copyWith({
    int? id,
    String? titulo,
    Map<String, dynamic>? skeleton,
    bool? principal,
  }) => ViewClass(
    id: id ?? this.id,
    titulo: titulo ?? this.titulo,
    skeleton: skeleton ?? this.skeleton,
    principal: principal ?? this.principal,
  );

  factory ViewClass.fromJson(Map<String, dynamic> json) => ViewClass(
    id: json["id"],
    titulo: json["titulo"],
    skeleton: json["skeleton"] == null
        ? null
        : Map<String, dynamic>.from(json["skeleton"]),
    principal: json["principal"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "titulo": titulo,
    "skeleton": skeleton,
    "principal": principal,
  };
}
