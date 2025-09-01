import "package:flutter/material.dart";
import "package:flutter_echarts/flutter_echarts.dart";

class WindBarbsPage extends StatelessWidget {
  const WindBarbsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String option = '''
{
  xAxis: {
    type: 'time',
    min: Date.UTC(2023, 0, 1, 4, 40),
    max: Date.UTC(2023, 0, 1, 5, 40),
    boundaryGap: false,
    axisLine: {
      lineStyle: {
        color: '#666666'  // Cor mais suave para linhas do eixo
      }
    },
    axisTick: {
      lineStyle: {
        color: '#666666'
      }
    },
    axisLabel: {
      formatter: function (value) {
        const date = new Date(value);
        return date.getHours() + ':' + String(date.getMinutes()).padStart(2, '0');
      },
      textStyle: {
        fontSize: 12,
        color: '#333333'  // Cor mais profunda para texto
      }
    }
  },
  yAxis: {
    type: 'value',
    axisLine: {
      lineStyle: {
        color: '#666666'
      }
    },
    axisTick: {
      lineStyle: {
        color: '#666666'
      }
    },
    splitLine: {
      lineStyle: {
        color: '#eeeeee',  // Linhas horizontais mais sutis
        type: 'dashed'
      }
    },
    axisLabel: {
      textStyle: {
        fontSize: 12,
        color: '#333333'
      }
    }
  },
  dataZoom: [
    {
      type: 'inside',
      start: 0,
      end: 100,
      zoomLock: false
    },

  ],
    "tooltip": {
    "trigger": "item",
    "formatter": function(params) {
      return (
        "Hora: " + new Date(params.value[0]).toLocaleTimeString() + "<br>" +
        "Velocidade: " + params.value[1] + " nós<br>" +
        "Direção: " + params.value[2] + "°"
      );
    }
  },
  series: [{
    type: 'custom',
    renderItem: function (params, api) {
      const coord = api.coord([api.value(0), api.value(1)]);
      const speed = api.value(2);
      const angle = api.value(3);
      
      // Configurações visuais otimizadas
      const barbLength = 25;  // Tamanho ligeiramente maior
      const featherWidth = 1.5;  // Largura mais consistente
      
      if (speed === 0) {
        return {
          type: 'circle',
          shape: {
            cx: coord[0],
            cy: coord[1],
            r: 6
          },
          style: {
            fill: '#333333'  // Cor mais profunda para pontos
          }
        };
      }

      const components = [];
      const rad = (angle - 180) * Math.PI / 180;
      const dx = Math.cos(rad);
      const dy = Math.sin(rad);
      
      // Linha principal mais definida
      components.push({
        type: 'line',
        shape: { 
          x1: coord[0], 
          y1: coord[1], 
          x2: coord[0] + dx * barbLength, 
          y2: coord[1] + dy * barbLength 
        },
        style: { 
          stroke: '#333333', 
          lineWidth: featherWidth,
          shadowBlur: 0  // Remove sombra para aparência mais limpa
        }
      });

      let remainingSpeed = speed;
      let pos = 0;

      const addFeather = (isTriangle) => {
        const featherLength = isTriangle ? 12 : 9;  // Tamanhos ajustados
        const featherDx = Math.cos(rad + Math.PI / 2);
        const featherDy = Math.sin(rad + Math.PI / 2);
        const px = coord[0] + dx * (barbLength - pos);
        const py = coord[1] + dy * (barbLength - pos);

        if (isTriangle) {
          components.push({
            type: 'polygon',
            shape: {
              points: [[px, py], 
                      [px + featherDx * featherLength, py + featherDy * featherLength],
                      [px + dx * 5, py + dy * 5]]
            },
            style: { 
              fill: '#333333',
              stroke: '#333333'
            }
          });
        } else {
          components.push({
            type: 'line',
            shape: { 
              x1: px, 
              y1: py, 
              x2: px + featherDx * featherLength, 
              y2: py + featherDy * featherLength 
            },
            style: { 
              stroke: '#333333', 
              lineWidth: featherWidth,
              shadowBlur: 0
            }
          });
        }
        pos += 6;  // Espaçamento ajustado
      };

      while (remainingSpeed >= 50) {
        addFeather(true);
        remainingSpeed -= 50;
      }
      while (remainingSpeed >= 10) {
        addFeather(false);
        remainingSpeed -= 10;
      }
      if (remainingSpeed >= 5) {
        addFeather(false);
      }

      return {
        type: 'group',
        children: components
      };
    },
    encode: {
      x: 0,
      y: 1
    },
    data: [
      [Date.UTC(2023, 0, 1, 5, 0), 0, 0, 0],
      [Date.UTC(2023, 0, 1, 5, 10), 1, 5, 45],
      [Date.UTC(2023, 0, 1, 5, 20), 2, 10, 90],
      [Date.UTC(2023, 0, 1, 5, 30), 3, 55, 135]
    ]
  }]
}
''';
    return Scaffold(
      appBar: AppBar(title: const Text("Wind Barbs")),
      body: Center(
        child: SizedBox(height: 500, child: Echarts(option: option)),
      ),
    );
  }
}
