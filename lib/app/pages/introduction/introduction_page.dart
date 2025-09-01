import "package:get/get.dart";
import "package:introduction_screen/introduction_screen.dart";
import "package:json_app/app/enum/enum.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd() {
    Get.toNamed("/login-page");
  }

  Widget _bodyWidget() {
    return Center(
      child: Container(
        height: 600,
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/icon_logo.png", width: 100),
            const SizedBox(height: 20),
            const Text(
              "Fractional shares",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const Text(
              "Instead of having to buy an entire share, invest any amount you want.",
              style: TextStyle(fontSize: 19.0, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white, // fundo da tela rosa claro
      allowImplicitScrolling: true,
      autoScrollDuration: 10000,
      infiniteAutoScroll: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showSkipButton: false,
      showBackButton: false,
      showNextButton: false,
      showDoneButton: false,
      curve: Curves.easeInOutSine,
      dotsDecorator: DotsDecorator(
        activeColor: AppColors.primary,
        size: const Size(10.0, 10.0),
        color: Colors.grey.shade400,
        activeSize: const Size(22.0, 10.0),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),

      pages: [
        PageViewModel(
          title: "",

          decoration: const PageDecoration(pageColor: Colors.transparent),
          bodyWidget: _bodyWidget(),
        ),
        PageViewModel(
          title: "",

          decoration: const PageDecoration(pageColor: Colors.transparent),
          bodyWidget: _bodyWidget(),
        ),
      ],
      globalFooter: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 50,

                  child: ElevatedButton(
                    onPressed: () => _onIntroEnd(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Acessar minha conta",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Comfortaa",
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
