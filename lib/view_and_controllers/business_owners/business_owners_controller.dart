import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:hotdealsgemet/core/api_calls/firestore_gateway.dart';
import 'package:hotdealsgemet/core/app_services/internet_check.dart';
import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
import 'package:hotdealsgemet/core/services/local_database.dart';
import 'package:hotdealsgemet/view_and_controllers/business_account_create/business_accout_create.dart';
import 'package:hotdealsgemet/view_and_controllers/create_deal/create_deal_screen.dart';

class BusinessOnwersController extends GetxController with InternetService {
  bool isAccountCreated = false;

  bool isLoading = false;

  BusinessOnwersController() {
    init();
  }

  init() async {
    loadingController(true);
    await checkAccount();
    loadingController(false);
    update();
  }

  checkUserHadAccount() async {
    await checkAccount();
    if (isAccountCreated)
      Get.to(CreateDeal());
    else
      Get.to(BusinessAccountCreate())!.then((value) async{
        await checkAccount();
      });
    update();
  }

   checkAccount() async {
    loadingController(true);
    DocumentSnapshot documentSnapshot = await Get.find<FireStoreGateway>()
        .checkUserBusinessAccount(Get.find<LocalDatabase>().getToken);
    loadingController(false);
    if (documentSnapshot.exists)
      isAccountCreated = true;
    else
      isAccountCreated = false;

    update();
  }

  void loadingController(bool value) {
    isLoading = value;
    update();
  }
}
