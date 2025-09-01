import "package:flutter_highlight/themes/atom-one-light.dart";
import "package:heroicons/heroicons.dart";
import "package:json_app/app/enum/enum.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:mix/mix.dart";
import "package:re_editor/re_editor.dart";
import "package:re_highlight/languages/json.dart";

class CodeEditorWidget extends StatefulWidget {
  final CodeLineEditingController controller;
  final Function()? onRun;
  final Function()? onClear;
  final Function()? onFormat;
  const CodeEditorWidget({
    super.key,
    required this.controller,
    this.onRun,
    this.onClear,
    this.onFormat,
  });

  @override
  State<CodeEditorWidget> createState() => _CodeEditorWidgetState();
}

class _CodeEditorWidgetState extends State<CodeEditorWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Box(
      style: Style(
        $box.color.white(),
        $box.borderRadius.all(20),
        $box.padding.all(20),
        $box.color.white(),
        $box.border.all(color: AppColors.primary),
        $box.elevation(1),
      ),
      child: _codeEditor(),
    );
  }

  Widget _codeEditor() {
    return Stack(
      children: [
        CodeEditor(
          style: CodeEditorStyle(
            codeTheme: CodeHighlightTheme(
              languages: {"json": CodeHighlightThemeMode(mode: langJson)},
              theme: atomOneLightTheme,
            ),

            selectionColor: AppColors.primary.withValues(alpha: 0.3),

            cursorColor: AppColors.primary,
            cursorWidth: 2.0,
          ),
          controller: widget.controller,
          wordWrap: true,
          autocompleteSymbols: true,
          autofocus: true,
          indicatorBuilder:
              (context, editingController, chunkController, notifier) {
                return Row(
                  children: [
                    DefaultCodeLineNumber(
                      controller: editingController,
                      notifier: notifier,
                    ),
                    DefaultCodeChunkIndicator(
                      width: 20,
                      controller: chunkController,
                      notifier: notifier,
                    ),
                  ],
                );
              },
          chunkAnalyzer: DefaultCodeChunkAnalyzer(),
          sperator: Container(width: 1, color: AppColors.primary),
        ),
        if (widget.onRun != null)
          Positioned(
            top: 0,
            right: 30,
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: widget.onClear,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const HeroIcon(
                        HeroIcons.trash,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "Limpar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: widget.onFormat,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const HeroIcon(
                        HeroIcons.bars3CenterLeft,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "Formatar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: widget.onRun,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const HeroIcon(
                        HeroIcons.play,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      const Text("Run", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
