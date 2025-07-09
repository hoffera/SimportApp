// To parse this JSON data, do
//
//     final antonina = antoninaFromJson(jsonString);

import 'dart:convert';

Antonina? antoninaFromJson(String str) => Antonina.fromJson(json.decode(str));

String? antoninaToJson(Antonina? data) =>
    data == null ? null : json.encode(data.toJson());

class Antonina {
  final List<AntoninaView>? views;
  final List<Layer>? layers;
  final String? lastVersion;
  final String? hash;

  Antonina({this.views, this.layers, this.lastVersion, this.hash});

  Antonina copyWith({
    List<AntoninaView>? views,
    List<Layer>? layers,
    String? lastVersion,
    String? hash,
  }) => Antonina(
    views: views ?? this.views,
    layers: layers ?? this.layers,
    lastVersion: lastVersion ?? this.lastVersion,
    hash: hash ?? this.hash,
  );

  factory Antonina.fromJson(Map<String, dynamic>? json) => Antonina(
    views: json?['views'] == null
        ? null
        : List<AntoninaView>.from(
            json!['views'].map((x) => AntoninaView.fromJson(x)),
          ),
    layers: json?['layers'] == null
        ? null
        : List<Layer>.from(json?['layers'].map((x) => Layer.fromJson(x))),
    lastVersion: json?['lastVersion'],
    hash: json?['hash'],
  );

  Map<String, dynamic> toJson() => {
    'views': views?.map((x) => x.toJson()).toList(),
    'layers': layers?.map((x) => x.toJson()).toList(),
    'lastVersion': lastVersion,
    'hash': hash,
  };
}

class Layer {
  final String? textType;
  final int? id;
  final String? name;
  final LayerI18N? i18N;
  final int? epsg;
  final bool? active;
  final dynamic position;
  final String? origin;
  final String? url;
  final List<dynamic>? fields;
  final int? legendType;
  final String? layer;
  final dynamic legendDescription;
  final int? type;

  Layer({
    this.textType,
    this.id,
    this.name,
    this.i18N,
    this.epsg,
    this.active,
    this.position,
    this.origin,
    this.url,
    this.fields,
    this.legendType,
    this.layer,
    this.legendDescription,
    this.type,
  });

  Layer copyWith({
    String? textType,
    int? id,
    String? name,
    LayerI18N? i18N,
    int? epsg,
    bool? active,
    dynamic position,
    String? origin,
    String? url,
    List<dynamic>? fields,
    int? legendType,
    String? layer,
    dynamic legendDescription,
    int? type,
  }) => Layer(
    textType: textType ?? this.textType,
    id: id ?? this.id,
    name: name ?? this.name,
    i18N: i18N ?? this.i18N,
    epsg: epsg ?? this.epsg,
    active: active ?? this.active,
    position: position ?? this.position,
    origin: origin ?? this.origin,
    url: url ?? this.url,
    fields: fields ?? this.fields,
    legendType: legendType ?? this.legendType,
    layer: layer ?? this.layer,
    legendDescription: legendDescription ?? this.legendDescription,
    type: type ?? this.type,
  );

  factory Layer.fromJson(Map<String, dynamic>? json) => Layer(
    textType: json?['text_type'],
    id: json?['id'],
    name: json?['name'],
    i18N: json?['i18n'] == null ? null : LayerI18N.fromJson(json!['i18n']),
    epsg: json?['epsg'],
    active: json?['active'],
    position: json?['position'],
    origin: json?['origin'],
    url: json?['url'],
    fields: json?['fields'] == null
        ? null
        : List<dynamic>.from(json!['fields']),
    legendType: json?['legend_type'],
    layer: json?['layer'],
    legendDescription: json?['legend_description'],
    type: json?['type'],
  );

  Map<String, dynamic> toJson() => {
    'text_type': textType,
    'id': id,
    'name': name,
    'i18n': i18N?.toJson(),
    'epsg': epsg,
    'active': active,
    'position': position,
    'origin': origin,
    'url': url,
    'fields': fields,
    'legend_type': legendType,
    'layer': layer,
    'legend_description': legendDescription,
    'type': type,
  };
}

class LayerI18N {
  final PurpleEn? en;
  final PurpleEn? es;

  LayerI18N({this.en, this.es});

  LayerI18N copyWith({PurpleEn? en, PurpleEn? es}) =>
      LayerI18N(en: en ?? this.en, es: es ?? this.es);

  factory LayerI18N.fromJson(Map<String, dynamic>? json) => LayerI18N(
    en: json?['en'] == null ? null : PurpleEn.fromJson(json!['en']),
    es: json?['es'] == null ? null : PurpleEn.fromJson(json!['es']),
  );

  Map<String, dynamic> toJson() => {'en': en?.toJson(), 'es': es?.toJson()};
}

class PurpleEn {
  final dynamic name;

  PurpleEn({this.name});

  PurpleEn copyWith({dynamic name}) => PurpleEn(name: name ?? this.name);

  factory PurpleEn.fromJson(Map<String, dynamic>? json) =>
      PurpleEn(name: json?['name']);

  Map<String, dynamic> toJson() => {'name': name};
}

class AntoninaView {
  final String? filterId;
  final List<ViewView>? views;
  final int? group;
  final dynamic dataSource;
  final String? regionId;
  final int? id;
  final String? description;
  final String? notes;
  final int? filterType;
  final bool? defaultView;
  final String? iconUrl;
  final dynamic position;

  AntoninaView({
    this.filterId,
    this.views,
    this.group,
    this.dataSource,
    this.regionId,
    this.id,
    this.description,
    this.notes,
    this.filterType,
    this.defaultView,
    this.iconUrl,
    this.position,
  });

  AntoninaView copyWith({
    String? filterId,
    List<ViewView>? views,
    int? group,
    dynamic dataSource,
    String? regionId,
    int? id,
    String? description,
    String? notes,
    int? filterType,
    bool? defaultView,
    String? iconUrl,
    dynamic position,
  }) => AntoninaView(
    filterId: filterId ?? this.filterId,
    views: views ?? this.views,
    group: group ?? this.group,
    dataSource: dataSource ?? this.dataSource,
    regionId: regionId ?? this.regionId,
    id: id ?? this.id,
    description: description ?? this.description,
    notes: notes ?? this.notes,
    filterType: filterType ?? this.filterType,
    defaultView: defaultView ?? this.defaultView,
    iconUrl: iconUrl ?? this.iconUrl,
    position: position ?? this.position,
  );

  factory AntoninaView.fromJson(Map<String, dynamic>? json) => AntoninaView(
    filterId: json?['filter_id'],
    views: json?['views'] == null
        ? null
        : List<ViewView>.from(json!['views'].map((x) => ViewView.fromJson(x))),
    group: json?['group'],
    dataSource: json?['dataSource'],
    regionId: json?['regionId'],
    id: json?['id'],
    description: json?['description'],
    notes: json?['notes'],
    filterType: json?['filter_type'],
    defaultView: json?['default_view'],
    iconUrl: json?['icon_url'],
    position: json?['position'],
  );

  Map<String, dynamic> toJson() => {
    'filter_id': filterId,
    'views': views?.map((x) => x.toJson()).toList(),
    'group': group,
    'dataSource': dataSource,
    'regionId': regionId,
    'id': id,
    'description': description,
    'notes': notes,
    'filter_type': filterType,
    'default_view': defaultView,
    'icon_url': iconUrl,
    'position': position,
  };
}

class ViewView {
  final Type? type;
  final String? id;
  final int? x;
  final int? y;
  final int? width;
  final int? height;
  final Extra? extra;

  ViewView({
    this.type,
    this.id,
    this.x,
    this.y,
    this.width,
    this.height,
    this.extra,
  });

  ViewView copyWith({
    Type? type,
    String? id,
    int? x,
    int? y,
    int? width,
    int? height,
    Extra? extra,
  }) => ViewView(
    type: type ?? this.type,
    id: id ?? this.id,
    x: x ?? this.x,
    y: y ?? this.y,
    width: width ?? this.width,
    height: height ?? this.height,
    extra: extra ?? this.extra,
  );

  factory ViewView.fromJson(Map<String, dynamic>? json) => ViewView(
    type: json?['type'] == null ? null : typeValues.map[json!['type']],
    id: json?['id'],
    x: json?['x'],
    y: json?['y'],
    width: json?['width'],
    height: json?['height'],
    extra: json?['extra'] == null ? null : Extra.fromJson(json?['extra']),
  );

  Map<String, dynamic> toJson() => {
    'type': type == null ? null : typeValues.reverse[type!],
    'id': id,
    'x': x,
    'y': y,
    'width': width,
    'height': height,
    'extra': extra?.toJson(),
  };
}

class Extra {
  final String? description;
  final String? shortDescription;
  final ForegroundColor? foregroundColor;
  final BackgroundColor? backgroundColor;
  final String? urlAction;
  final String? iconUrl;
  final String? embed;
  final ExtraI18N? i18N;
  final bool? enabled;

  Extra({
    this.description,
    this.shortDescription,
    this.foregroundColor,
    this.backgroundColor,
    this.urlAction,
    this.iconUrl,
    this.embed,
    this.i18N,
    this.enabled,
  });

  Extra copyWith({
    String? description,
    String? shortDescription,
    ForegroundColor? foregroundColor,
    BackgroundColor? backgroundColor,
    String? urlAction,
    String? iconUrl,
    String? embed,
    ExtraI18N? i18N,
    bool? enabled,
  }) => Extra(
    description: description ?? this.description,
    shortDescription: shortDescription ?? this.shortDescription,
    foregroundColor: foregroundColor ?? this.foregroundColor,
    backgroundColor: backgroundColor ?? this.backgroundColor,
    urlAction: urlAction ?? this.urlAction,
    iconUrl: iconUrl ?? this.iconUrl,
    embed: embed ?? this.embed,
    i18N: i18N ?? this.i18N,
    enabled: enabled ?? this.enabled,
  );

  factory Extra.fromJson(Map<String, dynamic>? json) => Extra(
    description: json?['description'],
    shortDescription: json?['shortDescription'],
    foregroundColor: json?['foregroundColor'] == null
        ? null
        : foregroundColorValues.map[json!['foregroundColor']],
    backgroundColor: json?['backgroundColor'] == null
        ? null
        : backgroundColorValues.map[json!['backgroundColor']],
    urlAction: json?['urlAction'],
    iconUrl: json?['iconUrl'],
    embed: json?['embed'],
    i18N: json?['i18n'] == null ? null : ExtraI18N.fromJson(json?['i18n']),
    enabled: json?['enabled'],
  );

  Map<String, dynamic> toJson() => {
    'description': description,
    'shortDescription': shortDescription,
    'foregroundColor': foregroundColor == null
        ? null
        : foregroundColorValues.reverse[foregroundColor!],
    'backgroundColor': backgroundColor == null
        ? null
        : backgroundColorValues.reverse[backgroundColor!],
    'urlAction': urlAction,
    'iconUrl': iconUrl,
    'embed': embed,
    'i18n': i18N?.toJson(),
    'enabled': enabled,
  };
}

enum BackgroundColor { RGBA_2472472471, RGBA_771371771 }

final backgroundColorValues = EnumValues({
  'rgba(247, 247, 247, 1)': BackgroundColor.RGBA_2472472471,
  'rgba(77, 137, 177, 1)': BackgroundColor.RGBA_771371771,
});

enum ForegroundColor { RGBA_2472472471, RGBA_7878781 }

final foregroundColorValues = EnumValues({
  'rgba(247, 247, 247, 1)': ForegroundColor.RGBA_2472472471,
  'rgba(78, 78, 78, 1)': ForegroundColor.RGBA_7878781,
});

class ExtraI18N {
  final FluffyEn? en;
  final FluffyEn? es;

  ExtraI18N({this.en, this.es});

  ExtraI18N copyWith({FluffyEn? en, FluffyEn? es}) =>
      ExtraI18N(en: en ?? this.en, es: es ?? this.es);

  factory ExtraI18N.fromJson(Map<String, dynamic>? json) => ExtraI18N(
    en: json?['en'] == null ? null : FluffyEn.fromJson(json!['en']),
    es: json?['es'] == null ? null : FluffyEn.fromJson(json!['es']),
  );

  Map<String, dynamic> toJson() => {'en': en?.toJson(), 'es': es?.toJson()};
}

class FluffyEn {
  final String? description;
  final String? shortDescription;

  FluffyEn({this.description, this.shortDescription});

  FluffyEn copyWith({String? description, String? shortDescription}) =>
      FluffyEn(
        description: description ?? this.description,
        shortDescription: shortDescription ?? this.shortDescription,
      );

  factory FluffyEn.fromJson(Map<String, dynamic>? json) => FluffyEn(
    description: json?['description'],
    shortDescription: json?['shortDescription'],
  );

  Map<String, dynamic> toJson() => {
    'description': description,
    'shortDescription': shortDescription,
  };
}

enum Type { CHART, FIELD, SEPARATOR }

final typeValues = EnumValues({
  'chart': Type.CHART,
  'field': Type.FIELD,
  'separator': Type.SEPARATOR,
});

class EnumValues<T> {
  final Map<String, T> map;
  late final Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
