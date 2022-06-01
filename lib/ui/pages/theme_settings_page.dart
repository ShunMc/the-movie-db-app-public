import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:the_movie_db_app/hook/use_l10n.dart';
import 'package:the_movie_db_app/ui/theme.dart';

class ThemeSettingsPage extends HookConsumerWidget {
  const ThemeSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final selectedState = useState(ref.read(themeModeProvider));
    return Scaffold(
      appBar: AppBar(title: Text(l10n.theme)),
      body: SettingsList(
        sections: [
          SettingsSection(
            tiles: ThemeMode.values
                .map(
                  (e) => SettingsTile(
                    title: Text(e.toString()),
                    trailing: selectedState.value == e
                        ? const Icon(Icons.check)
                        : const Icon(null),
                    onPressed: (_) {
                      selectedState.value = e;
                      ref.read(themeModeProvider.state).state = e;
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
