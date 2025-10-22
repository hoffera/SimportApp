import "package:json_dynamic_widget/json_dynamic_widget.dart";

class ExporterAppaNotificationScreen {
  JsonWidgetData build(BuildContext context) {
    return JsonScaffold(
      args: {"backgroundColor": "\${backgroundScaffoldColor}"},
      appBar: JsonAppBar(
        title: JsonText("Notificações"),

        leading: JsonIconButton(
          icon: JsonIcon(Icons.arrow_back, size: 24),
          onPressed: () {},
        ),
        automaticallyImplyLeading: false,
      ),
      body: JsonListView(
        children: [
          JsonContainer(
            foregroundDecoration: null,

            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 1, color: Colors.grey.shade300),
            ),
            child: JsonRow(
              children: [
                JsonExpanded(
                  child: JsonPadding(
                    padding: const EdgeInsets.all(16),
                    child: JsonListTile(
                      contentPadding: EdgeInsets.zero,
                      title: JsonText(
                        "Notificações",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: JsonText(
                        "Obrigado por usar nosso app.",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.blueGrey,
                        ),
                      ),
                      leading: JsonIcon(
                        Icons.notifications,
                        size: 24,
                        args: {"color": "\${primaryColor}"},
                      ),
                    ),
                  ),
                ),

                JsonFlexible(
                  child: JsonAlign(
                    alignment: Alignment.bottomRight,
                    child: JsonIconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      icon: JsonIcon(Icons.close, size: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          JsonContainer(
            foregroundDecoration: null,

            margin: const EdgeInsets.all(12),
            // args: {
            //   "decoration": {
            //     "border": {"width": 1, "color": "\${primaryColor}"},
            //   },
            // },
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 1),
            ),
            child: JsonRow(
              children: [
                JsonExpanded(
                  child: JsonPadding(
                    padding: const EdgeInsets.all(16),
                    child: JsonListTile(
                      contentPadding: EdgeInsets.zero,
                      title: JsonText(
                        "Notificações",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: JsonText(
                        "Obrigado por usar nosso app.",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.blueGrey,
                        ),
                      ),
                      leading: JsonIcon(
                        Icons.notifications,
                        size: 24,
                        args: {"color": "\${primaryColor}"},
                      ),
                    ),
                  ),
                ),

                JsonFlexible(
                  child: JsonAlign(
                    alignment: Alignment.bottomRight,
                    child: JsonIconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      icon: JsonIcon(Icons.close, size: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
