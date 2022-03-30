import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:hotdealsgemet/core/api_calls/firebase_storage.dart';
import 'package:hotdealsgemet/core/api_calls/firestore_gateway.dart';
import 'package:hotdealsgemet/core/app_services/internet_check.dart';
import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
import 'package:hotdealsgemet/view_and_controllers/home_screen/home_screen.dart';
import 'package:hotdealsgemet/view_and_controllers/payment_scuessfull_screen/payment_sucess_scree.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class CheckoutController extends GetxController with InternetService {
  bool isLoading = false;

  updateLoding(bool value) {
    isLoading = value;
    update();
  }

  payNow(dealData) async {
    updateLoding(true);

    if (await checkInternet()) {
      Offerings offerings = await Purchases.getOfferings();

      // List<Package> ? packages = offerings.getOffering("test_01")?.availablePackages;
      List<Package>? packages =
          offerings.getOffering("live_s65")?.availablePackages;

      Package p = packages![0];

      print(p.product.price);

      //
      //   print(p.product);
      //purchasing
      try {
        PurchaserInfo purchaserInfo = await Purchases.purchasePackage(p);

        print("____------------________-----_______-___----___--_-_-_-_");
        await uploadToFireBase(dealData);
        updateLoding(false);
        Get.offAll(PaymentSucessScreen());
      } on PlatformException catch (e) {
        updateLoding(false);
        var errorCode = PurchasesErrorHelper.getErrorCode(e);
        print("---------");
        print(errorCode);
      }
    } else {
      updateLoding(false);
      print("check internet connection");
    }
  }

  uploadToFireBase(dealData) async {
    File file = File(dealData["imageLink"]);
    String dealImage =
        await FirebaseStorageService.postFile(file, "DealImages/");
    dealData["imageLink"] = dealImage;
    dealData["paidData"] = DateTime.now();
    dealData["paidType"] = "oneTime";
    dealData["expireData"] = DateTime.now().add(Duration(days: 30));
    await Get.find<FireStoreGateway>().createDeal(dealData);
  }
}
