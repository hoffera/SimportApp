import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get_state_manager/src/simple/get_view.dart";
import "package:json_app/app/json%20dynamic%20widget/curved_navigation_builder.dart";
import "package:json_app/app/pages/nav_page/controllers/nav_page_controller.dart";

class NavPageView extends GetView<NavPageController> {
  const NavPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView Example")),
      body: CustomScrollView(
        slivers: [
          CupertinoSliverRefreshControl(
            onRefresh: () {
              return Future.delayed(const Duration(seconds: 2));
            },
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ListTile(title: Text("Item $index"));
            }, childCount: 100),
          ),
        ],
      ),

      bottomNavigationBar: CurvedNav(
        icons: [
          "https://appix.cs.simport.com.br/gallery/86/image-download",
          "https://appix.cs.simport.com.br/gallery/86/image-download",
        ],
      ),
    );
  }
}
