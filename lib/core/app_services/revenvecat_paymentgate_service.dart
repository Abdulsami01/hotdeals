import 'dart:io';

import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

mixin RevenueCat {
  static init() async {
    await Purchases.setDebugLogsEnabled(true);
    // for andriod
    // await Purchases.setup("goog_QJSNvNkxJfQORzmhmuvRGqXfOJA");
    // for ios
    // await Purchases.setup("appl_SkszQpQkuksSIOcogzPBNFlnrIt");
    if (Platform.isAndroid) {
      await Purchases.setup("goog_QJSNvNkxJfQORzmhmuvRGqXfOJA");
    } else if (Platform.isIOS) {
      await Purchases.setup("appl_QCYqdiMaqGEkbMKirzpAPLGulzB");
    }
  }
}
