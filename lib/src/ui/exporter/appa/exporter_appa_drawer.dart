import "package:json_app/main.dart";
import "package:json_app/src/data/store/theme_store.dart";
import "package:json_app/src/ui/widgets/dropdown/dropdown_language.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class ExporterAppaDrawer {
  final BuildContext context;
  ExporterAppaDrawer({required this.context});
  JsonWidgetData build(BuildContext context) {
    return JsonAlign(
      alignment: Alignment.centerLeft,
      child: JsonMaterial(
        child: JsonSizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: JsonSafeArea(
            child: JsonPadding(
              padding: const EdgeInsets.all(10.0),
              child: JsonContainer(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(20.0),
                child: JsonColumn(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // Avatar do usuário
                    JsonAlign(
                      alignment: Alignment.topCenter,
                      child: JsonColumn(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          JsonClipOval(
                            child: JsonContainer(
                              args: {
                                "decoration": {
                                  "shape": "circle",
                                  "border": {
                                    "color": "\${primaryColor}",
                                    "width": 1.0,
                                  },
                                },
                              },
                              decoration: null,
                              foregroundDecoration: null,
                              width: 80.0,
                              height: 80.0,

                              child: JsonNetworkImage(
                                args: {
                                  "src": "\${userAvatarUrl}",
                                  "errorBuilder": "\${networkImageError}",
                                },
                                src:
                                    "https://appix.cs.simport.com.br/file/7490/image",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          JsonSizedBox(height: 10),

                          // Informações do usuário
                          JsonColumn(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              JsonText(
                                "",
                                args: {"text": "\${userName}"},
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              JsonSizedBox(height: 6),
                              JsonText(
                                "",
                                args: {"text": "\${userEmail}"},
                                style: const TextStyle(fontSize: 12.0),
                              ),

                              JsonSizedBox(height: 8),
                            ],
                          ),

                          // Informações do cliente
                          JsonListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: JsonContainer(
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: JsonNetworkImage(
                                args: {
                                  "src": "\${clientLogoUrl}",
                                  "errorBuilder": "\${networkImageError}",
                                },
                                src: "",
                                fit: BoxFit.contain,
                              ),

                              foregroundDecoration: null,
                            ),
                            title: JsonText(
                              "",
                              args: {"text": "\${clientName}"},
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: JsonText(
                              "",
                              args: {"text": "\${clientID}"},
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),

                          JsonSizedBox(height: 8),

                          // Divisor
                          JsonPadding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                            child: JsonContainer(
                              height: 0.5,
                              color: Theme.of(context).colorScheme.outline,
                              decoration: null,
                              foregroundDecoration: null,
                            ),
                          ),

                          JsonListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: JsonIcon(Icons.palette, size: 24.0),
                            title: JsonText(
                              "Tema escuro",
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            trailing: JsonSwitch(
                              args: {
                                "value": "\${switchTheme}",
                                "onChanged":
                                    "\${switchThemeFunction(switchTheme)}",
                              },
                              activeTrackColor: Colors.green,
                              value: getIt<ThemeStore>().isDarkMode,
                              onChanged: (bool value) async {
                                await Future.microtask(() {
                                  getIt<ThemeStore>().setDarkMode(value);
                                });
                              },
                            ),
                          ),

                          JsonSizedBox(height: 4),

                          JsonListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: JsonIcon(Icons.language, size: 24.0),
                            title: JsonText(
                              "Idioma",
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            trailing: JsonDropdownLanguage(
                              textPt: "Português",
                              textEn: "Inglês",
                              textEs: "Espanhol",
                            ),
                          ),

                          JsonSizedBox(height: 4),

                          JsonListTile(
                            args: {"onTap": "\${navigateToHome()}"},
                            contentPadding: EdgeInsets.zero,
                            leading: JsonIcon(Icons.people, size: 24.0),
                            title: JsonText(
                              "Clientes",
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),

                          // Divisor
                          JsonPadding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                            child: JsonContainer(
                              height: 0.5,
                              color: Theme.of(context).colorScheme.outline,
                              decoration: null,
                              foregroundDecoration: null,
                            ),
                          ),

                          // Logout
                          JsonListTile(
                            args: {"onTap": "\${logout()}"},
                            contentPadding: EdgeInsets.zero,

                            leading: JsonIcon(Icons.logout, size: 24.0),
                            title: JsonText(
                              "Sair",
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Links de termos e política
                    JsonAlign(
                      alignment: Alignment.bottomCenter,
                      child: JsonRow(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          JsonGestureDetector(
                            args: {
                              "onTap":
                                  "\${launchUrl('https://simport.com.br/termos-de-uso/')}",
                            },
                            onTap: () {},
                            child: JsonText(
                              "Termos de Uso",
                              args: {
                                "style": {
                                  "color": "\${primaryColor}",
                                  "fontWeight": "w600",
                                  "fontSize": 12,
                                },
                              },
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          JsonText(
                            " | ",
                            args: {
                              "style": {
                                "color": "\${primaryColor}",
                                "fontWeight": "w600",
                                "fontSize": 12,
                              },
                            },
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 12.0,
                            ),
                          ),
                          JsonGestureDetector(
                            args: {
                              "onTap":
                                  "\${launchUrl('https://simport.com.br/politica-de-privacidade/')}",
                            },
                            child: JsonText(
                              "Política de Privacidade",
                              args: {
                                "style": {
                                  "color": "\${primaryColor}",
                                  "fontWeight": "w600",
                                  "fontSize": 12,
                                },
                              },
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                foregroundDecoration: null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
