// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_dialog.dart';

// **************************************************************************
// Generator: JsonWidgetLibraryBuilder
// **************************************************************************

// ignore_for_file: avoid_init_to_null
// ignore_for_file: deprecated_member_use

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_final_locals
// ignore_for_file: prefer_if_null_operators
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unused_local_variable

class AlertDialogBuilder extends _AlertDialogBuilder {
  const AlertDialogBuilder({required super.args});

  static const kType = 'alert_dialog';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static AlertDialogBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => AlertDialogBuilder(args: map);

  @override
  AlertDialogBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = AlertDialogBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  AlertDialog buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    return AlertDialog(
      actions: model.actions == null
          ? null
          : [
              for (var d in model.actions!)
                d.build(childBuilder: childBuilder, context: context),
            ],
      actionsAlignment: model.actionsAlignment,
      actionsOverflowAlignment: model.actionsOverflowAlignment,
      actionsOverflowButtonSpacing: model.actionsOverflowButtonSpacing,
      actionsOverflowDirection: model.actionsOverflowDirection,
      actionsPadding: model.actionsPadding,
      alignment: model.alignment,
      backgroundColor: model.backgroundColor,
      buttonPadding: model.buttonPadding,
      clipBehavior: model.clipBehavior,
      constraints: model.constraints,
      content: model.content?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      contentPadding: model.contentPadding,
      contentTextStyle: model.contentTextStyle,
      elevation: model.elevation,
      icon: model.icon?.build(childBuilder: childBuilder, context: context),
      iconColor: model.iconColor,
      iconPadding: model.iconPadding,
      insetPadding: model.insetPadding,
      key: key,
      scrollable: model.scrollable,
      semanticLabel: model.semanticLabel,
      shadowColor: model.shadowColor,
      shape: model.shape,
      surfaceTintColor: model.surfaceTintColor,
      title: model.title?.build(childBuilder: childBuilder, context: context),
      titlePadding: model.titlePadding,
      titleTextStyle: model.titleTextStyle,
    );
  }
}

class JsonAlertDialog extends JsonWidgetData {
  JsonAlertDialog({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.actions,
    this.actionsAlignment,
    this.actionsOverflowAlignment,
    this.actionsOverflowButtonSpacing,
    this.actionsOverflowDirection,
    this.actionsPadding,
    this.alignment,
    this.backgroundColor,
    this.buttonPadding,
    this.clipBehavior,
    this.constraints,
    this.content,
    this.contentPadding,
    this.contentTextStyle,
    this.elevation,
    this.icon,
    this.iconColor,
    this.iconPadding,
    this.insetPadding,
    this.scrollable = false,
    this.semanticLabel,
    this.shadowColor,
    this.shape,
    this.surfaceTintColor,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
  }) : super(
         jsonWidgetArgs: AlertDialogBuilderModel.fromDynamic(
           {
             'actions': actions,
             'actionsAlignment': actionsAlignment,
             'actionsOverflowAlignment': actionsOverflowAlignment,
             'actionsOverflowButtonSpacing': actionsOverflowButtonSpacing,
             'actionsOverflowDirection': actionsOverflowDirection,
             'actionsPadding': actionsPadding,
             'alignment': alignment,
             'backgroundColor': backgroundColor,
             'buttonPadding': buttonPadding,
             'clipBehavior': clipBehavior,
             'constraints': constraints,
             'content': content,
             'contentPadding': contentPadding,
             'contentTextStyle': contentTextStyle,
             'elevation': elevation,
             'icon': icon,
             'iconColor': iconColor,
             'iconPadding': iconPadding,
             'insetPadding': insetPadding,
             'scrollable': scrollable,
             'semanticLabel': semanticLabel,
             'shadowColor': shadowColor,
             'shape': shape,
             'surfaceTintColor': surfaceTintColor,
             'title': title,
             'titlePadding': titlePadding,
             'titleTextStyle': titleTextStyle,

             ...args,
           },
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => AlertDialogBuilder(
           args: AlertDialogBuilderModel.fromDynamic(
             {
               'actions': actions,
               'actionsAlignment': actionsAlignment,
               'actionsOverflowAlignment': actionsOverflowAlignment,
               'actionsOverflowButtonSpacing': actionsOverflowButtonSpacing,
               'actionsOverflowDirection': actionsOverflowDirection,
               'actionsPadding': actionsPadding,
               'alignment': alignment,
               'backgroundColor': backgroundColor,
               'buttonPadding': buttonPadding,
               'clipBehavior': clipBehavior,
               'constraints': constraints,
               'content': content,
               'contentPadding': contentPadding,
               'contentTextStyle': contentTextStyle,
               'elevation': elevation,
               'icon': icon,
               'iconColor': iconColor,
               'iconPadding': iconPadding,
               'insetPadding': insetPadding,
               'scrollable': scrollable,
               'semanticLabel': semanticLabel,
               'shadowColor': shadowColor,
               'shape': shape,
               'surfaceTintColor': surfaceTintColor,
               'title': title,
               'titlePadding': titlePadding,
               'titleTextStyle': titleTextStyle,

               ...args,
             },
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: AlertDialogBuilder.kType,
       );

  /* AUTOGENERATED FROM [AlertDialog.actions]*/
  /// The (optional) set of actions that are displayed at the bottom of the
  /// dialog with an [OverflowBar].
  ///
  /// Typically this is a list of [TextButton] widgets. It is recommended to
  /// set the [Text.textAlign] to [TextAlign.end] for the [Text] within the
  /// [TextButton], so that buttons whose labels wrap to an extra line align
  /// with the overall [OverflowBar]'s alignment within the dialog.
  ///
  /// If the [title] is not null but the [content] _is_ null, then an extra 20
  /// pixels of padding is added above the [OverflowBar] to separate the [title]
  /// from the [actions].
  final List<JsonWidgetData>? actions;

  /* AUTOGENERATED FROM [AlertDialog.actionsAlignment]*/
  /// Defines the horizontal layout of the [actions] according to the same
  /// rules as for [Row.mainAxisAlignment].
  ///
  /// This parameter is passed along to the dialog's [OverflowBar].
  ///
  /// If this parameter is null (the default) then [MainAxisAlignment.end]
  /// is used.
  final MainAxisAlignment? actionsAlignment;

  /* AUTOGENERATED FROM [AlertDialog.actionsOverflowAlignment]*/
  /// The horizontal alignment of [actions] within the vertical
  /// "overflow" layout.
  ///
  /// If the dialog's [actions] do not fit into a single row, then they
  /// are arranged in a column. This parameter controls the horizontal
  /// alignment of widgets in the case of an overflow.
  ///
  /// If this parameter is null (the default) then [OverflowBarAlignment.end]
  /// is used.
  ///
  /// See also:
  ///
  /// * [OverflowBar], which [actions] configures to lay itself out.
  final OverflowBarAlignment? actionsOverflowAlignment;

  /* AUTOGENERATED FROM [AlertDialog.actionsOverflowButtonSpacing]*/
  /// The spacing between [actions] when the [OverflowBar] switches to a column
  /// layout because the actions don't fit horizontally.
  ///
  /// If the widgets in [actions] do not fit into a single row, they are
  /// arranged into a column. This parameter provides additional vertical space
  /// between buttons when it does overflow.
  ///
  /// The button spacing may appear to be more than the value provided. This is
  /// because most buttons adhere to the [MaterialTapTargetSize] of 48px. So,
  /// even though a button might visually be 36px in height, it might still take
  /// up to 48px vertically.
  ///
  /// If null then no spacing will be added in between buttons in an overflow
  /// state.
  final double? actionsOverflowButtonSpacing;

  /* AUTOGENERATED FROM [AlertDialog.actionsOverflowDirection]*/
  /// The vertical direction of [actions] if the children overflow
  /// horizontally.
  ///
  /// If the dialog's [actions] do not fit into a single row, then they
  /// are arranged in a column. The first action is at the top of the
  /// column if this property is set to [VerticalDirection.down], since it
  /// "starts" at the top and "ends" at the bottom. On the other hand,
  /// the first action will be at the bottom of the column if this
  /// property is set to [VerticalDirection.up], since it "starts" at the
  /// bottom and "ends" at the top.
  ///
  /// See also:
  ///
  /// * [OverflowBar], which [actions] configures to lay itself out.
  final VerticalDirection? actionsOverflowDirection;

  /* AUTOGENERATED FROM [AlertDialog.actionsPadding]*/
  /// Padding around the set of [actions] at the bottom of the dialog.
  ///
  /// Typically used to provide padding to the button bar between the button bar
  /// and the edges of the dialog.
  ///
  /// The [buttonPadding] may contribute to the padding on the edges of
  /// [actions] as well.
  ///
  /// If there are no [actions], then no padding will be included.
  ///
  /// {@tool snippet}
  /// This is an example of a set of actions aligned with the content widget.
  /// ```dart
  /// AlertDialog(
  ///   title: const Text('Title'),
  ///   content: Container(width: 200, height: 200, color: Colors.green),
  ///   actions: <Widget>[
  ///     ElevatedButton(onPressed: () {}, child: const Text('Button 1')),
  ///     ElevatedButton(onPressed: () {}, child: const Text('Button 2')),
  ///   ],
  ///   actionsPadding: const EdgeInsets.symmetric(horizontal: 8.0),
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// See also:
  ///
  /// * [OverflowBar], which [actions] configures to lay itself out.
  final EdgeInsetsGeometry? actionsPadding;

  /* AUTOGENERATED FROM [AlertDialog.alignment]*/
  /// {@macro flutter.material.dialog.alignment}
  final AlignmentGeometry? alignment;

  /* AUTOGENERATED FROM [AlertDialog.backgroundColor]*/
  /// {@macro flutter.material.dialog.backgroundColor}
  final Color? backgroundColor;

  /* AUTOGENERATED FROM [AlertDialog.buttonPadding]*/
  /// The padding that surrounds each button in [actions].
  ///
  /// This is different from [actionsPadding], which defines the padding
  /// between the entire button bar and the edges of the dialog.
  ///
  /// If this property is null, then it will default to
  /// 8.0 logical pixels on the left and right.
  final EdgeInsetsGeometry? buttonPadding;

  /* AUTOGENERATED FROM [AlertDialog.clipBehavior]*/
  /// {@macro flutter.material.dialog.clipBehavior}
  final Clip? clipBehavior;

  /* AUTOGENERATED FROM [AlertDialog.constraints]*/
  /// {@macro flutter.material.dialog.constraints}
  final BoxConstraints? constraints;

  /* AUTOGENERATED FROM [AlertDialog.content]*/
  /// The (optional) content of the dialog is displayed in the center of the
  /// dialog in a lighter font.
  ///
  /// Typically this is a [SingleChildScrollView] that contains the dialog's
  /// message. As noted in the [AlertDialog] documentation, it's important
  /// to use a [SingleChildScrollView] if there's any risk that the content
  /// will not fit, as the contents will otherwise overflow the dialog.
  ///
  /// The [content] must support reporting its intrinsic dimensions. In
  /// particular, [ListView], [GridView], and [CustomScrollView] cannot be used
  /// here unless they are first wrapped in a widget that itself can report
  /// intrinsic dimensions, such as a [SizedBox].
  final JsonWidgetData? content;

  /* AUTOGENERATED FROM [AlertDialog.contentPadding]*/
  /// Padding around the content.
  ///
  /// If there is no [content], no padding will be provided. Otherwise, this
  /// padding is used.
  ///
  /// This property defaults to providing a padding of 20 pixels above the
  /// [content] to separate the [content] from the [title], and 24 pixels on the
  /// left, right, and bottom to separate the [content] from the other edges of
  /// the dialog.
  ///
  /// If [ThemeData.useMaterial3] is true, the top padding separating the
  /// content from the title defaults to 16 pixels instead of 20 pixels.
  final EdgeInsetsGeometry? contentPadding;

  /* AUTOGENERATED FROM [AlertDialog.contentTextStyle]*/
  /// Style for the text in the [content] of this [AlertDialog].
  ///
  /// If null, [DialogThemeData.contentTextStyle] is used. If that's null, defaults
  /// to [TextTheme.bodyMedium] of [ThemeData.textTheme] if
  /// [ThemeData.useMaterial3] is true, [TextTheme.titleMedium] otherwise.
  final TextStyle? contentTextStyle;

  /* AUTOGENERATED FROM [AlertDialog.elevation]*/
  /// {@macro flutter.material.dialog.elevation}
  final double? elevation;

  /* AUTOGENERATED FROM [AlertDialog.icon]*/
  /// An optional icon to display at the top of the dialog.
  ///
  /// Typically, an [Icon] widget. Providing an icon centers the [title]'s text.
  final JsonWidgetData? icon;

  /* AUTOGENERATED FROM [AlertDialog.iconColor]*/
  /// Color for the [Icon] in the [icon] of this [AlertDialog].
  ///
  /// If null, [DialogThemeData.iconColor] is used. If that is null, defaults to
  /// color scheme's [ColorScheme.secondary] if [ThemeData.useMaterial3] is
  /// true, black otherwise.
  final Color? iconColor;

  /* AUTOGENERATED FROM [AlertDialog.iconPadding]*/
  /// Padding around the [icon].
  ///
  /// If there is no [icon], no padding will be provided. Otherwise, this
  /// padding is used.
  ///
  /// This property defaults to providing 24 pixels on the top, left, and right
  /// of the [icon]. If [title] is _not_ null, 16 pixels of bottom padding is
  /// added to separate the [icon] from the [title]. If the [title] is null and
  /// [content] is _not_ null, then no bottom padding is provided (but see
  /// [contentPadding]). In any other case 24 pixels of bottom padding is
  /// added.
  final EdgeInsetsGeometry? iconPadding;

  /* AUTOGENERATED FROM [AlertDialog.insetPadding]*/
  /// {@macro flutter.material.dialog.insetPadding}
  final EdgeInsets? insetPadding;

  /* AUTOGENERATED FROM [AlertDialog.scrollable]*/
  /// Determines whether the [title] and [content] widgets are wrapped in a
  /// scrollable.
  ///
  /// This configuration is used when the [title] and [content] are expected
  /// to overflow. Both [title] and [content] are wrapped in a scroll view,
  /// allowing all overflowed content to be visible while still showing the
  /// button bar.
  final bool scrollable;

  /* AUTOGENERATED FROM [AlertDialog.semanticLabel]*/
  /// The semantic label of the dialog used by accessibility frameworks to
  /// announce screen transitions when the dialog is opened and closed.
  ///
  /// In iOS, if this label is not provided, a semantic label will be inferred
  /// from the [title] if it is not null.
  ///
  /// In Android, if this label is not provided, the dialog will use the
  /// [MaterialLocalizations.alertDialogLabel] as its label.
  ///
  /// See also:
  ///
  ///  * [SemanticsConfiguration.namesRoute], for a description of how this
  ///    value is used.
  final String? semanticLabel;

  /* AUTOGENERATED FROM [AlertDialog.shadowColor]*/
  /// {@macro flutter.material.dialog.shadowColor}
  final Color? shadowColor;

  /* AUTOGENERATED FROM [AlertDialog.shape]*/
  /// {@macro flutter.material.dialog.shape}
  final ShapeBorder? shape;

  /* AUTOGENERATED FROM [AlertDialog.surfaceTintColor]*/
  /// {@macro flutter.material.dialog.surfaceTintColor}
  final Color? surfaceTintColor;

  /* AUTOGENERATED FROM [AlertDialog.title]*/
  /// The (optional) title of the dialog is displayed in a large font at the top
  /// of the dialog, below the (optional) [icon].
  ///
  /// Typically a [Text] widget.
  final JsonWidgetData? title;

  /* AUTOGENERATED FROM [AlertDialog.titlePadding]*/
  /// Padding around the title.
  ///
  /// If there is no title, no padding will be provided. Otherwise, this padding
  /// is used.
  ///
  /// This property defaults to providing 24 pixels on the top, left, and right
  /// of the title. If the [content] is not null, then no bottom padding is
  /// provided (but see [contentPadding]). If it _is_ null, then an extra 20
  /// pixels of bottom padding is added to separate the [title] from the
  /// [actions].
  final EdgeInsetsGeometry? titlePadding;

  /* AUTOGENERATED FROM [AlertDialog.titleTextStyle]*/
  /// Style for the text in the [title] of this [AlertDialog].
  ///
  /// If null, [DialogThemeData.titleTextStyle] is used. If that's null, defaults to
  /// [TextTheme.headlineSmall] of [ThemeData.textTheme] if
  /// [ThemeData.useMaterial3] is true, [TextTheme.titleLarge] otherwise.
  final TextStyle? titleTextStyle;
}

/* AUTOGENERATED FROM [AlertDialog]*/
/// Creates an alert dialog.
///
/// Typically used in conjunction with [showDialog].
///
/// The [titlePadding] and [contentPadding] default to null, which implies a
/// default that depends on the values of the other properties. See the
/// documentation of [titlePadding] and [contentPadding] for details.
class AlertDialogBuilderModel extends JsonWidgetBuilderModel {
  const AlertDialogBuilderModel(
    super.args, {
    this.actions,
    this.actionsAlignment,
    this.actionsOverflowAlignment,
    this.actionsOverflowButtonSpacing,
    this.actionsOverflowDirection,
    this.actionsPadding,
    this.alignment,
    this.backgroundColor,
    this.buttonPadding,
    this.clipBehavior,
    this.constraints,
    this.content,
    this.contentPadding,
    this.contentTextStyle,
    this.elevation,
    this.icon,
    this.iconColor,
    this.iconPadding,
    this.insetPadding,
    this.scrollable = false,
    this.semanticLabel,
    this.shadowColor,
    this.shape,
    this.surfaceTintColor,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
  });

  /* AUTOGENERATED FROM [AlertDialog.actions]*/
  /// The (optional) set of actions that are displayed at the bottom of the
  /// dialog with an [OverflowBar].
  ///
  /// Typically this is a list of [TextButton] widgets. It is recommended to
  /// set the [Text.textAlign] to [TextAlign.end] for the [Text] within the
  /// [TextButton], so that buttons whose labels wrap to an extra line align
  /// with the overall [OverflowBar]'s alignment within the dialog.
  ///
  /// If the [title] is not null but the [content] _is_ null, then an extra 20
  /// pixels of padding is added above the [OverflowBar] to separate the [title]
  /// from the [actions].
  final List<JsonWidgetData>? actions;

  /* AUTOGENERATED FROM [AlertDialog.actionsAlignment]*/
  /// Defines the horizontal layout of the [actions] according to the same
  /// rules as for [Row.mainAxisAlignment].
  ///
  /// This parameter is passed along to the dialog's [OverflowBar].
  ///
  /// If this parameter is null (the default) then [MainAxisAlignment.end]
  /// is used.
  final MainAxisAlignment? actionsAlignment;

  /* AUTOGENERATED FROM [AlertDialog.actionsOverflowAlignment]*/
  /// The horizontal alignment of [actions] within the vertical
  /// "overflow" layout.
  ///
  /// If the dialog's [actions] do not fit into a single row, then they
  /// are arranged in a column. This parameter controls the horizontal
  /// alignment of widgets in the case of an overflow.
  ///
  /// If this parameter is null (the default) then [OverflowBarAlignment.end]
  /// is used.
  ///
  /// See also:
  ///
  /// * [OverflowBar], which [actions] configures to lay itself out.
  final OverflowBarAlignment? actionsOverflowAlignment;

  /* AUTOGENERATED FROM [AlertDialog.actionsOverflowButtonSpacing]*/
  /// The spacing between [actions] when the [OverflowBar] switches to a column
  /// layout because the actions don't fit horizontally.
  ///
  /// If the widgets in [actions] do not fit into a single row, they are
  /// arranged into a column. This parameter provides additional vertical space
  /// between buttons when it does overflow.
  ///
  /// The button spacing may appear to be more than the value provided. This is
  /// because most buttons adhere to the [MaterialTapTargetSize] of 48px. So,
  /// even though a button might visually be 36px in height, it might still take
  /// up to 48px vertically.
  ///
  /// If null then no spacing will be added in between buttons in an overflow
  /// state.
  final double? actionsOverflowButtonSpacing;

  /* AUTOGENERATED FROM [AlertDialog.actionsOverflowDirection]*/
  /// The vertical direction of [actions] if the children overflow
  /// horizontally.
  ///
  /// If the dialog's [actions] do not fit into a single row, then they
  /// are arranged in a column. The first action is at the top of the
  /// column if this property is set to [VerticalDirection.down], since it
  /// "starts" at the top and "ends" at the bottom. On the other hand,
  /// the first action will be at the bottom of the column if this
  /// property is set to [VerticalDirection.up], since it "starts" at the
  /// bottom and "ends" at the top.
  ///
  /// See also:
  ///
  /// * [OverflowBar], which [actions] configures to lay itself out.
  final VerticalDirection? actionsOverflowDirection;

  /* AUTOGENERATED FROM [AlertDialog.actionsPadding]*/
  /// Padding around the set of [actions] at the bottom of the dialog.
  ///
  /// Typically used to provide padding to the button bar between the button bar
  /// and the edges of the dialog.
  ///
  /// The [buttonPadding] may contribute to the padding on the edges of
  /// [actions] as well.
  ///
  /// If there are no [actions], then no padding will be included.
  ///
  /// {@tool snippet}
  /// This is an example of a set of actions aligned with the content widget.
  /// ```dart
  /// AlertDialog(
  ///   title: const Text('Title'),
  ///   content: Container(width: 200, height: 200, color: Colors.green),
  ///   actions: <Widget>[
  ///     ElevatedButton(onPressed: () {}, child: const Text('Button 1')),
  ///     ElevatedButton(onPressed: () {}, child: const Text('Button 2')),
  ///   ],
  ///   actionsPadding: const EdgeInsets.symmetric(horizontal: 8.0),
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// See also:
  ///
  /// * [OverflowBar], which [actions] configures to lay itself out.
  final EdgeInsetsGeometry? actionsPadding;

  /* AUTOGENERATED FROM [AlertDialog.alignment]*/
  /// {@macro flutter.material.dialog.alignment}
  final AlignmentGeometry? alignment;

  /* AUTOGENERATED FROM [AlertDialog.backgroundColor]*/
  /// {@macro flutter.material.dialog.backgroundColor}
  final Color? backgroundColor;

  /* AUTOGENERATED FROM [AlertDialog.buttonPadding]*/
  /// The padding that surrounds each button in [actions].
  ///
  /// This is different from [actionsPadding], which defines the padding
  /// between the entire button bar and the edges of the dialog.
  ///
  /// If this property is null, then it will default to
  /// 8.0 logical pixels on the left and right.
  final EdgeInsetsGeometry? buttonPadding;

  /* AUTOGENERATED FROM [AlertDialog.clipBehavior]*/
  /// {@macro flutter.material.dialog.clipBehavior}
  final Clip? clipBehavior;

  /* AUTOGENERATED FROM [AlertDialog.constraints]*/
  /// {@macro flutter.material.dialog.constraints}
  final BoxConstraints? constraints;

  /* AUTOGENERATED FROM [AlertDialog.content]*/
  /// The (optional) content of the dialog is displayed in the center of the
  /// dialog in a lighter font.
  ///
  /// Typically this is a [SingleChildScrollView] that contains the dialog's
  /// message. As noted in the [AlertDialog] documentation, it's important
  /// to use a [SingleChildScrollView] if there's any risk that the content
  /// will not fit, as the contents will otherwise overflow the dialog.
  ///
  /// The [content] must support reporting its intrinsic dimensions. In
  /// particular, [ListView], [GridView], and [CustomScrollView] cannot be used
  /// here unless they are first wrapped in a widget that itself can report
  /// intrinsic dimensions, such as a [SizedBox].
  final JsonWidgetData? content;

  /* AUTOGENERATED FROM [AlertDialog.contentPadding]*/
  /// Padding around the content.
  ///
  /// If there is no [content], no padding will be provided. Otherwise, this
  /// padding is used.
  ///
  /// This property defaults to providing a padding of 20 pixels above the
  /// [content] to separate the [content] from the [title], and 24 pixels on the
  /// left, right, and bottom to separate the [content] from the other edges of
  /// the dialog.
  ///
  /// If [ThemeData.useMaterial3] is true, the top padding separating the
  /// content from the title defaults to 16 pixels instead of 20 pixels.
  final EdgeInsetsGeometry? contentPadding;

  /* AUTOGENERATED FROM [AlertDialog.contentTextStyle]*/
  /// Style for the text in the [content] of this [AlertDialog].
  ///
  /// If null, [DialogThemeData.contentTextStyle] is used. If that's null, defaults
  /// to [TextTheme.bodyMedium] of [ThemeData.textTheme] if
  /// [ThemeData.useMaterial3] is true, [TextTheme.titleMedium] otherwise.
  final TextStyle? contentTextStyle;

  /* AUTOGENERATED FROM [AlertDialog.elevation]*/
  /// {@macro flutter.material.dialog.elevation}
  final double? elevation;

  /* AUTOGENERATED FROM [AlertDialog.icon]*/
  /// An optional icon to display at the top of the dialog.
  ///
  /// Typically, an [Icon] widget. Providing an icon centers the [title]'s text.
  final JsonWidgetData? icon;

  /* AUTOGENERATED FROM [AlertDialog.iconColor]*/
  /// Color for the [Icon] in the [icon] of this [AlertDialog].
  ///
  /// If null, [DialogThemeData.iconColor] is used. If that is null, defaults to
  /// color scheme's [ColorScheme.secondary] if [ThemeData.useMaterial3] is
  /// true, black otherwise.
  final Color? iconColor;

  /* AUTOGENERATED FROM [AlertDialog.iconPadding]*/
  /// Padding around the [icon].
  ///
  /// If there is no [icon], no padding will be provided. Otherwise, this
  /// padding is used.
  ///
  /// This property defaults to providing 24 pixels on the top, left, and right
  /// of the [icon]. If [title] is _not_ null, 16 pixels of bottom padding is
  /// added to separate the [icon] from the [title]. If the [title] is null and
  /// [content] is _not_ null, then no bottom padding is provided (but see
  /// [contentPadding]). In any other case 24 pixels of bottom padding is
  /// added.
  final EdgeInsetsGeometry? iconPadding;

  /* AUTOGENERATED FROM [AlertDialog.insetPadding]*/
  /// {@macro flutter.material.dialog.insetPadding}
  final EdgeInsets? insetPadding;

  /* AUTOGENERATED FROM [AlertDialog.scrollable]*/
  /// Determines whether the [title] and [content] widgets are wrapped in a
  /// scrollable.
  ///
  /// This configuration is used when the [title] and [content] are expected
  /// to overflow. Both [title] and [content] are wrapped in a scroll view,
  /// allowing all overflowed content to be visible while still showing the
  /// button bar.
  final bool scrollable;

  /* AUTOGENERATED FROM [AlertDialog.semanticLabel]*/
  /// The semantic label of the dialog used by accessibility frameworks to
  /// announce screen transitions when the dialog is opened and closed.
  ///
  /// In iOS, if this label is not provided, a semantic label will be inferred
  /// from the [title] if it is not null.
  ///
  /// In Android, if this label is not provided, the dialog will use the
  /// [MaterialLocalizations.alertDialogLabel] as its label.
  ///
  /// See also:
  ///
  ///  * [SemanticsConfiguration.namesRoute], for a description of how this
  ///    value is used.
  final String? semanticLabel;

  /* AUTOGENERATED FROM [AlertDialog.shadowColor]*/
  /// {@macro flutter.material.dialog.shadowColor}
  final Color? shadowColor;

  /* AUTOGENERATED FROM [AlertDialog.shape]*/
  /// {@macro flutter.material.dialog.shape}
  final ShapeBorder? shape;

  /* AUTOGENERATED FROM [AlertDialog.surfaceTintColor]*/
  /// {@macro flutter.material.dialog.surfaceTintColor}
  final Color? surfaceTintColor;

  /* AUTOGENERATED FROM [AlertDialog.title]*/
  /// The (optional) title of the dialog is displayed in a large font at the top
  /// of the dialog, below the (optional) [icon].
  ///
  /// Typically a [Text] widget.
  final JsonWidgetData? title;

  /* AUTOGENERATED FROM [AlertDialog.titlePadding]*/
  /// Padding around the title.
  ///
  /// If there is no title, no padding will be provided. Otherwise, this padding
  /// is used.
  ///
  /// This property defaults to providing 24 pixels on the top, left, and right
  /// of the title. If the [content] is not null, then no bottom padding is
  /// provided (but see [contentPadding]). If it _is_ null, then an extra 20
  /// pixels of bottom padding is added to separate the [title] from the
  /// [actions].
  final EdgeInsetsGeometry? titlePadding;

  /* AUTOGENERATED FROM [AlertDialog.titleTextStyle]*/
  /// Style for the text in the [title] of this [AlertDialog].
  ///
  /// If null, [DialogThemeData.titleTextStyle] is used. If that's null, defaults to
  /// [TextTheme.headlineSmall] of [ThemeData.textTheme] if
  /// [ThemeData.useMaterial3] is true, [TextTheme.titleLarge] otherwise.
  final TextStyle? titleTextStyle;

  static AlertDialogBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[AlertDialogBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static AlertDialogBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    AlertDialogBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is AlertDialogBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = AlertDialogBuilderModel(
          args,
          actions: () {
            dynamic parsed = JsonWidgetData.maybeFromDynamicList(
              map['actions'],
              registry: registry,
            );

            return parsed;
          }(),
          actionsAlignment: () {
            dynamic parsed = ThemeDecoder.decodeMainAxisAlignment(
              map['actionsAlignment'],
              validate: false,
            );

            return parsed;
          }(),
          actionsOverflowAlignment: map['actionsOverflowAlignment'],
          actionsOverflowButtonSpacing: () {
            dynamic parsed = JsonClass.maybeParseDouble(
              map['actionsOverflowButtonSpacing'],
            );

            return parsed;
          }(),
          actionsOverflowDirection: () {
            dynamic parsed = ThemeDecoder.decodeVerticalDirection(
              map['actionsOverflowDirection'],
              validate: false,
            );

            return parsed;
          }(),
          actionsPadding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsGeometry(
              map['actionsPadding'],
              validate: false,
            );

            return parsed;
          }(),
          alignment: () {
            dynamic parsed = ThemeDecoder.decodeAlignmentGeometry(
              map['alignment'],
              validate: false,
            );

            return parsed;
          }(),
          backgroundColor: () {
            dynamic parsed = ThemeDecoder.decodeColor(
              map['backgroundColor'],
              validate: false,
            );

            return parsed;
          }(),
          buttonPadding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsGeometry(
              map['buttonPadding'],
              validate: false,
            );

            return parsed;
          }(),
          clipBehavior: () {
            dynamic parsed = ThemeDecoder.decodeClip(
              map['clipBehavior'],
              validate: false,
            );

            return parsed;
          }(),
          constraints: () {
            dynamic parsed = ThemeDecoder.decodeBoxConstraints(
              map['constraints'],
              validate: false,
            );

            return parsed;
          }(),
          content: () {
            dynamic parsed = JsonWidgetData.maybeFromDynamic(
              map['content'],
              registry: registry,
            );

            return parsed;
          }(),
          contentPadding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsGeometry(
              map['contentPadding'],
              validate: false,
            );

            return parsed;
          }(),
          contentTextStyle: () {
            dynamic parsed = ThemeDecoder.decodeTextStyle(
              map['contentTextStyle'],
              validate: false,
            );

            return parsed;
          }(),
          elevation: () {
            dynamic parsed = JsonClass.maybeParseDouble(map['elevation']);

            return parsed;
          }(),
          icon: () {
            dynamic parsed = JsonWidgetData.maybeFromDynamic(
              map['icon'],
              registry: registry,
            );

            return parsed;
          }(),
          iconColor: () {
            dynamic parsed = ThemeDecoder.decodeColor(
              map['iconColor'],
              validate: false,
            );

            return parsed;
          }(),
          iconPadding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsGeometry(
              map['iconPadding'],
              validate: false,
            );

            return parsed;
          }(),
          insetPadding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsets(
              map['insetPadding'],
              validate: false,
            );

            return parsed;
          }(),
          scrollable: JsonClass.parseBool(map['scrollable'], whenNull: false),
          semanticLabel: map['semanticLabel'],
          shadowColor: () {
            dynamic parsed = ThemeDecoder.decodeColor(
              map['shadowColor'],
              validate: false,
            );

            return parsed;
          }(),
          shape: () {
            dynamic parsed = ThemeDecoder.decodeShapeBorder(
              map['shape'],
              validate: false,
            );

            return parsed;
          }(),
          surfaceTintColor: () {
            dynamic parsed = ThemeDecoder.decodeColor(
              map['surfaceTintColor'],
              validate: false,
            );

            return parsed;
          }(),
          title: () {
            dynamic parsed = JsonWidgetData.maybeFromDynamic(
              map['title'],
              registry: registry,
            );

            return parsed;
          }(),
          titlePadding: () {
            dynamic parsed = ThemeDecoder.decodeEdgeInsetsGeometry(
              map['titlePadding'],
              validate: false,
            );

            return parsed;
          }(),
          titleTextStyle: () {
            dynamic parsed = ThemeDecoder.decodeTextStyle(
              map['titleTextStyle'],
              validate: false,
            );

            return parsed;
          }(),
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'actions': JsonClass.maybeToJsonList(actions),
      'actionsAlignment': ThemeEncoder.encodeMainAxisAlignment(
        actionsAlignment,
      ),
      'actionsOverflowAlignment': actionsOverflowAlignment,
      'actionsOverflowButtonSpacing': actionsOverflowButtonSpacing,
      'actionsOverflowDirection': ThemeEncoder.encodeVerticalDirection(
        actionsOverflowDirection,
      ),
      'actionsPadding': ThemeEncoder.encodeEdgeInsetsGeometry(actionsPadding),
      'alignment': ThemeEncoder.encodeAlignmentGeometry(alignment),
      'backgroundColor': ThemeEncoder.encodeColor(backgroundColor),
      'buttonPadding': ThemeEncoder.encodeEdgeInsetsGeometry(buttonPadding),
      'clipBehavior': ThemeEncoder.encodeClip(clipBehavior),
      'constraints': ThemeEncoder.encodeBoxConstraints(constraints),
      'content': content?.toJson(),
      'contentPadding': ThemeEncoder.encodeEdgeInsetsGeometry(contentPadding),
      'contentTextStyle': ThemeEncoder.encodeTextStyle(contentTextStyle),
      'elevation': elevation,
      'icon': icon?.toJson(),
      'iconColor': ThemeEncoder.encodeColor(iconColor),
      'iconPadding': ThemeEncoder.encodeEdgeInsetsGeometry(iconPadding),
      'insetPadding': ThemeEncoder.encodeEdgeInsets(insetPadding),
      'scrollable': false == scrollable ? null : scrollable,
      'semanticLabel': semanticLabel,
      'shadowColor': ThemeEncoder.encodeColor(shadowColor),
      'shape': ThemeEncoder.encodeShapeBorder(shape),
      'surfaceTintColor': ThemeEncoder.encodeColor(surfaceTintColor),
      'title': title?.toJson(),
      'titlePadding': ThemeEncoder.encodeEdgeInsetsGeometry(titlePadding),
      'titleTextStyle': ThemeEncoder.encodeTextStyle(titleTextStyle),

      ...args,
    });
  }
}

class AlertDialogSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/alert_dialog.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'AlertDialog',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'actions': SchemaHelper.arraySchema(JsonWidgetDataSchema.id),
      'actionsAlignment': SchemaHelper.objectSchema(MainAxisAlignmentSchema.id),
      'actionsOverflowAlignment': SchemaHelper.anySchema,
      'actionsOverflowButtonSpacing': SchemaHelper.numberSchema,
      'actionsOverflowDirection': SchemaHelper.objectSchema(
        VerticalDirectionSchema.id,
      ),
      'actionsPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'alignment': SchemaHelper.objectSchema(AlignmentGeometrySchema.id),
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'buttonPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
      'constraints': SchemaHelper.objectSchema(BoxConstraintsSchema.id),
      'content': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'contentPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'contentTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'icon': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'iconColor': SchemaHelper.objectSchema(ColorSchema.id),
      'iconPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'insetPadding': SchemaHelper.objectSchema(EdgeInsetsSchema.id),
      'scrollable': SchemaHelper.boolSchema,
      'semanticLabel': SchemaHelper.stringSchema,
      'shadowColor': SchemaHelper.objectSchema(ColorSchema.id),
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'surfaceTintColor': SchemaHelper.objectSchema(ColorSchema.id),
      'title': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'titlePadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'titleTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
    },
    'required': [],
  };
}
