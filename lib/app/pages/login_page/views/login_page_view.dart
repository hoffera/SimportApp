import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:json_app/app/enum/enum.dart';
import 'package:json_app/components/animated_svg/animated_svg_widget.dart';
import 'package:json_app/components/commom_modal/common_modal.dart';
import 'package:json_app/l10n/app_localizations.dart';
import 'package:mix/mix.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({super.key});

  Color lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final lightened = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );
    return lightened.toColor();
  }

  @override
  Widget build(BuildContext context) {
    final FocusNode userFocus = FocusNode();
    final FocusNode passFocus = FocusNode();
    userFocus.addListener(() {
      if (userFocus.hasFocus) {
        controller.scrollToTop();
      }
    });

    passFocus.addListener(() {
      if (passFocus.hasFocus) {
        controller.scrollToTop();
      }
    });

    return GestureDetector(
      onTap: () {
        userFocus.unfocus();
        passFocus.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBar(),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: controller.scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  _inputs(userFocus, passFocus, context),
                  const SizedBox(height: 24),
                  _enterButton(context),
                  const SizedBox(height: 10.0),
                  _resetPasswordButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSize _appBar() {
    double height = 260.0;
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Stack(
        children: [
          WaveWidget(
            config: CustomConfig(
              colors: [
                lighten(AppColors.primary, 0.1),
                lighten(AppColors.primary, 0.2),

                Colors.white,
              ],
              durations: [18000, 8000, 12000],
              heightPercentages: [0.75, 0.76, 0.80],
            ),
            backgroundColor: AppColors.primary,
            size: Size(double.infinity, height),
            waveAmplitude: 10,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: AnimatedSvg(),
            ),
          ),
        ],
      ),
    );
  }

  Form _inputs(FocusNode userFocus, FocusNode passFocus, BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          _userText(userFocus, context),
          SizedBox(height: 10.0),
          _passwordText(passFocus, context),
        ],
      ),
    );
  }

  Widget _userText(FocusNode userFocus, BuildContext context) {
    return TextField(
      controller: controller.userController,
      focusNode: userFocus,
      style: const TextStyle(color: Colors.black),
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: AppLocalizations.of(context)!.loginUser,
        hintStyle: const TextStyle(color: Colors.grey, fontFamily: "Comfortaa"),
        prefixIcon: const HeroIcon(HeroIcons.user, color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.grey, width: 2),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  Widget _passwordText(FocusNode passFocus, BuildContext context) {
    return TextField(
      controller: controller.passwordController,
      focusNode: passFocus,
      style: const TextStyle(color: Colors.black),
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: AppLocalizations.of(context)!.loginPassword,
        hintStyle: const TextStyle(color: Colors.grey, fontFamily: "Comfortaa"),
        prefixIcon: const HeroIcon(HeroIcons.lockClosed, color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.grey, width: 2),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  Widget _enterButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () => controller.loginUser(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          AppLocalizations.of(context)!.loginEnterButton,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Comfortaa",
            fontWeight: FontWeight.w800,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _resetPasswordButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: VBox(
        style: Style($box.alignment(Alignment.bottomRight)),
        children: [
          PressableBox(
            onPress: () => {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor:
                    Colors.white, // se quiser o modal com cantos arredondados
                builder: (context) => CommonModal(
                  title: "Título do Modal",
                  description: "Descrição qualquer",
                  onPressButton: ButtonProperties(
                    title: "Confirmar",
                    onPressed: () {
                      // ação de confirmar
                      Navigator.pop(context); // fecha o modal
                    },
                  ),
                  onCloseButton: ButtonProperties(
                    title: "Cancelar",
                    onPressed: () {
                      Navigator.pop(context); // fecha o modal
                    },
                  ),
                ),
              ),
            },
            child: StyledText(
              AppLocalizations.of(context)!.loginPasswordButton,
              style: Style(
                $text.style.color(AppColors.primary),
                $text.style.fontSize(12),
                $text.style.decoration.underline(),
                $text.style.decorationColor(AppColors.primary),
                $text.style.fontFamily("Comfortaa"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
