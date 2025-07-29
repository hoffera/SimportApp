// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:json_app/app/enum/enum.dart';
import 'package:json_app/config/api_constants.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class JsonScreenPage extends StatefulWidget {
  const JsonScreenPage({
    super.key,
    required this.pageID,
    required this.placeholder,
  });

  final int pageID;
  final JsonWidgetData placeholder;

  @override
  State<JsonScreenPage> createState() => _JsonScreenPageState();
}

class _JsonScreenPageState extends State<JsonScreenPage> {
  late JsonWidgetRegistry registry;
  JsonWidgetData? widgetData;
  final _advancedDrawerController = AdvancedDrawerController();
  final ValueNotifier<bool> _drawerNotifier = ValueNotifier(false);
  bool drawer = false;

  String _idiomaAtual = 'Português';
  bool _lights = false;

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

  @override
  void dispose() {
    _drawerNotifier.dispose();
    super.dispose();
  }

  Future<Map<String, dynamic>> loadDynamicScreen() async {
    final url = Uri.parse(ApiConstants.getView(widget.pageID.toString()));

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return data['json'] as Map<String, dynamic>;
    } else {
      throw Exception('Erro ao carregar: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final content =
        widgetData?.build(context: context) ??
        widget.placeholder.build(context: context);

    return ValueListenableBuilder<bool>(
      valueListenable: _drawerNotifier,
      builder: (context, isEnd, _) {
        return AdvancedDrawer(
          drawer: SafeArea(
            child: ValueListenableBuilder<bool>(
              valueListenable: _drawerNotifier,
              builder: (context, isEnd, _) {
                return isEnd ? _endDrawer() : _startDrawer();
              },
            ),
          ),

          backdrop: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(color: AppColors.primary),
          ),
          controller: _advancedDrawerController,
          animationCurve: Curves.easeInOut,

          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: isEnd,

          disabledGestures: true,
          childDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,

              leading: Builder(
                builder: (context) {
                  return IconButton(
                    onPressed: () {
                      _drawerNotifier.value = false;

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _advancedDrawerController.showDrawer();
                      });
                    },
                    icon: ValueListenableBuilder<AdvancedDrawerValue>(
                      valueListenable: _advancedDrawerController,
                      builder: (_, value, _) {
                        return AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: Semantics(
                            label: 'Menu',
                            onTapHint: 'expand drawer',
                            child: Icon(
                              value.visible ? Icons.clear : Icons.settings,
                              color: Theme.of(context).colorScheme.primary,
                              key: ValueKey<bool>(value.visible),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    _drawerNotifier.value =
                        true; // ou false, dependendo do lado

                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _advancedDrawerController
                          .showDrawer(); // Agora a animação roda corretamente
                    });
                  },
                  icon: ValueListenableBuilder<AdvancedDrawerValue>(
                    valueListenable: _advancedDrawerController,
                    builder: (_, value, _) {
                      return AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: Semantics(
                          label: 'Menu',
                          onTapHint: 'expand drawer',
                          child: Icon(
                            value.visible ? Icons.clear : Icons.person,
                            color: Theme.of(context).colorScheme.primary,
                            key: ValueKey<bool>(value.visible),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            body: AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: KeyedSubtree(
                key: ValueKey(widgetData != null),
                child: RefreshIndicator(
                  onRefresh: () => loadDynamicScreen().then((json) {
                    setState(() {
                      widgetData = JsonWidgetData.fromDynamic(
                        json,
                        registry: registry,
                      );
                    });
                  }),
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(hasScrollBody: false, child: content),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _startDrawer() {
    return ListTileTheme(
      textColor: Colors.white,
      iconColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 128.0,
            height: 128.0,
            child: Image.asset('assets/images/icon_logo.png'),
          ),

          Theme(
            data: ThemeData.light(), // ou ThemeData.fallback()
            child: SwitchListTile(
              title: const Text(
                'Tema escuro',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              secondary: const Icon(Icons.brightness_6),
              value: _lights,
              onChanged: (bool value) {
                setState(() {
                  _lights = value;
                });

                // Future.delayed(const Duration(milliseconds: 1000), () {
                //   final newTheme = _lights ? 'dark' : 'light';
                //   Provider.of<ThemeController>(
                //     context,
                //     listen: false,
                //   ).changeTheme(newTheme);
                // });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text(
              'Idioma',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: PopupMenuButton<String>(
              initialValue: _idiomaAtual,
              onSelected: (value) {
                // Atualize o estado do idioma
                setState(() {
                  _idiomaAtual = value;
                });
                print('Idioma selecionado: $value');
              },
              itemBuilder: (context) => [
                PopupMenuItem(value: 'Português', child: Text('Português')),
                PopupMenuItem(value: 'Inglês', child: Text('Inglês')),
                PopupMenuItem(value: 'Espanhol', child: Text('Espanhol')),
              ],
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [Text(_idiomaAtual), Icon(Icons.arrow_drop_down)],
              ),
            ),
          ),

          ListTile(
            onTap: () {},
            leading: Icon(Icons.people),
            title: Text(
              'Clientes',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          Spacer(),

          DefaultTextStyle(
            style: TextStyle(fontSize: 12, color: Colors.white54),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text('Terms of Service | Privacy Policy'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _endDrawer() {
    return ListTileTheme(
      textColor: Colors.white,
      iconColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 128.0,
            height: 128.0,
            margin: const EdgeInsets.only(top: 24.0, bottom: 64.0),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.person),
          ),
          Text(
            'Felipe Hoffmeister', // Nome do usuário
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'ADIMINISTRADOR - APPIX', // Cargo
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          SizedBox(height: 4),
          Text(
            'felipe@email.com', // Email
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          SizedBox(height: 4),
          Text(
            'Usuário desde: Jan 1, 2016', // Data
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.center,
              child: ListTile(
                onTap: () {},
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text(
                  'Sair',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          Spacer(),
          DefaultTextStyle(
            style: TextStyle(fontSize: 12, color: Colors.white54),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text('Terms of Service | Privacy Policy'),
            ),
          ),
        ],
      ),
    );
  }
}
