import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:hotdealsgemet/core/api_calls/auth.dart';
import 'package:hotdealsgemet/core/api_calls/firestore_gateway.dart';
import 'package:hotdealsgemet/core/app_services/revenvecat_paymentgate_service.dart';
import 'package:hotdealsgemet/core/services/local_database.dart';
import 'package:hotdealsgemet/view_and_controllers/all_deals/all_deals_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/business_account_create/business_accout_create_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/business_owners/business_owners_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/checkout_page/checkout_screen_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/contact_us/contact_us_screen_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/create_account/create_user_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/create_deal/create_deal_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/faq/faq_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/fav_deals/fav_deals_screen_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/forget_password/forget_password_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/home_screen/home_screen_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/login_screen/login_screen_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/search_deal/search_screen_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/settings/settings_screen_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/splash_screen/splash_screen_controller.dart';

initBindings() {



  LocalDatabase().storageInit();
  Get.put<LocalDatabase>(LocalDatabase());
  Get.put<FireStoreGateway>(FireStoreGateway());
  Get.put<AuthenticationService>(AuthenticationService());
  Get.find<LocalDatabase>().storageInit();
  Get.put<SplashScreenController>(SplashScreenController());
  Get.put<LoginController>(LoginController());
  Get.put<CreateUserController>(CreateUserController());
  Get.put<ForgetPasswordController>(ForgetPasswordController());
  Get.put<SettingsController>(SettingsController());
  Get.put<HomeScreenController>(HomeScreenController());
  Get.put(CreateDealController());
  Get.put<ContactUsController>(ContactUsController());
  Get.put<BusinessOnwersController>(BusinessOnwersController());
  Get.putAsync(() async => AllDealsController());
  Get.put<SearchDealController>(SearchDealController());
  Get.put<FAQController>(FAQController());
  Get.put<FavDealsController>(FavDealsController());
  Get.put<CheckoutController>(CheckoutController());
  Get.put(BusinessAccoutCreateController());
}
