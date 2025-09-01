import "package:flutter/material.dart" hide Icon;
import "package:heroicons/heroicons.dart";
import "package:json_app/app/enum/enum.dart";
import "package:mix/mix.dart";

class ButtonProperties {
  ButtonProperties({required this.onPressed, required this.title});

  final void Function() onPressed;
  final String title;
}

class CommonModal extends StatefulWidget {
  const CommonModal({
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
  final ButtonProperties? onCloseButton;
  final ButtonProperties? onPressButton;
  final ButtonProperties? tertiaryButton;
  final String title;

  @override
  State<CommonModal> createState() => _CommonModalState();
}

class _CommonModalState extends State<CommonModal> {
  late FocusNode _emailFocusNode;

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();

    _emailFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
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
              const SizedBox(height: 30),
              ..._buildContent(),

              if (listActions.isNotEmpty) ...[
                const SizedBox(height: 40),
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
          $text.color(AppColors.primary),
          $text.textAlign.center(),
        ),
        child: StyledText("Esqueci minha senha"),
      ),
      const SizedBox(height: 30),
      Box(
        style: Style(
          $text.style.fontSize(12),
          $text.style.fontWeight.normal(),
          $text.color.black(),
          $text.textAlign.center(),
        ),
        child: StyledText(
          "Recupere sua senha informando seu e-mail para receber as instruções",
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
      const SizedBox(height: 56),
      HeroIcon(HeroIcons.lockClosed, size: 56, color: Colors.black),
    ];
  }

  Widget _emailText() {
    return TextField(
      focusNode: _emailFocusNode,
      style: const TextStyle(color: Colors.black),
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "E-mail*",
        hintStyle: const TextStyle(color: Colors.grey, fontFamily: "Comfortaa"),
        prefixIcon: const HeroIcon(HeroIcons.envelope, color: Colors.grey),
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

  Widget _enterButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          "Confirmar",
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
              ? widget.modalHeight + 300
              : widget.modalHeight)
        : widget.modalHeight;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      width: double.infinity,
      height: modalHeight,
      child: _buildBody(),
    );
  }
}
