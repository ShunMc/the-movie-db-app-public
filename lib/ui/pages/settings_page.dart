import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:the_movie_db_app/hook/use_l10n.dart';
import 'package:the_movie_db_app/ui/theme.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text(l10n.common),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.colorize),
                title: Text(l10n.theme),
                value: Text(ref.watch(themeModeProvider).toString()),
                onPressed: (context) => context.push('/theme'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
