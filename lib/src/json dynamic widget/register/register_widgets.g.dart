// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_widgets.dart';

// **************************************************************************
// Generator: JsonWidgetRegistrarBuilder
// **************************************************************************

class RegisterWidgets extends _RegisterWidgets {
  final Map<String, JsonWidgetBuilderContainer> _builders =
      <String, JsonWidgetBuilderContainer>{};

  final Map<String, Map<String, Object>> _schemas =
      <String, Map<String, Object>>{};

  static RegisterWidgets registerDefaults({JsonWidgetRegistry? registry}) {
    registry ??= JsonWidgetRegistry.instance;
    return RegisterWidgets()
      ..withAlertDialog()
      ..withCurvedNav()
      ..withDropdownLanguage()
      ..withMareCard()
      ..withPageIndex()
      ..withSkeletonLoading()
      ..withSvg()
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

  void withAlertDialog() {
    _builders[AlertDialogBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: AlertDialogBuilder.fromDynamic,
      schemaId: AlertDialogSchema.id,
    );
    _schemas[AlertDialogSchema.id] = AlertDialogSchema.schema;
  }

  void withCurvedNav() {
    _builders[CurvedNavBarBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: CurvedNavBarBuilder.fromDynamic,
      schemaId: CurvedNavSchema.id,
    );
    _schemas[CurvedNavSchema.id] = CurvedNavSchema.schema;
  }

  void withDropdownLanguage() {
    _builders[DropdownLanguageBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: DropdownLanguageBuilder.fromDynamic,
      schemaId: DropdownLanguageSchema.id,
    );
    _schemas[DropdownLanguageSchema.id] = DropdownLanguageSchema.schema;
  }

  void withMareCard() {
    _builders[MareCardBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: MareCardBuilder.fromDynamic,
      schemaId: MareCardSchema.id,
    );
    _schemas[MareCardSchema.id] = MareCardSchema.schema;
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

  void withSvg() {
    _builders[SvgBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: SvgBuilder.fromDynamic,
      schemaId: SvgSchema.id,
    );
    _schemas[SvgSchema.id] = SvgSchema.schema;
  }
}
