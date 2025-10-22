import "package:json_app/src/ui/widgets/dialog/alert_dialog.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class ExportAlertDialogPage {
  static JsonWidgetData build(BuildContext context) {
    return JsonAlertDialog(
      title: JsonRow(
        children: [
          JsonExpanded(
            child: JsonText(
              "Situação meteorológica Paranaguá",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          JsonIconButton(
            icon: JsonIcon(Icons.close),
            args: {"onPressed": "closeDialog"},
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      content: JsonSizedBox(
        child: JsonSingleChildScrollView(
          child: JsonColumn(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              JsonContainer(
                foregroundDecoration: null,

                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red.shade800, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(12),
                child: JsonColumn(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    JsonText(
                      "PREVENÇÃO",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade800,
                      ),
                    ),
                  ],
                ),
              ),

              JsonSizedBox(height: 16),

              // Seção Condições atuais
              JsonContainer(
                foregroundDecoration: null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: JsonColumn(
                  children: [
                    // Cabeçalho da seção
                    JsonAlign(
                      alignment: Alignment.centerLeft,
                      child: JsonText(
                        "Condições atuais",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    JsonSizedBox(height: 12),
                    // Tabela de dados
                    JsonContainer(
                      foregroundDecoration: null,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: JsonColumn(
                        children: [
                          // Cabeçalho da tabela
                          JsonContainer(
                            foregroundDecoration: null,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            padding: EdgeInsets.all(8),
                            child: JsonRow(
                              children: [
                                JsonExpanded(
                                  child: JsonText(
                                    "Dado",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                JsonExpanded(
                                  child: JsonText(
                                    "Valor",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                JsonExpanded(
                                  child: JsonText(
                                    "Medido em",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Linha de dados
                          JsonContainer(
                            foregroundDecoration: null,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            padding: EdgeInsets.all(8),
                            child: JsonRow(
                              children: [
                                JsonExpanded(
                                  child: JsonText(
                                    "Velocidade média",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                JsonExpanded(
                                  child: JsonText(
                                    "15.05 kn",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                JsonExpanded(
                                  child: JsonText(
                                    "30/09/2025 às 15:50:11",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              JsonSizedBox(height: 16),
              // Seção Condições futuras
              JsonContainer(
                foregroundDecoration: null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: JsonColumn(
                  children: [
                    // Cabeçalho da seção
                    JsonAlign(
                      alignment: Alignment.centerLeft,
                      child: JsonText(
                        "Eventos e alertas meteorológicos",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    JsonSizedBox(height: 12),
                    // Tabela de dados
                    JsonContainer(
                      foregroundDecoration: null,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: JsonColumn(
                        children: [
                          // Cabeçalho da tabela
                          JsonContainer(
                            foregroundDecoration: null,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            padding: EdgeInsets.all(8),
                            child: JsonRow(
                              children: [
                                JsonExpanded(
                                  child: JsonText(
                                    "Período",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),

                                JsonExpanded(
                                  child: JsonText(
                                    "Descrição",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Linha de dados
                          JsonContainer(
                            foregroundDecoration: null,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            padding: EdgeInsets.all(8),
                            child: JsonColumn(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                JsonRow(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    JsonExpanded(
                                      child: JsonText(
                                        "30/09/2025 às 15:50  30/09/2025 às 16:50",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),

                                    JsonSizedBox(width: 4),
                                    JsonExpanded(
                                      child: JsonText(
                                        "Possibilidade de tempestade, com risco de descargas elétricas e trovoadas.",
                                        style: TextStyle(fontSize: 10),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),

                                JsonSizedBox(height: 4),
                                JsonRow(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    JsonExpanded(
                                      child: JsonText(
                                        "30/09/2025 às 15:50  30/09/2025 às 16:50",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),

                                    JsonSizedBox(width: 4),
                                    JsonExpanded(
                                      child: JsonText(
                                        "Possibilidade de tempestade, com risco de descargas elétricas e trovoadas.",
                                        style: TextStyle(fontSize: 10),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),

                                JsonSizedBox(height: 4),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              JsonSizedBox(height: 12),
              // Link para ações de prevenção
              JsonInkWell(
                onTap: () {},
                child: JsonRow(
                  children: [
                    JsonIcon(Icons.info_outline, color: Colors.blue, size: 16),
                    JsonSizedBox(width: 8),
                    JsonExpanded(
                      child: JsonText(
                        "Ações de prevenções de incidentes",
                        style: TextStyle(color: Colors.blue, fontSize: 14),
                        overflow: TextOverflow.clip,
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
