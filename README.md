# SimportApp 🚀

Uma aplicação Flutter moderna para visualização e desenvolvimento de widgets dinâmicos com suporte a JSON.

## 📋 Sobre o Projeto

O SimportApp é uma ferramenta de desenvolvimento que combina:
- **Widgetbook**: Para documentação e visualização de componentes
- **JSON Dinâmico**: Para criação de widgets via JSON
- **Tema Consistente**: Sistema de temas unificado
- **Preview em Tempo Real**: Visualização instantânea de mudanças

## ✨ Funcionalidades Principais

### 🎨 Widgetbook Integrado
- Documentação interativa de componentes
- Visualização em diferentes dispositivos (iPhone 13, iPhone 12)
- Temas light e dark
- Inspector e ferramentas de desenvolvimento

### 📝 Editor JSON Dinâmico
- Editor de código com syntax highlighting
- Preview em tempo real
- Suporte a widgets dinâmicos via JSON
- Sugestões de código inteligentes

### 📊 Componentes de Gráficos
- **CircularChart**: Gráficos circulares com tema
- **LinearChart**: Gráficos lineares dinâmicos
- **Simport Components**: Componentes especializados

### 🎯 Sistema de Temas
- Temas light e dark
- Cores primárias consistentes
- Integração com Material Design 3
- Responsividade automática

## 🚀 Como Executar

### Pré-requisitos
- Flutter SDK (versão 3.8.1 ou superior)
- Dart SDK
- Android Studio / VS Code

### Instalação
```bash
# Clone o repositório
git clone https://github.com/hoffera/SimportApp.git

# Entre no diretório
cd SimportApp

# Instale as dependências
flutter pub get

# Execute o build runner
flutter packages pub run build_runner build --delete-conflicting-outputs

# Execute o aplicativo
flutter run
```

### Executar Widgetbook
```bash
# Para executar apenas o Widgetbook
flutter run -t lib/widgetbook/main/widgetbook.dart
```

## 📱 Uso

### Widgetbook
1. Abra o aplicativo
2. Navegue pelo painel lateral
3. Explore os componentes disponíveis
4. Teste diferentes temas e dispositivos

### Editor JSON
1. Clique no botão de código (</>) no header
2. Cole ou escreva JSON no editor
3. Clique no botão play (▶️) para visualizar
4. Use o botão de lâmpada (💡) para sugestões

### Exemplo de JSON
```json
{
  "type": "circular_chart",
  "height": 300,
  "angleDegrees": 45,
  "title": "45°",
  "subtitle": "Direção",
  "arrowOutward": false
}
```

## 🛠️ Tecnologias Utilizadas

- **Flutter**: Framework principal
- **GetX**: Gerenciamento de estado
- **Widgetbook**: Documentação de componentes
- **JSON Dynamic Widget**: Widgets dinâmicos
- **Syncfusion Charts**: Gráficos avançados
- **Device Frame**: Preview de dispositivos

## 📁 Estrutura do Projeto

```
lib/
├── app/
│   ├── components/          # Componentes reutilizáveis
│   │   ├── sync/           # Gráficos sincronizados
│   │   ├── simport/        # Componentes Simport
│   │   └── ...
│   ├── pages/              # Páginas da aplicação
│   ├── theme/              # Sistema de temas
│   └── ...
├── widgetbook/             # Documentação de componentes
├── config/                 # Configurações
└── main.dart              # Ponto de entrada
```

## 🎨 Componentes Principais

### CircularChart
- Gráficos circulares com tema
- Suporte a ângulos dinâmicos
- Bordas com cores do tema
- Labels direcionais

### LinearChart
- Gráficos lineares dinâmicos
- Múltiplos tipos de séries
- Eixos configuráveis
- Plotbands e marcadores

### Widgets Dinâmicos
- Criação via JSON
- Preview em tempo real
- Sistema de temas integrado
- Validação automática

## 🔧 Desenvolvimento

### Adicionar Novo Componente
1. Crie o widget em `lib/app/components/`
2. Crie o builder seguindo o padrão
3. Registre no `CustomWidgetRegistrar`
4. Execute o build runner
5. Adicione ao Widgetbook

### Build Runner
```bash
# Gerar arquivos necessários
flutter packages pub run build_runner build --delete-conflicting-outputs

# Watch mode para desenvolvimento
flutter packages pub run build_runner watch
```

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 🤝 Contribuição

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📞 Contato

- **Desenvolvedor**: Felipe Hoffmeister
- **GitHub**: [@hoffera](https://github.com/hoffera)
- **Email**: [seu-email@exemplo.com]

## 🙏 Agradecimentos

- Flutter Team pelo framework incrível
- Widgetbook pela documentação de componentes
- Syncfusion pelos gráficos avançados
- Comunidade Flutter pela inspiração

---

⭐ Se este projeto te ajudou, considere dar uma estrela no repositório!
