import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:json_app/app/enum/enum.dart"; // ou substitua AppColors.primary se necessário

class CopyCodeButton extends StatelessWidget {
  final String code;

  const CopyCodeButton({required this.code, super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      label: const Text("Copiar código"),
      icon: const Icon(Icons.copy),
      onPressed: () {
        Clipboard.setData(ClipboardData(text: code));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Código copiado!",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 1),
          ),
        );
      },
    );
  }
}
