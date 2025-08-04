import "package:flutter/material.dart";
import "package:flutter/services.dart";

class WidgetWithCopyButton extends StatelessWidget {
  final Widget child;
  final String code;

  const WidgetWithCopyButton({
    required this.child,
    required this.code,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: child),
        const SizedBox(height: 12),
        ElevatedButton.icon(
          icon: const Icon(Icons.copy),
          label: const Text("Copiar código"),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: code));
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Código copiado!")));
          },
        ),
      ],
    );
  }
}
