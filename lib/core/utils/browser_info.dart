import 'dart:html' as html;

import 'package:flutter/cupertino.dart';
import 'package:get_ip_address/get_ip_address.dart';

Future<Map<String, dynamic>?> deviceInfo() async {
  final userAgent = html.window.navigator.userAgent;

  final ipAddress = await getIP();
  if (ipAddress.isEmpty) return null;

  final String systemLocaleInfo = getLocaleInfo();
  if (systemLocaleInfo.isEmpty) return null;

  return {
    'systemLocale': systemLocaleInfo,
    'deviceUid': ipAddress,
    'deviceModel': 'MantisAdminPortal-$userAgent',
  };
}

Future<String> getIP() async {
  try {
    final ipAddress = IpAddress(type: RequestType.json);

    final data = await ipAddress.getIpAddress() as Map<String, dynamic>;
    return data['ip'] == null ? '' : data['ip'].toString();
  } catch (error) {
    debugPrint('Could not retrive ip address of user : $error');
    return '';
  }
}

String getLocaleInfo() {
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
