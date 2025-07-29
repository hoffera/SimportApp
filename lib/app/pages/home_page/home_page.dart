import 'package:get/get.dart';
import 'package:json_app/app/client/client_model.dart';
import 'package:json_app/app/client/client_service.dart';
import 'package:json_app/app/enum/enum.dart';
import 'package:json_app/app/pages/dynamic_json_page/controllers/dynamic_json_page_controller.dart';
import 'package:json_app/app/pages/dynamic_json_page/views/dynamic_json_page_view.dart';
import 'package:json_app/components/cards/home_card.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:transformable_list_view/transformable_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Client> clients = [];
  late JsonWidgetRegistry registry;
  JsonWidgetData? widgetData;

  @override
  void initState() {
    super.initState();

    registry = JsonWidgetRegistry.instance;
    carregarClientes();
  }

  void carregarClientes() async {
    try {
      List<Client> fetchedClients = await ClientService.fetchClients();
      setState(() {
        clients = fetchedClients;
      });
    } catch (e) {
      print('Erro: $e');
    }
  }

  void _abrirCliente(Client client) {
    final view = client.views?.firstWhere(
      (v) => v.principal == true,
      orElse: () => throw Exception("Nenhuma view principal encontrada"),
    );

    final pageID = view?.id ?? 0;
    final data = view?.placeholder;

    if (data == null) {
      print("Placeholder não encontrado");
      return;
    }

    final placeholder = JsonWidgetData.fromDynamic(data, registry: registry);
    Get.put(DynamicJsonPageController(pageID));

    Get.to(DynamicJsonPageView(pageID: pageID, placeholder: placeholder));
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) =>
    //         JsonScreenPage(pageID: pageID, placeholder: placeholder),
    //   ),
    // );
  }

  Widget _homeCard(Client client) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: HomeCard(
        title: client.nome!,
        subtitle: client.identificacao!,
        logo: client.logo,
        onTap: () => _abrirCliente(client),
      ),
    );
  }

  Matrix4 getTransformMatrix(TransformableListItem item) {
    const endScaleBound = 0.3;
    final animationProgress = item.visibleExtent / item.size.height;
    final paintTransform = Matrix4.identity();

    if (item.position != TransformableListItemPosition.middle &&
        item.position != TransformableListItemPosition.topEdge) {
      final scale = endScaleBound + ((1 - endScaleBound) * animationProgress);
      paintTransform
        ..translate(item.size.width / 2)
        ..scale(scale)
        ..translate(-item.size.width / 2);
    }

    return paintTransform;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,

        title: Text(
          'Clientes disponíveis',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.primary,
            letterSpacing: 0.53,
          ),
        ),
      ),
      body: clients.isEmpty
          ? Center(child: CircularProgressIndicator())
          : TransformableListView.builder(
              itemCount: clients.length,
              itemBuilder: (context, index) {
                final client = clients[index];
                return _homeCard(client);
              },
              getTransformMatrix: getTransformMatrix,
            ),
    );
  }
}
