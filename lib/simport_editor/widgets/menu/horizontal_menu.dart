import "package:heroicons/heroicons.dart";
import "package:json_app/app/enum/enum.dart";
import "package:json_app/app/models/client/client_model.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:mix/mix.dart";

class HorizontalMenu extends StatelessWidget {
  final Client client;
  final Function() onCenterTap;
  final Function() onZoomInTap;
  final Function() onZoomOutTap;

  const HorizontalMenu({
    super.key,
    required this.client,
    required this.onCenterTap,
    required this.onZoomInTap,
    required this.onZoomOutTap,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Box(
        style: Style(
          $box.borderRadius(10),
          $box.width(double.infinity),
          $box.padding.only(left: 10, right: 10, top: 5, bottom: 5),
          $box.color(AppColors.contentColorWhite),
          $box.elevation(1),
          $box.borderRadius.all(10),
          $box.border.all(color: AppColors.borderCard, width: 1),
          $box.width(500),
        ),
        child: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: StyledText(
            "Conexões",
            style: Style(
              $text.style.color(AppColors.primary),
              $text.style.fontSize(18),
              $text.style.fontWeight(FontWeight.bold),
              $text.style.fontFamily("Comfortaa"),
              $text.overflow.ellipsis(),
            ),
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: onCenterTap,
          icon: HeroIcon(HeroIcons.arrowsPointingIn, color: AppColors.primary),
          tooltip: "Centralizar",
        ),
        IconButton(
          onPressed: onZoomInTap,
          icon: HeroIcon(
            HeroIcons.magnifyingGlassPlus,
            color: AppColors.primary,
          ),
          tooltip: "Zoom +",
        ),
        IconButton(
          onPressed: onZoomOutTap,
          icon: HeroIcon(
            HeroIcons.magnifyingGlassMinus,
            color: AppColors.primary,
          ),
          tooltip: "Zoom -",
        ),
        Theme(
          data: Theme.of(context).copyWith(
            popupMenuTheme: PopupMenuThemeData(
              color: AppColors.contentColorWhite,
              elevation: 20,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: AppColors.borderCard, width: 1),
              ),
              textStyle: TextStyle(
                color: AppColors.primary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Comfortaa",
              ),
            ),
          ),
          child: PopupMenuButton<int>(
            offset: const Offset(0, 20),
            position: PopupMenuPosition.under,
            icon: HeroIcon(HeroIcons.userGroup, color: AppColors.primary),
            tooltip: "Grupo de usuários",
            splashRadius: 10,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text(
                  "Usuário 1",
                  style: TextStyle(
                    color: AppColors.menuBackground,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Comfortaa",
                  ),
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Text(
                  "Usuário 2",
                  style: TextStyle(
                    color: AppColors.menuBackground,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Comfortaa",
                  ),
                ),
              ),
            ],
            onSelected: (value) {
              print("[HorizontalMenu] Selecionado: $value");
            },
          ),
        ),
      ],
    );
  }
}
