import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:google_fonts/google_fonts.dart";
import "package:heroicons/heroicons.dart";
import "package:mix/mix.dart";
import "package:shimmer_animation/shimmer_animation.dart";

class CardFaceid extends StatelessWidget {
  final String nome;
  final String cpf;
  final String foto;
  final Function() onPress;

  const CardFaceid({
    super.key,
    required this.nome,
    required this.cpf,
    required this.foto,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return PressableBox(
      style: AnimatedStyle(
        Style(
          $box.height(80),
          $box.borderRadius(16),
          $box.width(double.infinity),
          $box.padding(10),
          $box.color(Theme.of(context).colorScheme.surface),

          $box.border(color: Theme.of(context).disabledColor),
          $on.press($box.color(Theme.of(context).disabledColor.withAlpha(10))),
          $on.hover($box.color(Theme.of(context).disabledColor.withAlpha(10))),
        ),
        duration: Durations.long1,
        curve: Curves.easeInOut,
      ),
      onPress: () {
        onPress();
      },
      child: _cardBody(context),
    );
  }

  Widget _cardBody(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_userInfo(context), _faceIdImage()],
    );
  }

  Widget _userInfo(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [_userImage(), SizedBox(width: 10), _userTexts(context)],
    );
  }

  Widget _userTexts(BuildContext context) {
    String emailMask = cpf.replaceAllMapped(
      RegExp(r"(^[^@]{2})[^@]*(@.*)"),
      (match) => "${match[1]}***${match[2]}",
    );
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StyledText(
            nome,
            style: Style(
              $text.style.color(Theme.of(context).colorScheme.onSurface),
              $text.style.fontFamily(GoogleFonts.comfortaa().fontFamily!),
              $text.style.fontSize(16),
              $text.style.fontWeight(FontWeight.bold),
              $text.style.decoration.none(),
              $text.overflow.ellipsis(),
            ),
          ),
          SizedBox(height: 5),
          StyledText(
            emailMask,
            style: Style(
              $text.style.color(Theme.of(context).disabledColor),
              $text.style.fontFamily(GoogleFonts.comfortaa().fontFamily!),
              $text.style.fontSize(12),
              $text.style.fontWeight(FontWeight.bold),
              $text.style.decoration.none(),
              $text.overflow.ellipsis(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _userImage() {
    return SizedBox(
      height: 60,
      width: 50,

      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),

        child: CachedNetworkImage(
          imageUrl: "https://appix.cs.simport.com.br/file/$foto/image",
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) => SizedBox(
            child: Center(
              child: Shimmer(child: Container(width: double.infinity)),
            ),
          ),
          errorWidget: (context, url, error) => SizedBox(
            height: 40,
            width: 40,
            child: Center(child: HeroIcon(HeroIcons.user)),
          ),
        ),
      ),
    );
  }

  Widget _faceIdImage() {
    return SvgPicture.asset(
      "assets/images/face-id-icon-com.svg",
      colorFilter: const ColorFilter.mode(Colors.green, BlendMode.srcIn),
      width: 40,
      semanticsLabel: "Red dash paths",
    );
  }
}
