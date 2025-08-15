# Solução de Problemas - JSON Dynamic Widget

## Problemas Comuns e Soluções

### 1. **Erro de Parsing JSON**

**Problema:** O JSON não está sendo parseado corretamente.

**Causas possíveis:**
- JSON malformado (vírgulas extras, colchetes não fechados)
- Formato incorreto (não é um array ou objeto válido)
- Caracteres especiais não escapados

**Soluções:**
```json
// ✅ Formato correto - Array de objetos
[
  {
    "type": "scaffold",
    "args": {
      "body": {
        "type": "text",
        "args": {
          "text": "Exemplo"
        }
      }
    }
  }
]

// ✅ Formato correto - Objeto único
{
  "type": "scaffold",
  "args": {
    "body": {
      "type": "text",
      "args": {
        "text": "Exemplo"
      }
    }
  }
}

// ❌ Formato incorreto - JSON malformado
{
  "type": "scaffold",
  "args": {
    "body": {
      "type": "text",
      "args": {
        "text": "Exemplo"
      }
    }
  }, // vírgula extra
}
```

### 2. **Widgets não Registrados**

**Problema:** Erro "Unknown widget type" ou widget não renderiza.

**Causas possíveis:**
- Widget customizado não registrado no `CustomWidgetRegistrar`
- Nome do tipo incorreto no JSON
- Dependências não importadas

**Soluções:**
1. Verifique se o widget está registrado em `lib/app/components/custom_widget_registrar.dart`
2. Use apenas tipos de widget suportados:
   - `scaffold`
   - `text`
   - `container`
   - `column`
   - `row`
   - `padding`
   - `center`
   - `sized_box`
   - `chart_widget`
   - `title_widget`
   - `commom_card`
   - `curved_nav`
   - `page_index`
   - `skeleton_loading`

### 3. **Erro de Argumentos**

**Problema:** Widget não aceita os argumentos fornecidos.

**Soluções:**
```json
// ✅ Argumentos corretos para text
{
  "type": "text",
  "args": {
    "text": "Texto aqui"
  }
}

// ❌ Argumentos incorretos
{
  "type": "text",
  "args": {
    "content": "Texto aqui" // propriedade incorreta
  }
}
```

### 4. **Problemas com Cores**

**Problema:** Cores não são aplicadas corretamente.

**Soluções:**
```json
// ✅ Formato correto para cores
{
  "type": "container",
  "args": {
    "color": "#FF0000" // formato hexadecimal
  }
}

// ✅ Outros formatos válidos
{
  "type": "container",
  "args": {
    "color": "#FF0000FF", // com alpha
    "backgroundColor": "#00FF00"
  }
}
```

### 5. **Problemas com Funções**

**Problema:** Funções como `navigatePage` não funcionam.

**Soluções:**
```json
// ✅ Função corretamente formatada
{
  "type": "text_button",
  "args": {
    "onPressed": "${navigatePage('6')}",
    "child": {
      "type": "text",
      "args": {
        "text": "Navegar"
      }
    }
  }
}
```

### 6. **Problemas com Charts**

**Problema:** Gráficos não renderizam corretamente.

**Soluções:**
```json
{
  "type": "chart_widget",
  "args": {
    "title": "Título do Gráfico",
    "subtitle": "Subtítulo",
    "chart": {
      "type": "sync_linear_graph",
      "args": {
        "cartesianSeries": [
          {
            "type": "spline",
            "name": "Série 1",
            "xField": "x",
            "yField": "y",
            "dataSource": [
              {"x": "2024-01-01", "y": 10},
              {"x": "2024-01-02", "y": 15}
            ]
          }
        ],
        "chartAxis": [
          {
            "type": "numeric",
            "title": "Valores"
          }
        ]
      }
    }
  }
}
```

## Como Usar o Editor JSON

1. **Abra o Widgetbook** e clique no ícone de código (</>) para acessar o editor
2. **Cole seu JSON** no editor à esquerda
3. **Clique no botão ▶️** para renderizar
4. **Verifique o preview** à direita
5. **Use o botão 🗑️** para limpar o editor

## Dicas de Debugging

1. **Verifique o console** para mensagens de erro detalhadas
2. **Teste com JSON simples** primeiro
3. **Valide seu JSON** em um validador online
4. **Use o exemplo fornecido** como base

## Exemplo de JSON Válido Completo

```json
[
  {
    "type": "scaffold",
    "args": {
      "backgroundColor": "#fff0faff",
      "body": {
        "type": "center",
        "args": {
          "child": {
            "type": "column",
            "args": {
              "mainAxisAlignment": "center",
              "children": [
                {
                  "type": "text",
                  "args": {
                    "text": "Exemplo de JSON válido"
                  }
                },
                {
                  "type": "sized_box",
                  "args": {
                    "height": 20
                  }
                },
                {
                  "type": "container",
                  "args": {
                    "height": 100,
                    "width": 100,
                    "color": "#FF0000"
                  }
                }
              ]
            }
          }
        }
      }
    }
  }
]
```













