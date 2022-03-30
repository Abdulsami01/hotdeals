import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class ContactUsController extends GetxController
{


  testingPurpose()
  async {
    Offerings offerings = await Purchases.getOfferings();

    // List<Package> ? packages = offerings.getOffering("test_01")?.availablePackages;
    List<Package> ? packages = offerings
        .getOffering("live_s65")
        ?.availablePackages;

    Package p = packages![0];

    print(p.product.price);

    PurchaserInfo purchaserInfo = await Purchases.purchasePackage(p);
  }
}