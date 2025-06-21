import 'dart:io';

class AdHelper {
  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-2742296332020210/4495775016";
    } else if (Platform.isIOS) {
      return "ca-app-pub-2742296332020210/4495775016";
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-2742296332020210/9162003673";
    } else if (Platform.isIOS) {
      return "ca-app-pub-2742296332020210/9162003673";
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get unityAdUnitId {
    if (Platform.isAndroid) {
      return "4899303";
    } else if (Platform.isIOS) {
      return "4899302";
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
