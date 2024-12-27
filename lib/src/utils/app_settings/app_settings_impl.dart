import 'package:app_settings/app_settings.dart';

abstract interface class IFLOpenAppSettings {
  Future<void> openAppSettings({AppSettingsType type = AppSettingsType.settings, bool asAnotherTask = false});

  Future<void> openAppSettingsPanel({required AppSettingsPanelType type});
}

class FLOpenAppSettings implements IFLOpenAppSettings {
  @override
  Future<void> openAppSettings({AppSettingsType type = AppSettingsType.settings, bool asAnotherTask = false}) async {
    final settingsType = AppSettingsType.values[type.index];
    await AppSettings.openAppSettings(type: settingsType, asAnotherTask: asAnotherTask);
  }

  @override
  Future<void> openAppSettingsPanel({required AppSettingsPanelType type}) async {
    final panelType = AppSettingsPanelType.values[type.index];
    await AppSettings.openAppSettingsPanel(panelType);
  }
}
