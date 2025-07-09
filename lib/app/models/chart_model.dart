import 'dart:convert';

Chart chartFromJson(String str) => Chart.fromJson(json.decode(str));

String chartToJson(Chart data) => json.encode(data.toJson());

class Chart {
  final int? id;
  final dynamic minScale;
  final dynamic maxScale;
  final bool? active;
  final dynamic dataGroup;
  final dynamic data;
  final List<ChartElement>? charts;
  final List<dynamic>? plotBandsIntervals;
  final bool? gradientColors;
  final String? description;
  final ChartI18N? i18N;
  final String? subDescription;
  final int? type;

  Chart({
    this.id,
    this.minScale,
    this.maxScale,
    this.active,
    this.dataGroup,
    this.data,
    this.charts,
    this.plotBandsIntervals,
    this.gradientColors,
    this.description,
    this.i18N,
    this.subDescription,
    this.type,
  });

  Chart copyWith({
    int? id,
    dynamic minScale,
    dynamic maxScale,
    bool? active,
    dynamic dataGroup,
    dynamic data,
    List<ChartElement>? charts,
    List<dynamic>? plotBandsIntervals,
    bool? gradientColors,
    String? description,
    ChartI18N? i18N,
    String? subDescription,
    int? type,
  }) => Chart(
    id: id ?? this.id,
    minScale: minScale ?? this.minScale,
    maxScale: maxScale ?? this.maxScale,
    active: active ?? this.active,
    dataGroup: dataGroup ?? this.dataGroup,
    data: data ?? this.data,
    charts: charts ?? this.charts,
    plotBandsIntervals: plotBandsIntervals ?? this.plotBandsIntervals,
    gradientColors: gradientColors ?? this.gradientColors,
    description: description ?? this.description,
    i18N: i18N ?? this.i18N,
    subDescription: subDescription ?? this.subDescription,
    type: type ?? this.type,
  );

  factory Chart.fromJson(Map<String, dynamic> json) => Chart(
    id: json["id"],
    minScale: json["minScale"],
    maxScale: json["maxScale"],
    active: json["active"],
    dataGroup: json["dataGroup"],
    data: json["data"],
    charts: json["charts"] == null
        ? []
        : List<ChartElement>.from(
            json["charts"]!.map((x) => ChartElement.fromJson(x)),
          ),
    plotBandsIntervals: json["plotBandsIntervals"] == null
        ? []
        : List<dynamic>.from(json["plotBandsIntervals"]!.map((x) => x)),
    gradientColors: json["gradientColors"],
    description: json["description"],
    i18N: json["i18n"] == null ? null : ChartI18N.fromJson(json["i18n"]),
    subDescription: json["subDescription"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "minScale": minScale,
    "maxScale": maxScale,
    "active": active,
    "dataGroup": dataGroup,
    "data": data,
    "charts": charts == null
        ? []
        : List<dynamic>.from(charts!.map((x) => x.toJson())),
    "plotBandsIntervals": plotBandsIntervals == null
        ? []
        : List<dynamic>.from(plotBandsIntervals!.map((x) => x)),
    "gradientColors": gradientColors,
    "description": description,
    "i18n": i18N?.toJson(),
    "subDescription": subDescription,
    "type": type,
  };
}

class ChartElement {
  final int? id;
  final dynamic minScale;
  final dynamic maxScale;
  final bool? active;
  final DataGroup? dataGroup;
  final Dat? data;
  final int? chartType;
  final bool? gradientColors;
  final bool? singleValue;
  final List<dynamic>? plotBandsIntervals;
  final int? type;

  ChartElement({
    this.id,
    this.minScale,
    this.maxScale,
    this.active,
    this.dataGroup,
    this.data,
    this.chartType,
    this.gradientColors,
    this.singleValue,
    this.plotBandsIntervals,
    this.type,
  });

  ChartElement copyWith({
    int? id,
    dynamic minScale,
    dynamic maxScale,
    bool? active,
    DataGroup? dataGroup,
    Dat? data,
    int? chartType,
    bool? gradientColors,
    bool? singleValue,
    List<dynamic>? plotBandsIntervals,
    int? type,
  }) => ChartElement(
    id: id ?? this.id,
    minScale: minScale ?? this.minScale,
    maxScale: maxScale ?? this.maxScale,
    active: active ?? this.active,
    dataGroup: dataGroup ?? this.dataGroup,
    data: data ?? this.data,
    chartType: chartType ?? this.chartType,
    gradientColors: gradientColors ?? this.gradientColors,
    singleValue: singleValue ?? this.singleValue,
    plotBandsIntervals: plotBandsIntervals ?? this.plotBandsIntervals,
    type: type ?? this.type,
  );

  factory ChartElement.fromJson(Map<String, dynamic> json) => ChartElement(
    id: json["id"],
    minScale: json["minScale"],
    maxScale: json["maxScale"],
    active: json["active"],
    dataGroup: json["dataGroup"] == null
        ? null
        : DataGroup.fromJson(json["dataGroup"]),
    data: json["data"] == null ? null : Dat.fromJson(json["data"]),
    chartType: json["chartType"],
    gradientColors: json["gradientColors"],
    singleValue: json["singleValue"],
    plotBandsIntervals: json["plotBandsIntervals"] == null
        ? []
        : List<dynamic>.from(json["plotBandsIntervals"]!.map((x) => x)),
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "minScale": minScale,
    "maxScale": maxScale,
    "active": active,
    "dataGroup": dataGroup?.toJson(),
    "data": data?.toJson(),
    "chartType": chartType,
    "gradientColors": gradientColors,
    "singleValue": singleValue,
    "plotBandsIntervals": plotBandsIntervals == null
        ? []
        : List<dynamic>.from(plotBandsIntervals!.map((x) => x)),
    "type": type,
  };
}

class DataGroup {
  final String? type;
  final dynamic fullDescription;
  final bool? active;
  final List<Dat>? data;
  final DataType? dataType;
  final String? dataGroupId;
  final String? description;
  final int? refreshInterval;
  final int? periodInterval;
  final String? empty;

  DataGroup({
    this.type,
    this.fullDescription,
    this.active,
    this.data,
    this.dataType,
    this.dataGroupId,
    this.description,
    this.refreshInterval,
    this.periodInterval,
    this.empty,
  });

  DataGroup copyWith({
    String? type,
    dynamic fullDescription,
    bool? active,
    List<Dat>? data,
    DataType? dataType,
    String? dataGroupId,
    String? description,
    int? refreshInterval,
    int? periodInterval,
    String? empty,
  }) => DataGroup(
    type: type ?? this.type,
    fullDescription: fullDescription ?? this.fullDescription,
    active: active ?? this.active,
    data: data ?? this.data,
    dataType: dataType ?? this.dataType,
    dataGroupId: dataGroupId ?? this.dataGroupId,
    description: description ?? this.description,
    refreshInterval: refreshInterval ?? this.refreshInterval,
    periodInterval: periodInterval ?? this.periodInterval,
    empty: empty ?? this.empty,
  );

  factory DataGroup.fromJson(Map<String, dynamic> json) => DataGroup(
    type: json["type"],
    fullDescription: json["fullDescription"],
    active: json["active"],
    data: json["data"] == null
        ? []
        : List<Dat>.from(json["data"]!.map((x) => Dat.fromJson(x))),
    dataType: json["dataType"] == null
        ? null
        : DataType.fromJson(json["dataType"]),
    dataGroupId: json["dataGroupId"],
    description: json["description"],
    refreshInterval: json["refreshInterval"],
    periodInterval: json["periodInterval"],
    empty: json[""],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "fullDescription": fullDescription,
    "active": active,
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
    "dataType": dataType?.toJson(),
    "dataGroupId": dataGroupId,
    "description": description,
    "refreshInterval": refreshInterval,
    "periodInterval": periodInterval,
    "": empty,
  };
}

class Dat {
  final Route? route;
  final int? id;
  final String? unitType;
  final String? defaultUnit;
  final DataGroup? dataGroup;
  final List<dynamic>? operationalValues;
  final String? name;
  final String? iconUrl;

  Dat({
    this.route,
    this.id,
    this.unitType,
    this.defaultUnit,
    this.dataGroup,
    this.operationalValues,
    this.name,
    this.iconUrl,
  });

  Dat copyWith({
    Route? route,
    int? id,
    String? unitType,
    String? defaultUnit,
    DataGroup? dataGroup,
    List<dynamic>? operationalValues,
    String? name,
    String? iconUrl,
  }) => Dat(
    route: route ?? this.route,
    id: id ?? this.id,
    unitType: unitType ?? this.unitType,
    defaultUnit: defaultUnit ?? this.defaultUnit,
    dataGroup: dataGroup ?? this.dataGroup,
    operationalValues: operationalValues ?? this.operationalValues,
    name: name ?? this.name,
    iconUrl: iconUrl ?? this.iconUrl,
  );

  factory Dat.fromJson(Map<String, dynamic> json) => Dat(
    route: json["route"] == null ? null : Route.fromJson(json["route"]),
    id: json["id"],
    unitType: json["unitType"],
    defaultUnit: json["defaultUnit"],
    dataGroup: json["dataGroup"] == null
        ? null
        : DataGroup.fromJson(json["dataGroup"]),
    operationalValues: json["operationalValues"] == null
        ? []
        : List<dynamic>.from(json["operationalValues"]!.map((x) => x)),
    name: json["name"],
    iconUrl: json["iconURL"],
  );

  Map<String, dynamic> toJson() => {
    "route": route?.toJson(),
    "id": id,
    "unitType": unitType,
    "defaultUnit": defaultUnit,
    "dataGroup": dataGroup?.toJson(),
    "operationalValues": operationalValues == null
        ? []
        : List<dynamic>.from(operationalValues!.map((x) => x)),
    "name": name,
    "iconURL": iconUrl,
  };
}

class DataType {
  final int? id;
  final DataTypeI18N? i18N;
  final String? iconUrl;
  final String? name;
  final String? empty;

  DataType({this.id, this.i18N, this.iconUrl, this.name, this.empty});

  DataType copyWith({
    int? id,
    DataTypeI18N? i18N,
    String? iconUrl,
    String? name,
    String? empty,
  }) => DataType(
    id: id ?? this.id,
    i18N: i18N ?? this.i18N,
    iconUrl: iconUrl ?? this.iconUrl,
    name: name ?? this.name,
    empty: empty ?? this.empty,
  );

  factory DataType.fromJson(Map<String, dynamic> json) => DataType(
    id: json["id"],
    i18N: json["i18n"] == null ? null : DataTypeI18N.fromJson(json["i18n"]),
    iconUrl: json["iconURL"],
    name: json["name"],
    empty: json[""],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "i18n": i18N?.toJson(),
    "iconURL": iconUrl,
    "name": name,
    "": empty,
  };
}

class DataTypeI18N {
  final PurpleEn? en;
  final PurpleEn? es;

  DataTypeI18N({this.en, this.es});

  DataTypeI18N copyWith({PurpleEn? en, PurpleEn? es}) =>
      DataTypeI18N(en: en ?? this.en, es: es ?? this.es);

  factory DataTypeI18N.fromJson(Map<String, dynamic> json) => DataTypeI18N(
    en: json["en"] == null ? null : PurpleEn.fromJson(json["en"]),
    es: json["es"] == null ? null : PurpleEn.fromJson(json["es"]),
  );

  Map<String, dynamic> toJson() => {"en": en?.toJson(), "es": es?.toJson()};
}

class PurpleEn {
  final String? name;

  PurpleEn({this.name});

  PurpleEn copyWith({String? name}) => PurpleEn(name: name ?? this.name);

  factory PurpleEn.fromJson(Map<String, dynamic> json) =>
      PurpleEn(name: json["name"]);

  Map<String, dynamic> toJson() => {"name": name};
}

class Route {
  final int? id;
  final String? dataGroupId;
  final String? equipmentId;
  final int? stationId;
  final int? regionId;
  final String? stationDesc;
  final String? regionDesc;

  Route({
    this.id,
    this.dataGroupId,
    this.equipmentId,
    this.stationId,
    this.regionId,
    this.stationDesc,
    this.regionDesc,
  });

  Route copyWith({
    int? id,
    String? dataGroupId,
    String? equipmentId,
    int? stationId,
    int? regionId,
    String? stationDesc,
    String? regionDesc,
  }) => Route(
    id: id ?? this.id,
    dataGroupId: dataGroupId ?? this.dataGroupId,
    equipmentId: equipmentId ?? this.equipmentId,
    stationId: stationId ?? this.stationId,
    regionId: regionId ?? this.regionId,
    stationDesc: stationDesc ?? this.stationDesc,
    regionDesc: regionDesc ?? this.regionDesc,
  );

  factory Route.fromJson(Map<String, dynamic> json) => Route(
    id: json["id"],
    dataGroupId: json["dataGroupId"],
    equipmentId: json["equipmentId"],
    stationId: json["stationId"],
    regionId: json["regionId"],
    stationDesc: json["stationDesc"],
    regionDesc: json["regionDesc"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "dataGroupId": dataGroupId,
    "equipmentId": equipmentId,
    "stationId": stationId,
    "regionId": regionId,
    "stationDesc": stationDesc,
    "regionDesc": regionDesc,
  };
}

class ChartI18N {
  final FluffyEn? en;
  final FluffyEn? es;

  ChartI18N({this.en, this.es});

  ChartI18N copyWith({FluffyEn? en, FluffyEn? es}) =>
      ChartI18N(en: en ?? this.en, es: es ?? this.es);

  factory ChartI18N.fromJson(Map<String, dynamic> json) => ChartI18N(
    en: json["en"] == null ? null : FluffyEn.fromJson(json["en"]),
    es: json["es"] == null ? null : FluffyEn.fromJson(json["es"]),
  );

  Map<String, dynamic> toJson() => {"en": en?.toJson(), "es": es?.toJson()};
}

class FluffyEn {
  final dynamic description;
  final dynamic subDescription;

  FluffyEn({this.description, this.subDescription});

  FluffyEn copyWith({dynamic description, dynamic subDescription}) => FluffyEn(
    description: description ?? this.description,
    subDescription: subDescription ?? this.subDescription,
  );

  factory FluffyEn.fromJson(Map<String, dynamic> json) => FluffyEn(
    description: json["description"],
    subDescription: json["subDescription"],
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "subDescription": subDescription,
  };
}
