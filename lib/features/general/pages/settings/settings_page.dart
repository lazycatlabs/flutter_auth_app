import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late ActiveTheme _selectedTheme;

  late final List<DataHelper> _listLanguage;
  late DataHelper _selectedLanguage;
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInitialized) {
      return;
    }
    _listLanguage = [
      DataHelper(title: Strings.of(context)!.english, type: 'en'),
      DataHelper(title: Strings.of(context)!.bahasa, type: 'id'),
    ];
    final settings = context.read<SettingsCubit>().settings;
    _selectedTheme = settings.activeTheme;
    _selectedLanguage = settings.type == 'id'
        ? _listLanguage[1]
        : _listLanguage[0];
    _isInitialized = true;
  }

  @override
  Widget build(BuildContext context) => Parent(
    child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(Dimens.space16),
        child: Column(
          children: [
            DropDown<ActiveTheme>(
              key: const Key('dropdown_theme'),
              hint: Strings.of(context)!.chooseTheme,
              value: _selectedTheme,
              prefixIcon: Icon(
                Icons.light,
                color: ColorScheme.of(context).onSurfaceVariant,
              ),
              items: ActiveTheme.values
                  .map(
                    (data) => DropdownMenuItem(
                      value: data,
                      child: Text(
                        _getThemeName(data, context),
                        style: TextTheme.of(context).bodyMedium,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                /// Reload theme
                context.read<SettingsCubit>().updateTheme(
                  value ?? ActiveTheme.system,
                );
              },
            ),

            /// Language
            DropDown<DataHelper>(
              key: const Key('dropdown_language'),
              hint: Strings.of(context)!.chooseLanguage,
              value: _selectedLanguage,
              prefixIcon: Icon(
                Icons.language_outlined,
                color: ColorScheme.of(context).onSurfaceVariant,
              ),
              items: _listLanguage
                  .map(
                    (data) => DropdownMenuItem(
                      value: data,
                      child: Text(
                        data.title ?? '-',
                        style: TextTheme.of(context).bodyMedium,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (DataHelper? value) {
                _selectedLanguage = value ?? _listLanguage[0];

                /// Reload theme
                if (!mounted) {
                  return;
                }
                context.read<SettingsCubit>().updateLanguage(
                  value?.type ?? 'en',
                );
              },
            ),
          ],
        ),
      ),
    ),
  );

  String _getThemeName(ActiveTheme activeTheme, BuildContext context) {
    if (activeTheme == ActiveTheme.system) {
      return Strings.of(context)!.themeSystem;
    } else if (activeTheme == ActiveTheme.dark) {
      return Strings.of(context)!.themeDark;
    } else {
      return Strings.of(context)!.themeLight;
    }
  }
}
