// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_widget_registrar.dart';

// **************************************************************************
// Generator: JsonWidgetRegistrarBuilder
// **************************************************************************

class CustomWidgetRegistrar extends _CustomWidgetRegistrar {
  final Map<String, JsonWidgetBuilderContainer> _builders =
      <String, JsonWidgetBuilderContainer>{};

  final Map<String, Map<String, Object>> _schemas =
      <String, Map<String, Object>>{};

  static CustomWidgetRegistrar registerDefaults({
    JsonWidgetRegistry? registry,
  }) {
    registry ??= JsonWidgetRegistry.instance;
    return CustomWidgetRegistrar()
      ..withCurvedNav()
      ..withPageIndex()
      ..withSkeletonLoading()
      ..register(registry);
  }

  Map<String, Map<String, Object>> get schemas =>
      Map<String, Map<String, Object>>.from(_schemas);

  void register(JsonWidgetRegistry registry) {
    for (var b in _builders.entries) {
      registry.registerCustomBuilder(b.key, b.value);
    }

    final schemaCache = SchemaCache();
    for (var s in _schemas.entries) {
      schemaCache.addSchema(s.key, s.value);
    }
  }

  void withCurvedNav() {
    _builders[CurvedNavBarBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: CurvedNavBarBuilder.fromDynamic,
      schemaId: CurvedNavSchema.id,
    );
    _schemas[CurvedNavSchema.id] = CurvedNavSchema.schema;
  }

  void withPageIndex() {
    _builders[PageIndexBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: PageIndexBuilder.fromDynamic,
      schemaId: PageIndexSchema.id,
    );
    _schemas[PageIndexSchema.id] = PageIndexSchema.schema;
  }

  void withSkeletonLoading() {
    _builders[SkeletonLoadingBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: SkeletonLoadingBuilder.fromDynamic,
      schemaId: SkeletonLoadingSchema.id,
    );
    _schemas[SkeletonLoadingSchema.id] = SkeletonLoadingSchema.schema;
  }
}
