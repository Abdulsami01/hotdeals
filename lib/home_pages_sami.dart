// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
// import 'package:hotdealsgemet/core/services/local_database.dart';
// import 'package:hotdealsgemet/view_and_controllers/all_deals/all_deals.dart';
// import 'package:hotdealsgemet/view_and_controllers/all_deals/all_deals_controller.dart';
// import 'package:hotdealsgemet/view_and_controllers/contact_us/contact_us_screen.dart';
// import 'package:hotdealsgemet/view_and_controllers/faq/faq_screen.dart';
// import 'package:hotdealsgemet/view_and_controllers/login_screen/login_screen.dart';
// import 'package:hotdealsgemet/view_and_controllers/payment_scuessfull_screen/payment_sucess_scree.dart';
// import 'package:hotdealsgemet/view_and_controllers/search_deal/search_screen.dart';
//
// class HomeScreen extends GetView<HomeScreenController> {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeScreenController>(
//         init: HomeScreenController(),
//         builder: (builder) {
//           return WillPopScope(
//             onWillPop: () async {
//               return false;
//             },
//             child: controller.isLoading
//                 ? Container()
//                 : Scaffold(
//               backgroundColor: Colors.white,
//               appBar: AppBar(
//                 elevation: 0,
//                 backgroundColor: AppColors.red,
//                 centerTitle: false,
//                 title: Text(
//                   "Hot Deals Hemet",
//                   style: textStyleWidget(
//                       fontWeight: FontWights.semiBold,
//                       color: Colors.white,
//                       fontSize: FontSize.h1),
//                 ),
//               ),
//               drawer: SideDrawer(context),
//               body: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Align(
//                         child: Container(
//                           width: 150,
//                           height: 150,
//                           padding: EdgeInsets.all(20),
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 fit: BoxFit.cover,
//                                 image: AssetImage(AppAssets.applogo),
//                               )),
//                         ),
//                       ),
//                       VerticalSpacing(value: 10),
//                       Center(
//                         child: Text(
//                             "The app where you don't have to cut out coupons in order to SAVE MONEY!.",
//                             textAlign: TextAlign.center,
//                             style: textStyleWidget(
//                                 fontSize: FontSize.smallText,
//                                 fontWeight: FontWights.light,
//                                 color: AppColors.secondary_text_color)),
//                       ),
//                       VerticalSpacing(value: 15),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Column(
//                               children: [
//                                 ButtonWidget("Find Deals",
//                                     Icons.add_to_queue_outlined, () {
//                                       Get.to(AllDeals());
//                                     }),
//                                 ButtonWidget("Contact Us", Icons.call,
//                                         () {
//                                       Get.to(ContactUs());
//                                     }),
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             child: Column(
//                               children: [
//                                 ButtonWidget("Search Deals", Icons.search,
//                                         () {
//                                       Get.to(SearchDeals());
//                                     }),
//                                 ButtonWidget("FAQ", Icons.question_answer,
//                                         () {
//                                       Get.to(() => FAQ());
//                                     }),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                       LastButton(
//                         "BUSINESS OWNERS",
//                         Icons.login,
//                             () {
//                           Get.to(() => BusinessOwners());
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }
//
// class ButtonWidget extends StatelessWidget {
//   String? name;
//   IconData? iconData;
//   late Callback buttonFuntion;
//
//   ButtonWidget(this.name, this.iconData, this.buttonFuntion);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: MaterialButton(
//           height: 90,
//           onPressed: buttonFuntion,
//           splashColor: Colors.orange,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Icon(iconData, color: AppColors.white),
//               //HorizontalSpacing(value: 10),
//               SizedBox(
//                 height: 10,
//               ),
//               Center(
//                 child: Text(
//                   name!,
//                   style: textStyleWidget(
//                       color: AppColors.white, letterSpacing: 1.2),
//                 ),
//               ),
//             ],
//           ),
//           materialTapTargetSize: MaterialTapTargetSize.padded,
//           animationDuration: Duration(seconds: 1),
//           minWidth: double.infinity,
//           color: AppColors.red.withOpacity(.9),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//           visualDensity: VisualDensity.adaptivePlatformDensity),
//     );
//   }
// }
//
// class LastButton extends StatelessWidget {
//   String? name;
//   IconData? iconData;
//   late Callback buttonFuntion;
//
//   LastButton(this.name, this.iconData, this.buttonFuntion);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: MaterialButton(
//           height: 50,
//           onPressed: buttonFuntion,
//           splashColor: Colors.orange,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Icon(iconData, color: AppColors.white),
//               HorizontalSpacing(value: 20),
//               Center(
//                 child: Text(
//                   name!,
//                   style: textStyleWidget(
//                       color: AppColors.white, letterSpacing: 1.2),
//                 ),
//               ),
//             ],
//           ),
//           materialTapTargetSize: MaterialTapTargetSize.padded,
//           animationDuration: Duration(seconds: 1),
//           minWidth: double.infinity,
//           color: AppColors.red.withOpacity(.9),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//           visualDensity: VisualDensity.adaptivePlatformDensity),
//     );
//   }
// }
