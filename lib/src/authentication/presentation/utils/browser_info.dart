import 'package:client_information/client_information.dart';
import 'package:flutter/cupertino.dart';

class BrowserInfo {
  Future<Map<String, dynamic>?> deviceInfo() async {
    final deviceDataList = await _getDeviceData();
    if (deviceDataList.isEmpty) return null;

    final String systemLocaleInfo = _getLocaleInfo();
    if (systemLocaleInfo.isEmpty) return null;

    return {
      'systemLocale': systemLocaleInfo,
      'deviceUid': deviceDataList[0],
      'deviceModel': 'MantisAdminPortal-${deviceDataList[1]}',
    };
  }

  Future<List<String?>> _getDeviceData() async {
    try {
      ClientInformation info = await ClientInformation.fetch();

      // debugPrint(
      //   '--------------id : ${info.deviceId}',
      // );
      // debugPrint('--------------softwareName: ${info.softwareName}');

      if (info.deviceId.isEmpty || info.softwareName.isEmpty) {
        return [];
      }

      return [info.deviceId, info.softwareName];
    } catch (error) {
      debugPrint('Could not retrieve device details of user : $error');
      return [];
    }
  }

  String _getLocaleInfo() {
    try {
      final systemLocale = WidgetsBinding.instance.platformDispatcher.locale;

      String systemLanguageCode = systemLocale.languageCode;
// You can also access the country code (optional):
      String? systemCountryCode = systemLocale.countryCode;

// Use the system language code for localization or other purposes
      return '${systemLanguageCode}_$systemCountryCode';
    } catch (error) {
      debugPrint('could not retrieve system locale information');
      return '';
    }
  }
}
