import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:json_app/simport_editor/features/conexoes/bloc/conexoes_page_cubit.dart";
import "package:json_app/simport_editor/features/conexoes/view/conexoes_page.dart";
import "package:json_app/simport_editor/features/curinga/view/coringa_page.dart";
import "package:json_app/simport_editor/features/editor_client_page/bloc/editor_client_bloc.dart";
import "package:json_app/simport_editor/features/telas/view/telas_page.dart";
import "package:json_app/simport_editor/widgets/tab/tab_vertical.dart";

class EditorClientPage extends StatefulWidget {
  final String clientId;
  const EditorClientPage({super.key, required this.clientId});

  @override
  State<EditorClientPage> createState() => _EditorClientPageState();
}

class _EditorClientPageState extends State<EditorClientPage> {
  final EditorClientBloc editorClientBloc = EditorClientBloc();

  @override
  void initState() {
    super.initState();
    editorClientBloc.onInit(widget.clientId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<EditorClientBloc, EditorClientPageStates>(
        bloc: editorClientBloc,
        builder: (context, state) {
          if (state is ConexoesPageLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is EditorClientPageSuccess) {
            return _sucessStateWidget(state);
          } else if (state is EditorClientPageError) {
            return Center(child: Text(state.error));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _sucessStateWidget(EditorClientPageSuccess state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _menu(context, state),
        Expanded(child: _tabPage(context)),
      ],
    );
  }

  Widget _menu(BuildContext context, EditorClientPageSuccess state) {
    return TabVertical(
      client: state.client,
      onConnectionTap: () {
        editorClientBloc.onTabChange(0);
      },
      onScreenTap: () {
        editorClientBloc.onTabChange(1);
      },
      onCuringaTap: () {
        editorClientBloc.onTabChange(2);
      },
      onClientTap: () {
        context.go("/editor-home");
      },
    );
  }

  List<Widget> _getChildren(BuildContext context) => <Widget>[
    ConexoesPage(clientId: widget.clientId),
    TelasPage(clientId: widget.clientId),
    CoringaPage(),
  ];

  Widget _tabPage(BuildContext context) {
    final children = _getChildren(context);
    return BlocBuilder<EditorClientBloc, EditorClientPageStates>(
      bloc: editorClientBloc,
      builder: (context, state) {
        if (state is EditorClientPageSuccess) {
          return Expanded(child: children[state.index]);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
