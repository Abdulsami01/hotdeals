import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

mixin RevenueCat
{


   static init()
  async {
      await Purchases.setDebugLogsEnabled(true);
      await Purchases.setup("goog_QJSNvNkxJfQORzmhmuvRGqXfOJA");
   }






}