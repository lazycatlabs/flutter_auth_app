import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/data/data.dart';
import 'package:flutter_auth_app/di/di.dart';
import 'package:flutter_auth_app/presentation/presentation.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///*********************************************
/// Created by ukietux on 25/08/20 with ♥
/// (>’_’)> email : hey.mudassir@gmail.com
/// github : https://www.github.com/Lzyct <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late List<String> _themeList;

  late List<DataHelper> _languageList;

  String _selectedTheme = "";
  late DataHelper _selectedLanguage;
  late SettingsCubit _settingsCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settingsCubit = BlocProvider.of(context);
    _themeList = [
      Strings.of(context)!.themeLight,
      Strings.of(context)!.themeDark,
      Strings.of(context)!.themeSystem,
    ];

    _languageList = [
      DataHelper(title: Constants.get.english, type: "en"),
      DataHelper(title: Constants.get.bahasa, type: "id"),
    ];

    /// Set selected by sharedPreferences
    if (sl<PrefManager>().theme == ActiveTheme.system.description) {
      _selectedTheme = Strings.of(context)!.themeSystem;
    } else if (sl<PrefManager>().theme == ActiveTheme.light.description) {
      _selectedTheme = Strings.of(context)!.themeLight;
    } else {
      _selectedTheme = Strings?.of(context)!.themeDark;
    }

    /// Filter if selected locale is EN
    _selectedLanguage =
        sl<PrefManager>().locale == "en" ? _languageList[0] : _languageList[1];
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimens.space16),
          child: Column(
            children: [
              DropDown(
                key: const Key("dropdown_theme"),
                hint: Strings.of(context)!.chooseTheme,
                value: _selectedTheme,
                prefixIcon: const Icon(Icons.light),
                items: _themeList
                    .map(
                      (data) => DropdownMenuItem(
                        value: data,
                        child: Text(
                          data,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    final _theme = value as String;
                    ActiveTheme activeTheme;

                    if (_theme == Strings.of(context)!.themeLight) {
                      activeTheme = ActiveTheme.light;
                    } else if (_theme == Strings.of(context)!.themeDark) {
                      activeTheme = ActiveTheme.dark;
                    } else {
                      activeTheme = ActiveTheme.system;
                    }

                    /// Update theme status in sharedPref

                    sl<PrefManager>().theme = describeEnum(activeTheme);

                    /// Reload theme
                    _settingsCubit.reloadWidget();
                  }
                },
              ),

              /// Language
              DropDown(
                key: const Key("dropdown_language"),
                hint: Strings.of(context)!.chooseLanguage,
                value: _selectedLanguage,
                prefixIcon: const Icon(Icons.language_outlined),
                items: _languageList
                    .map(
                      (data) => DropdownMenuItem(
                        value: data,
                        child: Text(
                          data.title ?? "-",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) async {
                  if (value != null) {
                    _selectedLanguage = value as DataHelper;

                    /// Update locale code
                    sl<PrefManager>().locale = _selectedLanguage.type;

                    /// Reload theme
                    if (!mounted) return;
                    _settingsCubit.reloadWidget();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
