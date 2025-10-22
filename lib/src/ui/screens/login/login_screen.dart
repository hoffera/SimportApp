import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:flutter_svg/svg.dart";
import "package:heroicons/heroicons.dart";
import "package:json_app/src/data/store/language_store.dart";
import "package:json_app/src/data/store/theme_store.dart";
import "package:json_app/src/ui/widgets/cards/card_faceid.dart";
import "package:json_app/src/ui/widgets/dialog/commom_dialog.dart";
import "package:simport_design_system/utils/enum.dart";
import "package:wave/config.dart";
import "package:wave/wave.dart";

import "../../../../main.dart";
import "../../../data/store/login_store.dart";
import "../../../utils/enum/enum.dart" hide AppColors;
import "../../widgets/custom_typography/custom_typography.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginStore = getIt<LoginStore>();
  final themeStore = getIt<ThemeStore>();
  @override
  void initState() {
    super.initState();
    _onInit();
  }

  Future<void> _onInit() async {
    await loginStore.onInit(context);
  }

  @override
  Widget build(BuildContext context) {
    final FocusNode userFocus = FocusNode();
    final FocusNode passFocus = FocusNode();
    userFocus.addListener(() {
      if (userFocus.hasFocus) {
        loginStore.scrollToTop();
      }
    });

    passFocus.addListener(() {
      if (passFocus.hasFocus) {
        loginStore.scrollToTop();
      }
    });

    return Observer(
      builder: (_) => Theme(
        data: themeStore.isDarkMode
            ? themeStore.simportThemeModel!.dark
            : themeStore.simportThemeModel!.light,
        child: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              userFocus.unfocus();
              passFocus.unfocus();
            },
            child: Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBar: _appBar(context),
              body: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: 500,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      SingleChildScrollView(
                        controller: loginStore.scrollController,
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: CustomTypography(
                                text:
                                    getIt<LanguageStore>()
                                        .currentLocalizations
                                        ?.loginEnterButton ??
                                    "Entrar",
                                variant: TypoVariant.h1,
                                weight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),

                            if (loginStore.hasCredentials) ...[
                              const SizedBox(height: 24),
                              CardFaceid(
                                nome: loginStore.name,
                                cpf: loginStore.email,
                                foto: loginStore.foto,
                                onPress: () {
                                  loginStore.tryFaceIDLogin(context);
                                },
                              ),
                            ],

                            const SizedBox(height: 24),
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
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final lightened = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );
    return lightened.toColor();
  }

  PreferredSize _appBar(BuildContext context) {
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

                Theme.of(context).scaffoldBackgroundColor,
              ],
              durations: [18000, 8000, 12000],
              heightPercentages: [0.75, 0.76, 0.80],
            ),
            backgroundColor: AppColors.primary,
            size: Size(double.infinity, height),
            waveAmplitude: 10,
          ),
          Center(
            child: SvgPicture.asset(
              "assets/images/simport_logo.svg",
              width: 300,

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

  Form _inputs(FocusNode userFocus, FocusNode passFocus, BuildContext context) {
    return Form(
      key: loginStore.formKey,
      child: Column(
        children: [
          _userText(userFocus, context),
          SizedBox(height: 10.0),
          _passwordText(passFocus, context),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(
    BuildContext context,
    String hintText,
    HeroIcons icon,
  ) {
    return InputDecoration(
      filled: true,
      fillColor: Theme.of(context).colorScheme.surface,
      hintText: hintText,
      hintStyle: TextStyle(
        color: Theme.of(context).disabledColor,
        fontFamily: "Comfortaa",
      ),
      prefixIcon: HeroIcon(icon, color: Theme.of(context).disabledColor),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Theme.of(context).disabledColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Theme.of(context).disabledColor,
          width: 1.5,
        ),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
    );
  }

  Widget _userText(FocusNode userFocus, BuildContext context) {
    return TextFormField(
      key: Key("user_text_field"),
      controller: loginStore.userController,
      focusNode: userFocus,
      style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      cursorColor: AppColors.primary,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Por favor, insira seu usuário";
        }
        return null;
      },
      decoration: _inputDecoration(
        context,
        getIt<LanguageStore>().currentLocalizations?.usernameOrEmail ??
            "Usuário ou email",
        HeroIcons.user,
      ),
    );
  }

  Widget _passwordText(FocusNode passFocus, BuildContext context) {
    return TextFormField(
      key: Key("password_text_field"),
      controller: loginStore.passwordController,
      focusNode: passFocus,
      obscureText: true,
      style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      cursorColor: AppColors.primary,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Por favor, insira sua senha";
        }
        return null;
      },
      decoration: _inputDecoration(
        context,
        getIt<LanguageStore>().currentLocalizations?.loginPassword ?? "Senha",
        HeroIcons.lockClosed,
      ),
    );
  }

  Widget _enterButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          // await loginStore.loginUser(context);
          await loginStore.performLogin(
            context,
            "felipe.hoffmeiste@gmail.com",
            "Hoff88338@",
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          getIt<LanguageStore>().currentLocalizations?.loginEnterButton ??
              "Entrar",
          style: const TextStyle(
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
      child: Align(
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              builder: (context) => CommonDialog(
                title: "Recuperar senha",
                description: "Recupere sua senha.",
              ),
            );
          },

          child: Text(
            getIt<LanguageStore>().currentLocalizations?.loginPasswordButton ??
                "Esqueci minha senha",
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 12,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primary,
              fontFamily: "Comfortaa",
            ),
          ),
        ),
      ),
    );
  }
}
