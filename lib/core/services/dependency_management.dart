

  import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:hotdealsgemet/core/api_calls/auth.dart';
import 'package:hotdealsgemet/core/api_calls/firestore_gateway.dart';
import 'package:hotdealsgemet/core/services/local_database.dart';
import 'package:hotdealsgemet/view_and_controllers/all_deals/all_deals_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/business_owners/business_owners_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/contact_us/contact_us_screen_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/create_account/create_user_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/create_deal/create_deal_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/forget_password/forget_password_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/home_screen/home_screen_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/login_screen/login_screen_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/splash_screen/splash_screen_controller.dart';

initBindings()
  {

    LocalDatabase().storageInit();
    Get.put<LocalDatabase>(LocalDatabase());
    Get.put<FireStoreGateway>(FireStoreGateway());


    Get.put<AuthenticationService>(AuthenticationService());

    Get.find<LocalDatabase>().storageInit();;
    Get.put<SplashScreenController>(SplashScreenController());

       Get.put<LoginController>(LoginController());
     Get.put<CreateUserController>(CreateUserController());
    Get.put<ForgetPasswordController>(ForgetPasswordController());
    Get.put<HomeScreenController>(HomeScreenController());
    Get.put<CreateDealController>(CreateDealController());
    Get.put<ContactUsController>(ContactUsController());
    Get.put<BusinessOnwersController>(BusinessOnwersController());
    Get.put<AllDealsController>(AllDealsController());







  }