import 'package:get/get.dart';

class HomeJsonController extends GetxController {
  final jsonPages = <Map<String, String>>[
    {'path': 'lib/assets/json_pages/test_page.json', 'label': 'Pagina 1'},
    {'path': 'lib/assets/json_pages/button_page.json', 'label': 'Pagina 2'},
  ];
}
