import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hotdealsgemet/core/app_services/revenvecat_paymentgate_service.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'core/services/dependency_management.dart';
import 'view_and_controllers/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RevenueCat.init();
  await GetStorage.init();

//  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  //  OneSignal.shared.setAppId("6eff13ff-dfbb-4557-8ccf-689da3593fbc");

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
//   OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
//     print("Accepted permission: $accepted");
//   });
//
//   final status = await OneSignal.shared.getDeviceState().then((value) {
//     print("(***************");
//     print(value!.userId);
//     print("(***************");
//
//   });
//   final String? osUserID = status?.userId;
//
//   print("(***************  $osUserID");
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: initBindings(),
      title: 'Hot Deals Hemet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        }),
      ),
      home: SplashScreenn(),
    );
  }

  @override
  void initState() {}
}
