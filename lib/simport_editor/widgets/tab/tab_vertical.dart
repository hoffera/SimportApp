import "package:flutter_side_menu/flutter_side_menu.dart";
import "package:flutter_svg/svg.dart";
import "package:heroicons/heroicons.dart";
import "package:json_app/app/enum/enum.dart";
import "package:json_app/app/models/client/client_model.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:mix/mix.dart";

class TabVertical extends StatefulWidget {
  final Client client;
  final Function() onConnectionTap;
  final Function() onScreenTap;
  final Function() onClientTap;
  final Function() onCuringaTap;
  const TabVertical({
    super.key,
    required this.client,
    required this.onConnectionTap,
    required this.onScreenTap,
    required this.onClientTap,
    required this.onCuringaTap,
  });

  @override
  State<TabVertical> createState() => _TabVerticalState();
}

class _TabVerticalState extends State<TabVertical> {
  @override
  Widget build(BuildContext context) {
    return SideMenu(
      mode: SideMenuMode.open,
      maxWidth: 300,
      minWidth: 100,
      position: SideMenuPosition.left,
      backgroundColor: Colors.white,
      builder: (data) {
        return SideMenuData(
          defaultTileData: SideMenuItemTileDefaults(
            selectedDecoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(5),
            ),
            selectedTitleStyle: TextStyle(
              color: AppColors.contentColorWhite,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Comfortaa",
              overflow: TextOverflow.fade,
            ),

            titleStyle: TextStyle(
              color: AppColors.menuBackground,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Comfortaa",
              overflow: TextOverflow.fade,
            ),
          ),
          header: Container(
            padding: const EdgeInsets.only(
              top: 50,
              left: 8,
              right: 8,
              bottom: 50,
            ),
            child: Column(
              children: [
                if (data.isOpen) ...[
                  SvgPicture.asset(
                    "assets/images/simport_logo.svg",
                    width: 30,
                    height: 30,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ] else ...[
                  SvgPicture.asset(
                    "assets/images/icon_logo_white.svg",
                    width: 30,
                    height: 30,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ],
            ),
          ),

          items: [
            const SideMenuItemDataDivider(divider: Divider()),
            SideMenuItemDataTile(
              hasSelectedLine: true,
              itemHeight: 100,
              isSelected: false,
              onTap: () {},

              title: widget.client.nome,
              titleStyle: TextStyle(
                color: AppColors.contentColorBlack,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                fontFamily: "Comfortaa",
                overflow: TextOverflow.fade,
              ),
              icon: StyledImage(
                image: NetworkImage(widget.client.logo ?? ""),
                style: Style($image.fit.contain()),
              ),
            ),
            SideMenuItemDataTile(
              isSelected: false,
              onTap: () {
                widget.onConnectionTap();
              },
              title: "Conexões",
              icon: Icon(Icons.link, color: AppColors.primary),
            ),
            SideMenuItemDataTile(
              isSelected: false,
              onTap: () {
                widget.onScreenTap();
              },
              title: "Telas",
              icon: HeroIcon(HeroIcons.deviceTablet, color: AppColors.primary),
            ),

            const SideMenuItemDataDivider(divider: Divider()),
            SideMenuItemDataTile(
              isSelected: false,
              onTap: () {
                widget.onCuringaTap();
              },
              title: "Curingas",
              icon: HeroIcon(HeroIcons.variable, color: AppColors.primary),
            ),
            SideMenuItemDataTile(
              isSelected: false,
              onTap: () {
                widget.onClientTap();
              },
              title: "Clientes",
              icon: HeroIcon(HeroIcons.briefcase, color: AppColors.primary),
            ),
          ],
          footer: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              child: ListTile(
                title: StyledText(
                  "Felipe Hoffmeister",
                  style: Style(
                    $text.style.color.black(),
                    $text.style.fontSize(12),
                    $text.style.fontWeight(FontWeight.bold),
                    $text.style.fontFamily("Comfortaa"),
                    $text.overflow.ellipsis(),
                  ),
                ).showOrNull(data.isOpen),

                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/81923101?s=400&u=364f07ffc935e6f6e1affc2aa50231f46edb299d&v=4",
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

extension on Widget {
  Widget? showOrNull(bool isShow) => isShow ? this : null;
}

class NavItemModel {
  const NavItemModel({required this.name, required this.icon});

  final String name;
  final IconData icon;
}
