import "package:json_app/app/enum/enum.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class DividerLine extends StatelessWidget {
  const DividerLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: AppColors.background,
    );
  }
}
