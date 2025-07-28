import 'dart:convert';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class JsonPage extends StatefulWidget {
  const JsonPage({super.key});

  @override
  State<JsonPage> createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  late JsonWidgetRegistry registry;
  JsonWidgetData? widgetData;

  @override
  void initState() {
    super.initState();

    registry = JsonWidgetRegistry.instance;

    loadDynamicScreen().then((json) {
      setState(() {
        widgetData = JsonWidgetData.fromDynamic(json, registry: registry);
      });
    });
  }

  Future<Map<String, dynamic>> loadDynamicScreen() async {
    final jsonString = await rootBundle.loadString(
      'assets/json_pages/nav_page.json',
    );
    final data = jsonDecode(jsonString);
    return data as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return widgetData?.build(context: context) ?? const SizedBox.shrink();
  }
}
