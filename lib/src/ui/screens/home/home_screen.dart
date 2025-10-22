import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:flutter_svg/svg.dart";
import "package:heroicons/heroicons.dart";
import "package:json_app/main.dart";
import "package:json_app/src/data/models/client/client.dart";
import "package:json_app/src/data/store/client_store.dart";
import "package:json_app/src/data/store/home_store.dart";
import "package:json_app/src/data/store/theme_store.dart";
import "package:json_app/src/ui/screens/home/drawer_home_screen.dart";
import "package:json_app/src/ui/widgets/cards/client_card.dart";
import "package:json_app/src/utils/enum/enum.dart";
import "package:skeletonizer/skeletonizer.dart";
import "package:wave/config.dart";
import "package:wave/wave.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeStore _homeStore = getIt<HomeStore>();
  final ClientStore clientStore = getIt<ClientStore>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ThemeStore themeStore = getIt<ThemeStore>();
  @override
  void initState() {
    super.initState();
    loadHome();
  }

  Future<void> loadHome() async {
    await _homeStore.loadHome();
  }

  Color lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final lightened = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );
    return lightened.toColor();
  }

  PreferredSize _appBar(BuildContext context) {
    double height = 220.0;
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Stack(
        children: [
          WaveWidget(
            config: CustomConfig(
              colors: [
                lighten(AppColors.primary, 0.1),
                lighten(AppColors.primary, 0.2),

                Theme.of(context).scaffoldBackgroundColor,
              ],
              durations: [18000, 8000, 12000],
              heightPercentages: [0.75, 0.76, 0.80],
            ),
            backgroundColor: AppColors.primary,
            size: Size(double.infinity, height),
            waveAmplitude: 5,
          ),
          Positioned(
            right: 15,
            top: 80,
            child: IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
              icon: HeroIcon(
                HeroIcons.cog6Tooth,
                color: AppColors.contentColorWhite,
              ),
            ),
          ),
          Center(
            child: SvgPicture.asset(
              "assets/images/simport_logo.svg",
              width: 250,
              colorFilter: const ColorFilter.mode(
                AppColors.contentColorWhite,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _build() {
    return RefreshIndicator(
      onRefresh: () async {
        await loadHome();
      },
      child: Observer(
        builder: (_) {
          switch (_homeStore.state) {
            case HomeStoreState.loading:
              return _loadingStateWidget();
            case HomeStoreState.success:
              return _sucessStateWidget();
            case HomeStoreState.error:
              return errorStateWidget();
            case HomeStoreState.empty:
              return emptyStateWidget();
          }
        },
      ),
    );
  }

  Widget _sucessStateWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: _listView(),
    );
  }

  Widget _loadingStateWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: _skeletonListView(),
    );
  }

  Widget _skeletonListView() {
    final fakeClients = List.generate(
      clientStore.clientList.isEmpty ? 1 : clientStore.clientList.length,
      (index) => ClientModel(
        clientId: index.toString(),
        name: "Cliente Exemplo ${index + 1}",
        hashVersion: "1234567890",
        logoUrl: "https://appix.cs.simport.com.br/file/7490/image",
        version: "1.0.0",

        views: [],
      ),
    );
    return Skeletonizer(
      child: GridView.builder(
        padding: const EdgeInsets.all(15.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 17.0,
          childAspectRatio: 4,
        ),
        itemCount: fakeClients.length,
        itemBuilder: (context, index) {
          return ClientCard(client: fakeClients[index], onPress: () {});
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Theme(
        data: themeStore.isDarkMode
            ? themeStore.simportThemeModel!.dark
            : themeStore.simportThemeModel!.light,
        child: Builder(
          builder: (context) {
            return Scaffold(
              key: _scaffoldKey,
              endDrawer: const DrawerHomeScreen(),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBar: _appBar(context),
              body: _build(),
            );
          },
        ),
      ),
    );
  }

  Widget _listView() {
    return Observer(
      builder: (_) {
        if (clientStore.clientList.isEmpty) {
          return const Center(child: Text("Nenhum cliente disponível"));
        }

        return GridView.builder(
          padding: const EdgeInsets.all(15.0),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 17.0,
            childAspectRatio: 4,
          ),
          itemCount: clientStore.clientList.length,
          itemBuilder: (context, index) {
            return ClientCard(
              client: clientStore.clientList[index],
              onPress: () async {
                await _homeStore.selectClient(
                  clientStore.clientList[index],
                  context,
                );
              },
            );
          },
        );
      },
    );
  }

  Widget emptyStateWidget() => Center(
    child: Theme(
      data: Theme.of(context).copyWith(
        colorScheme: Theme.of(
          context,
        ).colorScheme.copyWith(primary: AppColors.primary),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Nenhum cliente disponível"),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.refresh),
            label: const Text("Atualizar"),
            onPressed: () => _homeStore.loadHome(),
          ),
        ],
      ),
    ),
  );

  Widget errorStateWidget() => Center(child: Text("Erro ao carregar clientes"));
}
