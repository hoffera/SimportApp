import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:json_app/src/data/models/client/client.dart";
import "package:json_app/src/ui/widgets/custom_frame.dart";
import "package:json_app/src/ui/widgets/custom_typography/custom_typography.dart";
import "package:json_app/src/utils/enum/enum.dart";

class ClientCard extends StatelessWidget {
  final ClientModel client;
  final Function()? onPress;
  const ClientCard({super.key, required this.client, this.onPress});

  @override
  Widget build(BuildContext context) {
    return _cardClient(client, context);
  }

  Widget _cardClient(ClientModel client, BuildContext context) {
    return CustomFrame(
      color: Theme.of(context).cardColor,
      width: 400,
      height: 200,
      onPress: () {
        onPress?.call();
      },
      child: SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Container(
                constraints: const BoxConstraints(maxHeight: 100),
                width: 80,

                child: Image.network(
                  client.logoUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return SvgPicture.network(
                      client.logoUrl,
                      fit: BoxFit.contain,
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: CustomTypography(
                        variant: TypoVariant.h6,
                        text: client.clientId.length > 20
                            ? "${client.clientId.substring(0, 20)}..."
                            : client.clientId,
                        weight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                        overflow: TextOverflow.ellipsis,
                        align: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Flexible(
                      child: CustomTypography(
                        variant: TypoVariant.h7,
                        text: client.name.length > 50
                            ? "${client.name.substring(0, 50)}..."
                            : client.name,
                        weight: FontWeight.normal,
                        color: Theme.of(context).disabledColor,
                        align: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
