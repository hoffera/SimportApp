import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
      onPressed: () {
        print("botao pressionado");
      },
      child: Text(text),
    );
  }
}
