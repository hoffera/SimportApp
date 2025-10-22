// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_string_interpolations

import "package:intl/intl.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:simport_design_system/widgets/appbar/default_appbar/view/default_appbar.dart";
import "package:simport_design_system/widgets/sync/linear_chart/sync_linear_graph.dart";
import "package:simport_design_system/widgets/sync/linear_chart/sync_linear_graph_builder.dart";
import "package:syncfusion_flutter_charts/charts.dart";

class ExporterAppaHomeScreen {
  JsonWidgetData build(BuildContext context) {
    final BoxDecoration boxDecoration = BoxDecoration();
    final JsonWidgetRegistry registry = JsonWidgetRegistry.instance;
    registry.setValue("userName", "Felipe Hoffmeister");
    registry.setValue(
      "userAvatarUrl",

      "https://appix.cs.simport.com.br/file/123/image",
    );
    return JsonScaffold(
      args: {"backgroundColor": "\${backgroundScaffoldColor}"},
      appBar: JsonDefaultAppBar(
        args: {
          "name": "\${userName}",
          "url": "\${userAvatarUrl}",
          "onRefresh": "\${refreshScreen(18)}",
          "onUser": "\${showDrawer(24)}",
          "onBell": "\${navigateToHome()}",
        },

        name: "",
        url: "",
      ),
      drawer: JsonColumn(
        children: [
          JsonSizedBox(height: 40),
          titlePage(context),
          JsonSizedBox(height: 20),
          sectionTitle("situacao", context),
          JsonSizedBox(height: 10),
          divider(context),

          JsonSizedBox(height: 20),
          JsonRow(
            children: [
              JsonExpanded(
                child: cardSituation(
                  "2",
                  Colors.green,
                  "antonina_normal",
                  context,
                ),
              ),
              JsonSizedBox(width: 10),
              JsonExpanded(
                child: cardSituation(
                  "3",
                  Colors.red,
                  "paranagua_prevencao",
                  context,
                ),
              ),
            ],
          ),
          JsonSizedBox(height: 10),
          updatedTime(),
          JsonSizedBox(height: 10),
          sectionTitle("meteorologia", context),
          JsonSizedBox(height: 10),
          divider(context),
          JsonSizedBox(height: 20),
          JsonRow(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JsonExpanded(
                child: JsonColumn(
                  children: [
                    cardM(boxDecoration, context),
                    JsonSizedBox(height: 1),
                    subCardM(),
                  ],
                ),
              ),

              JsonSizedBox(width: 10),
              JsonExpanded(
                child: JsonColumn(
                  children: [
                    cardM(boxDecoration, context),
                    JsonSizedBox(height: 1),
                    subCardM(),
                  ],
                ),
              ),
            ],
          ),

          JsonSizedBox(height: 10),

          sectionTitle("Maré", context),
          JsonSizedBox(height: 10),
          divider(context),
          JsonSizedBox(height: 10),
          JsonRow(
            children: [
              JsonExpanded(child: infosMare(boxDecoration)),
              JsonSizedBox(width: 10),
              JsonExpanded(child: infosMare(boxDecoration)),
            ],
          ),
          JsonSizedBox(height: 10),
          graficoMare(boxDecoration),
          JsonSizedBox(height: 20),
          sectionTitle("Boletim", context),
          JsonSizedBox(height: 10),
          divider(context),
          JsonSizedBox(height: 20),
          JsonRow(
            children: [
              JsonExpanded(
                child: cardBoletim(
                  "Boletim de Antonina",
                  context,
                  boxDecoration,
                ),
              ),
              JsonSizedBox(width: 10),
              JsonExpanded(
                child: cardBoletim(
                  "Boletim de Paranaguá",
                  context,
                  boxDecoration,
                ),
              ),
            ],
          ),
          JsonSizedBox(height: 20),
        ],
      ),

      body: JsonSingleChildScrollView(
        child: JsonPadding(
          padding: EdgeInsetsGeometry.all(20),
          child: JsonColumn(
            children: [
              JsonSizedBox(height: 40),
              titlePage(context),
              JsonSizedBox(height: 20),
              sectionTitle("situacao", context),
              JsonSizedBox(height: 10),
              divider(context),

              JsonSizedBox(height: 20),
              JsonRow(
                children: [
                  JsonExpanded(
                    child: cardSituation(
                      "2",
                      Colors.green,
                      "antonina_normal",
                      context,
                    ),
                  ),
                  JsonSizedBox(width: 10),
                  JsonExpanded(
                    child: cardSituation(
                      "3",
                      Colors.red,
                      "paranagua_prevencao",
                      context,
                    ),
                  ),
                ],
              ),
              JsonSizedBox(height: 10),
              updatedTime(),
              JsonSizedBox(height: 10),
              sectionTitle("meteorologia", context),
              JsonSizedBox(height: 10),
              divider(context),
              JsonSizedBox(height: 20),
              JsonRow(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JsonExpanded(
                    child: JsonColumn(
                      children: [
                        cardM(boxDecoration, context),
                        JsonSizedBox(height: 1),
                        subCardM(),
                      ],
                    ),
                  ),

                  JsonSizedBox(width: 10),
                  JsonExpanded(
                    child: JsonColumn(
                      children: [
                        cardM(boxDecoration, context),
                        JsonSizedBox(height: 1),
                        subCardM(),
                      ],
                    ),
                  ),
                ],
              ),

              JsonSizedBox(height: 10),

              sectionTitle("Maré", context),
              JsonSizedBox(height: 10),
              divider(context),
              JsonSizedBox(height: 10),
              JsonRow(
                children: [
                  JsonExpanded(child: infosMare(boxDecoration)),
                  JsonSizedBox(width: 10),
                  JsonExpanded(child: infosMare(boxDecoration)),
                ],
              ),
              JsonSizedBox(height: 10),
              graficoMare(boxDecoration),
              JsonSizedBox(height: 20),
              sectionTitle("Boletim", context),
              JsonSizedBox(height: 10),
              divider(context),
              JsonSizedBox(height: 20),
              JsonRow(
                children: [
                  JsonExpanded(
                    child: cardBoletim(
                      "Boletim de Antonina",
                      context,
                      boxDecoration,
                    ),
                  ),
                  JsonSizedBox(width: 10),
                  JsonExpanded(
                    child: cardBoletim(
                      "Boletim de Paranaguá",
                      context,
                      boxDecoration,
                    ),
                  ),
                ],
              ),
              JsonSizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  JsonRow titlePage(BuildContext context) {
    return JsonRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        JsonText(
          args: {
            "text": "%antonina%",
            "style": {
              "color": "\${primaryColor}",
              "fontWeight": "w600",
              "fontSize": 23,
            },
          },
          "Antonina",
        ),
        JsonText(
          "Paranaguá",
          args: {
            "text": "%paranagua%",
            "style": {
              "color": "\${primaryColor}",
              "fontWeight": "w600",
              "fontSize": 23,
            },
          },
        ),
      ],
    );
  }

  JsonAlign sectionTitle(String title, BuildContext context) {
    return JsonAlign(
      alignment: Alignment.centerLeft,
      child: JsonText(
        title,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        args: {
          "text": "%$title%",
          "style": {
            "color": "\${primaryColor}",
            "fontWeight": "w500",
            "fontSize": 18,
          },
        },
      ),
    );
  }

  static JsonContainer divider(BuildContext context) {
    return JsonContainer(
      args: {
        "decoration": {
          "borderRadius": {
            "bottomLeft": {"type": "elliptical", "x": 10.0, "y": 10.0},
            "bottomRight": {"type": "elliptical", "x": 10.0, "y": 10.0},
            "topLeft": {"type": "elliptical", "x": 10.0, "y": 10.0},
            "topRight": {"type": "elliptical", "x": 10.0, "y": 10.0},
            "type": "only",
          },
          "color": "\${dividerColor}",
          "shape": "rectangle",
        },
        "height": 2.0,
        "width": "${null}",
      },
      foregroundDecoration: null,
      height: 2,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
    );
  }

  static JsonGestureDetector cardSituation(
    String id,
    Color colorText,
    String title,
    BuildContext context,
  ) {
    return JsonGestureDetector(
      args: {"onTap": "\${showDialog('$id')}"},
      onTap: () {},
      child: JsonContainer(
        foregroundDecoration: null,

        decoration: BoxDecoration(),
        args: {
          "decoration": {"color": "\${scaffoldBackgroundColor}"},
        },

        child: JsonContainer(
          foregroundDecoration: null,
          height: 80,

          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),

            border: Border.all(color: colorText, width: 1),
          ),
          child: JsonRow(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              JsonSizedBox(width: 1, height: 10),
              JsonText(
                "%$title%",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: colorText,
                ),
                textAlign: TextAlign.center,
              ),
              JsonIcon(
                args: {"color": "\${onSurfaceColor}"},
                Icons.chevron_right,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static JsonContainer cardM(
    BoxDecoration boxDecoration,
    BuildContext context,
  ) {
    return JsonContainer(
      foregroundDecoration: null,

      padding: const EdgeInsets.all(10),
      decoration: boxDecoration,
      args: {
        "decoration": {
          "border": {
            "bottom": {
              "color": "\${primaryColor}",
              "strokeAlign": -1.0,
              "style": "solid",
              "width": 1.0,
            },
            "left": {
              "color": "\${primaryColor}",
              "strokeAlign": -1.0,
              "style": "solid",
              "width": 1.0,
            },
            "right": {
              "color": "\${primaryColor}",
              "strokeAlign": -1.0,
              "style": "solid",
              "width": 1.0,
            },
            "top": {
              "color": "\${primaryColor}",
              "strokeAlign": -1.0,
              "style": "solid",
              "width": 1.0,
            },
          },
          "borderRadius": {
            "bottomLeft": {"type": "elliptical", "x": 10.0, "y": 10.0},
            "bottomRight": {"type": "elliptical", "x": 10.0, "y": 10.0},
            "topLeft": {"type": "elliptical", "x": 10.0, "y": 10.0},
            "topRight": {"type": "elliptical", "x": 10.0, "y": 10.0},
            "type": "only",
          },

          "color": "\${cardColor}",
          "shape": "rectangle",
        },
      },
      child: JsonColumn(
        children: [
          JsonRow(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              JsonIcon(
                IconData(0xe174, fontFamily: "MaterialIcons"),
                size: 30,
                color: Color(0xFF4387f6),
              ),
              JsonColumn(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  JsonText(
                    "%temperatura_valor%",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  JsonText(
                    "%sensacao_valor%",
                    args: {
                      "style": {
                        "color": "\${disabledColor}",
                        "fontWeight": "w500",
                        "fontSize": 12,
                      },
                    },
                  ),
                ],
              ),
            ],
          ),

          JsonSizedBox(height: 20),
          secondLine(context),
        ],
      ),
    );
  }

  static JsonColumn secondLine(BuildContext context) {
    return JsonColumn(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        card(
          "valor_nos",
          "ssw",
          const Color(0xFFecfeff),
          Icons.air,
          const Color(0xFF22bfd9),
          context,
        ),
        JsonSizedBox(height: 5),
        card(
          "valor_umidade",
          "umidade",
          const Color(0xFFeff6ff),
          Icons.water_drop,
          const Color(0xFF4387f6),
          context,
        ),
        JsonSizedBox(height: 5),
        card(
          "valor_pressao",
          "pressao",
          const Color(0xFFfffbeb),
          Icons.thermostat,
          const Color(0xFFf6ab2b),
          context,
        ),
      ],
    );
  }

  static JsonAlign subCardM() {
    return JsonAlign(
      alignment: Alignment.centerRight,
      child: JsonTextButton(
        onPressed: () {},
        child: JsonText(
          "%verprevisao%",
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
        ),
      ),
    );
  }

  static JsonAlign updatedTime() {
    return JsonAlign(
      alignment: Alignment.centerRight,
      child: JsonText(
        "%atualizado_tempo_minutos%",
        style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
      ),
    );
  }

  static JsonContainer card(
    String title,
    String subtitle,
    Color backgroundColor,
    IconData icon,
    Color iconColor,
    BuildContext context,
  ) {
    return JsonContainer(
      foregroundDecoration: null,
      height: 60,

      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 1),
      ),
      child: JsonRow(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          JsonIcon(icon, size: 20, weight: 20, color: iconColor),
          JsonSizedBox(width: 10),
          JsonColumn(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              JsonText(
                "%$title%",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              JsonText(
                "%$subtitle%",
                args: {
                  "style": {
                    "color": "\${disabledColor}",
                    "fontWeight": "w500",
                    "fontSize": 12,
                  },
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  static JsonRow mareTitle(String title, String value) {
    return JsonRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        JsonText(
          "%$title%:",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),

        JsonColumn(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JsonText(
              "%$value%",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }

  static JsonRow mareLine(String title, String value, String time) {
    return JsonRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        JsonText(
          "%$title%:",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),

        JsonColumn(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JsonText(
              "%$value%",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),

            JsonText(
              "%$time%",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 8),
            ),
          ],
        ),
      ],
    );
  }

  static JsonContainer infosMare(BoxDecoration boxDecoration) {
    return JsonContainer(
      foregroundDecoration: null,

      child: JsonColumn(
        children: [
          mareTitle("mare", "val_m"),
          JsonSizedBox(height: 12),
          mareLine("preamar", "val_pre", "data_preamar"),
          JsonSizedBox(height: 10),
          mareLine("baixamar", "val_ba", "data_baixamar"),
          JsonSizedBox(height: 10),
        ],
      ),
      padding: const EdgeInsets.all(10),
      decoration: boxDecoration,
      args: {
        "decoration": {
          "border": {
            "bottom": {
              "color": "\${primaryColor}",
              "strokeAlign": -1.0,
              "style": "solid",
              "width": 1.0,
            },
            "left": {
              "color": "\${primaryColor}",
              "strokeAlign": -1.0,
              "style": "solid",
              "width": 1.0,
            },
            "right": {
              "color": "\${primaryColor}",
              "strokeAlign": -1.0,
              "style": "solid",
              "width": 1.0,
            },
            "top": {
              "color": "\${primaryColor}",
              "strokeAlign": -1.0,
              "style": "solid",
              "width": 1.0,
            },
          },
          "borderRadius": {
            "bottomLeft": {"type": "elliptical", "x": 10.0, "y": 10.0},
            "bottomRight": {"type": "elliptical", "x": 10.0, "y": 10.0},
            "topLeft": {"type": "elliptical", "x": 10.0, "y": 10.0},
            "topRight": {"type": "elliptical", "x": 10.0, "y": 10.0},
            "type": "only",
          },

          "color": "\${cardColor}",
          "shape": "rectangle",
        },
      },
    );
  }

  static JsonContainer graficoMare(BoxDecoration boxDecoration) {
    return JsonContainer(
      foregroundDecoration: null,
      height: 300,
      child: JsonSyncLinearGraph(
        args: {
          "height": 300,
          "cartesianSeries": [
            {
              "type": "spline",
              "name": "Antonina",
              "xField": "xDate",
              "yField": "y",
              "dataSource": [
                {"xDate": 1735680000000, "y": 1},
                {"xDate": 1740998400000, "y": 2},
                {"xDate": 1746374400000, "y": 3},
              ],
            },
            {
              "type": "spline",
              "name": "Paranaguá",
              "xField": "xDate",
              "yField": "y",
              "dataSource": [
                {"xDate": 1735680000000, "y": 10},
                {"xDate": 1740998400000, "y": 20},
                {"xDate": 1746374400000, "y": 50},
              ],
            },
          ],
          "chartAxis": [
            {"type": "numeric"},
          ],
          "chartAxisX": {"type": "datetime", "intervalType": "days"},
        },
        cartesianSeries: [
          SplineSeries<ChartData, DateTime>(
            name: "Antonina",
            dataSource: [
              ChartData(xDate: DateTime(2025, 1, 1), y: 35, label: "Mar"),
              ChartData(xDate: DateTime(2025, 3, 1), y: 40, label: "Mar"),
              ChartData(xDate: DateTime(2025, 5, 1), y: 28, label: "Mar"),
            ],
            xValueMapper: (ChartData data, _) => data.xDate,
            yValueMapper: (ChartData data, _) => data.y,
            yAxisName: "mare",
          ),

          SplineSeries<ChartData, DateTime>(
            name: "Paranaguá",
            dataSource: [
              ChartData(xDate: DateTime(2025, 1, 1), y: 10, label: "Mar"),
              ChartData(xDate: DateTime(2025, 3, 1), y: 20, label: "Mar"),
              ChartData(xDate: DateTime(2025, 5, 1), y: 50, label: "Mar"),
            ],
            xValueMapper: (ChartData data, _) => data.xDate,
            yValueMapper: (ChartData data, _) => data.y,
            yAxisName: "mare",
          ),
        ],
        chartAxis: [NumericAxis(labelFormat: "{value}m", name: "mare")],
        chartAxisX: DateTimeAxis(
          intervalType: DateTimeIntervalType.days,
          dateFormat: DateFormat.MMM(),
        ),
        height: 100,
      ),
      padding: const EdgeInsets.all(10),
      decoration: boxDecoration,
      args: {},
    );
  }

  static JsonGestureDetector cardBoletim(
    String title,
    BuildContext context,
    BoxDecoration boxDecoration,
  ) {
    return JsonGestureDetector(
      onTap: () {
        print("Clicou no card: $title");
      },
      child: JsonContainer(
        foregroundDecoration: null,
        height: 80,

        padding: const EdgeInsets.all(10),
        decoration: boxDecoration,
        args: {
          "decoration": {
            "border": {
              "bottom": {
                "color": "\${primaryColor}",
                "strokeAlign": -1.0,
                "style": "solid",
                "width": 1.0,
              },
              "left": {
                "color": "\${primaryColor}",
                "strokeAlign": -1.0,
                "style": "solid",
                "width": 1.0,
              },
              "right": {
                "color": "\${primaryColor}",
                "strokeAlign": -1.0,
                "style": "solid",
                "width": 1.0,
              },
              "top": {
                "color": "\${primaryColor}",
                "strokeAlign": -1.0,
                "style": "solid",
                "width": 1.0,
              },
            },
            "borderRadius": {
              "bottomLeft": {"type": "elliptical", "x": 10.0, "y": 10.0},
              "bottomRight": {"type": "elliptical", "x": 10.0, "y": 10.0},
              "topLeft": {"type": "elliptical", "x": 10.0, "y": 10.0},
              "topRight": {"type": "elliptical", "x": 10.0, "y": 10.0},
              "type": "only",
            },

            "color": "\${cardColor}",
            "shape": "rectangle",
          },
        },
        child: JsonRow(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            JsonSizedBox(width: 1, height: 10),
            JsonSizedBox(
              width: 100,
              child: JsonText(
                args: {
                  "text": "$title",
                  "style": {
                    "color": "\${primaryColor}",
                    "fontWeight": "w500",
                    "fontSize": 16,
                  },
                },
                title,

                textAlign: TextAlign.center,
              ),
            ),

            JsonIcon(
              args: {"color": "\${onSurfaceColor}"},
              Icons.chevron_right,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  JsonContainer cardL(BoxDecoration boxDecoration) {
    return JsonContainer(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: boxDecoration,
      args: {
        "decoration": {
          "border": {
            "bottom": {
              "color": "\${primaryColor}",
              "strokeAlign": -1.0,
              "style": "solid",
              "width": 1.0,
            },
            "left": {
              "color": "\${primaryColor}",
              "strokeAlign": -1.0,
              "style": "solid",
              "width": 1.0,
            },
            "right": {
              "color": "\${primaryColor}",
              "strokeAlign": -1.0,
              "style": "solid",
              "width": 1.0,
            },
            "top": {
              "color": "\${primaryColor}",
              "strokeAlign": -1.0,
              "style": "solid",
              "width": 1.0,
            },
          },
          "borderRadius": {
            "bottomLeft": {"type": "elliptical", "x": 10.0, "y": 10.0},
            "bottomRight": {"type": "elliptical", "x": 10.0, "y": 10.0},
            "topLeft": {"type": "elliptical", "x": 10.0, "y": 10.0},
            "topRight": {"type": "elliptical", "x": 10.0, "y": 10.0},
            "type": "only",
          },

          "color": "\${cardColor}",
          "shape": "rectangle",
        },
      },
      foregroundDecoration: null,
      child: JsonColumn(
        children: [
          rain(),
          JsonSizedBox(height: 10),
          titles(),
          JsonSizedBox(height: 10),
          linearInfos("09:00", 0xf04cf, "0.7 mm", 1, boxDecoration),
          line(),
          linearInfos("11:00", 0xf04cf, "0.4 mm", 0.91, boxDecoration),
          line(),
          linearInfos("13:00", 0xf04cf, "0.2 mm", 0.28, boxDecoration),
          line(),
          linearInfos("09:00", 0xf04cf, "0.7 mm", 0.5, boxDecoration),
          line(),
          linearInfos("09:00", 0xf04cf, "0.7 mm", 1, boxDecoration),
          line(),
          linearInfos("09:00", 0xf04cf, "0.7 mm", 1, boxDecoration),
          line(),
          linearInfos("09:00", 0xf04cf, "0.7 mm", 1, boxDecoration),
          line(),
          linearInfos("09:00", 0xf04cf, "0.7 mm", 1, boxDecoration),
          line(),
          linearInfos("09:00", 0xf04cf, "0.7 mm", 1, boxDecoration),
        ],
      ),
    );
  }

  JsonRow rain() {
    return JsonRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        JsonText(
          "Previsão de Chuvas",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 23,
          ),
        ),
        JsonIcon(
          IconData(0xf04cf, fontFamily: "MaterialIcons"),
          size: 23,
          color: Color(0xFF4387f6),
        ),
      ],
    );
  }

  JsonRow titles() {
    return JsonRow(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        JsonExpanded(
          child: JsonColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JsonText(
                "Hora",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
        JsonExpanded(
          child: JsonColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JsonText(
                "Condição",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
        JsonExpanded(
          child: JsonColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JsonText(
                "Precipit.",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
        JsonExpanded(
          child: JsonColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JsonText(
                "Probabil.",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }

  JsonSizedBox linearInfos(
    String hora,
    int iconHex,
    String precipit,
    double porcentagem,
    BoxDecoration boxDecoration,
  ) {
    return JsonSizedBox(
      height: 40,
      child: JsonRow(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          JsonExpanded(
            child: JsonColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                JsonText(
                  hora,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          JsonExpanded(
            child: JsonColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                JsonIcon(
                  IconData(iconHex, fontFamily: "MaterialIcons"),
                  size: 23,
                  color: Color(0xFF4387f6),
                ),
              ],
            ),
          ),
          JsonExpanded(
            child: JsonColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [JsonText(precipit, style: TextStyle(fontSize: 18))],
            ),
          ),
          JsonExpanded(
            child: JsonColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [porcentagemWidget(porcentagem, boxDecoration)],
            ),
          ),
        ],
      ),
    );
  }

  JsonSizedBox porcentagemWidget(
    double porcentagem,
    BoxDecoration boxDecoration,
  ) {
    const larguraTotal = 30.0;
    final larguraCalculada = larguraTotal * porcentagem;
    final larguraAtual = larguraCalculada < 10.0 ? 10.0 : larguraCalculada;

    return JsonSizedBox(
      child: JsonRow(
        children: [
          JsonStack(
            children: [
              JsonContainer(
                width: larguraTotal,
                height: 20,
                decoration: boxDecoration,
                args: {
                  "decoration": {
                    "border": {
                      "bottom": {
                        "color": "\${primaryColor}",
                        "strokeAlign": -1.0,
                        "style": "solid",
                        "width": 1.0,
                      },
                      "left": {
                        "color": "\${primaryColor}",
                        "strokeAlign": -1.0,
                        "style": "solid",
                        "width": 1.0,
                      },
                      "right": {
                        "color": "\${primaryColor}",
                        "strokeAlign": -1.0,
                        "style": "solid",
                        "width": 1.0,
                      },
                      "top": {
                        "color": "\${primaryColor}",
                        "strokeAlign": -1.0,
                        "style": "solid",
                        "width": 1.0,
                      },
                    },
                    "borderRadius": {
                      "bottomLeft": {
                        "type": "elliptical",
                        "x": 10.0,
                        "y": 10.0,
                      },
                      "bottomRight": {
                        "type": "elliptical",
                        "x": 10.0,
                        "y": 10.0,
                      },
                      "topLeft": {"type": "elliptical", "x": 10.0, "y": 10.0},
                      "topRight": {"type": "elliptical", "x": 10.0, "y": 10.0},
                      "type": "only",
                    },

                    "color": "\${cardColor}",
                    "shape": "rectangle",
                  },
                },
                foregroundDecoration: null,
              ),
              JsonContainer(
                width: larguraAtual,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.horizontal(
                    left: const Radius.circular(20),
                    right: Radius.circular(porcentagem >= 0.9 ? 20 : 0),
                  ),
                ),
                foregroundDecoration: null,
              ),
            ],
          ),
          JsonSizedBox(width: 8),
          JsonText("${(porcentagem * 100).toStringAsFixed(0)}%"),
        ],
      ),
    );
  }

  JsonContainer line() {
    return JsonContainer(
      foregroundDecoration: null,
      width: double.infinity,
      height: 1,
      decoration: BoxDecoration(color: Colors.grey[300]),
    );
  }
}
