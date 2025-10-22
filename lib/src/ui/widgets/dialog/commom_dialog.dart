// ignore_for_file: use_build_context_synchronously

import "package:flutter/material.dart" hide Icon;
import "package:heroicons/heroicons.dart";
import "package:json_app/main.dart";
import "package:json_app/src/data/services/user_service.dart";
import "package:json_app/src/data/store/language_store.dart";
import "package:mix/mix.dart";
import "package:simport_design_system/utils/enum.dart";
import "package:simport_design_system/widgets/snackbar/snackbar_widget.dart";

class BttnProperties {
  BttnProperties({required this.onPressed, required this.title});

  final void Function() onPressed;
  final String title;
}

class CommonDialog extends StatefulWidget {
  const CommonDialog({
    super.key,
    required this.title,
    required this.description,
    this.modalHeight = 450,
    this.onPressButton,
    this.onCloseButton,
    this.tertiaryButton,
    this.loading,
  });

  final String description;
  final bool? loading;
  final double modalHeight;
  final BttnProperties? onCloseButton;
  final BttnProperties? onPressButton;
  final BttnProperties? tertiaryButton;
  final String title;

  @override
  State<CommonDialog> createState() => _CommonDialogState();
}

class _CommonDialogState extends State<CommonDialog> {
  late FocusNode _emailFocusNode;
  late TextEditingController _emailController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _emailController = TextEditingController();
    _emailFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _emailController.dispose();
    super.dispose();
  }

  List<Widget> get listActions {
    return [_emailText(), _enterButton()];
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: SafeArea(
        child: GestureDetector(
          onTap: () => _emailFocusNode.unfocus(),
          child: Column(
            children: [
              ..._buildHeader(),
              const SizedBox(height: 25),
              ..._buildContent(),

              if (listActions.isNotEmpty) ...[
                const SizedBox(height: 20),
                _buildFooter(),
              ],
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildContent() {
    return [
      Box(
        style: Style(
          $text.style.fontSize(18),
          $text.style.fontWeight.w600(),
          $text.color(const Color(0xFF005693)),
          $text.textAlign.center(),
        ),
        child: StyledText(
          getIt<LanguageStore>().currentLocalizations?.loginPasswordButton ??
              "Entrar",
        ),
      ),
      const SizedBox(height: 10),
      Box(
        style: Style(
          $text.style.fontSize(14),
          $text.style.fontWeight.normal(),
          $text.color(Theme.of(context).colorScheme.onSurface),
          $text.textAlign.center(),
        ),
        child: StyledText(
          getIt<LanguageStore>().currentLocalizations?.resetPasswordInfo ??
              "Recupere sua senha informando seu nome de usuário ou e-mail para receber as instruções",
        ),
      ),
    ];
  }

  List<Widget> _buildHeader() {
    final styles = Style($box.width(60), $box.borderRadius(5));
    return [
      const SizedBox(height: 10),
      Box(
        key: const Key("line-header"),
        style: styles,
        child: Image.asset("assets/images/wave.png"),
      ),
      const SizedBox(height: 25),
      HeroIcon(
        HeroIcons.lockClosed,
        size: 56,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    ];
  }

  Widget _emailText() {
    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        hintText:
            getIt<LanguageStore>().currentLocalizations?.usernameOrEmail ??
            "Usuário ou email",
        hintStyle: TextStyle(
          color: Theme.of(context).disabledColor,
          fontFamily: "Comfortaa",
        ),
        prefixIcon: HeroIcon(
          HeroIcons.user,
          color: Theme.of(context).disabledColor,
        ),
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
      ),
    );
  }

  Widget _enterButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _isLoading
            ? null
            : () async {
                final email = _emailController.text.trim().toLowerCase();

                if (email.isEmpty) {
                  showTopSnackBar(
                    context,
                    getIt<LanguageStore>()
                            .currentLocalizations
                            ?.pleaseEnterUsernameOrEmail ??
                        "Por favor, informe seu usuário ou email.",
                    true,
                  );
                  return;
                }

                setState(() {
                  _isLoading = true;
                });
                await UserService.resetPassword(username: email);

                showTopSnackBar(
                  context,
                  getIt<LanguageStore>()
                          .currentLocalizations
                          ?.recoveryEmailSent ??
                      "Email de recuperação enviado.",
                  false,
                );

                if (mounted) {
                  setState(() {
                    _isLoading = false;
                  });
                  _emailController.clear();
                  _emailFocusNode.unfocus();
                  Navigator.pop(context);
                }
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: _isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                getIt<LanguageStore>().currentLocalizations?.confirm ??
                    "Confirmar",
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

  Widget _buildFooter() {
    return Column(
      children: listActions
          .expand((element) => [element, const SizedBox(height: 20)])
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardOpen = bottomInset > 0;

    final modalHeight = isKeyboardOpen
        ? (_emailFocusNode.hasFocus
              ? widget.modalHeight + 500
              : widget.modalHeight)
        : widget.modalHeight;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      width: double.infinity,
      height: modalHeight,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: _buildBody(),
    );
  }
}
