import "package:flutter/material.dart";
import "package:json_app/app/components/cards/card_widget/card_widget.dart";
import "package:widgetbook_annotation/widgetbook_annotation.dart";
import "package:widgetbook/widgetbook.dart";

@UseCase(name: "default", type: CardWidget)
Widget buildCardWidgetUseCase(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey[200],
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CardWidget(
          header: CardHeader(
            title: context.knobs.string(
              label: 'title',
              initialValue: 'Card Título',
            ),
            subtitle: context.knobs.stringOrNull(
              label: 'subtitle',
              initialValue: 'Descrição do card',
            ),
            icon: context.knobs.boolean(label: 'showIcon', initialValue: true)
                ? Icons.star
                : null,
            actions:
                context.knobs.boolean(label: 'showActions', initialValue: true)
                ? [
                    IconButton(
                      onPressed: () => print('Edit button pressed'),
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () => print('Delete button pressed'),
                      icon: const Icon(Icons.delete),
                    ),
                  ]
                : null,
          ),
          children: [
            Container(
              height: context.knobs.double.slider(
                label: 'contentHeight',
                initialValue: 100,
                min: 50,
                max: 200,
                divisions: 15,
              ),
              width: double.infinity,
              color: context.knobs.color(
                label: 'contentColor',
                initialValue: Colors.blue[100]!,
              ),
              child: Center(
                child: Text(
                  'Conteúdo do Card',
                  style: TextStyle(
                    fontSize: context.knobs.double.slider(
                      label: 'fontSize',
                      initialValue: 16,
                      min: 12,
                      max: 24,
                      divisions: 12,
                    ),
                    fontWeight:
                        context.knobs.boolean(
                          label: 'bold',
                          initialValue: false,
                        )
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => print('Button pressed'),
              child: Text(
                context.knobs.string(label: 'buttonText', initialValue: 'Ação'),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

@UseCase(name: "minimal", type: CardWidget)
Widget buildCardWidgetMinimalUseCase(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey[200],
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CardWidget(
          header: CardHeader(
            title: context.knobs.string(
              label: 'title',
              initialValue: 'Card Simples',
            ),
          ),
          children: [
            Text(
              'Card com apenas título e conteúdo básico',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    ),
  );
}

@UseCase(name: "with_actions", type: CardWidget)
Widget buildCardWidgetWithActionsUseCase(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey[200],
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CardWidget(
          header: CardHeader(
            title: context.knobs.string(
              label: 'title',
              initialValue: 'Card com Ações',
            ),
            subtitle: context.knobs.stringOrNull(
              label: 'subtitle',
              initialValue: 'Card com múltiplas ações',
            ),
            icon: Icons.settings,
            actions: [
              IconButton(
                onPressed: () => print('Share button pressed'),
                icon: const Icon(Icons.share),
              ),
              IconButton(
                onPressed: () => print('Favorite button pressed'),
                icon: const Icon(Icons.favorite_border),
              ),
              IconButton(
                onPressed: () => print('More options button pressed'),
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Conteúdo detalhado do card',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Este card demonstra como múltiplas ações podem ser organizadas no header.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => print('Primary action'),
                          child: const Text('Ação Principal'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => print('Secondary action'),
                          child: const Text('Ação Secundária'),
                        ),
                      ),
                    ],
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

@UseCase(name: "complex_content", type: CardWidget)
Widget buildCardWidgetComplexContentUseCase(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey[200],
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CardWidget(
          header: CardHeader(
            title: context.knobs.string(
              label: 'title',
              initialValue: 'Card Complexo',
            ),
            subtitle: context.knobs.stringOrNull(
              label: 'subtitle',
              initialValue: 'Com conteúdo rico e interativo',
            ),
            icon: Icons.analytics,
            actions: [
              IconButton(
                onPressed: () => print('Refresh button pressed'),
                icon: const Icon(Icons.refresh),
              ),
            ],
          ),
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.trending_up,
                        color: context.knobs.color(
                          label: 'trendColor',
                          initialValue: Colors.green,
                        ),
                        size: context.knobs.double.slider(
                          label: 'iconSize',
                          initialValue: 24,
                          min: 16,
                          max: 32,
                          divisions: 16,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Métrica Principal',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              context.knobs.string(
                                label: 'metricValue',
                                initialValue: 'R\$ 1.234,56',
                              ),
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: context.knobs.double.slider(
                      label: 'progress',
                      initialValue: 0.7,
                      min: 0.0,
                      max: 1.0,
                      divisions: 20,
                    ),
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      context.knobs.color(
                        label: 'progressColor',
                        initialValue: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Status:',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: context.knobs.color(
                            label: 'statusColor',
                            initialValue: Colors.green[100]!,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          context.knobs.string(
                            label: 'statusText',
                            initialValue: 'Ativo',
                          ),
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
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
