import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:hotdealsgemet/core/api_calls/firestore_gateway.dart';
import 'package:hotdealsgemet/core/app_rss/app_strings.dart';
import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
import 'package:hotdealsgemet/core/services/local_database.dart';
import 'package:hotdealsgemet/view_and_controllers/business_account_create/business_accout_create.dart';
import 'package:hotdealsgemet/view_and_controllers/contact_us/contact_us_screen.dart';

import 'package:hotdealsgemet/view_and_controllers/create_deal/create_deal_screen.dart';
import 'package:hotdealsgemet/view_and_controllers/pricing_info/pricing_info.dart';
import 'package:video_player/video_player.dart';

class BusinessOwners extends StatefulWidget {
  const BusinessOwners({Key? key}) : super(key: key);

  @override
  _BusinessOwnersState createState() => _BusinessOwnersState();
}

class _BusinessOwnersState extends State<BusinessOwners> {
  bool isAccountCreated = false;

  bool isLoading = false;
  late VideoPlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPrepartions();
    controller = VideoPlayerController.network(
        "https://firebasestorage.googleapis.com/v0/b/hot-deals-dev.appspot.com/o/WhatsApp%20Video%202022-03-07%20at%209.36.43%20PM.mp4?alt=media&token=d736e3fc-a562-4a23-bf39-fb92f0aba273")
      ..initialize().then((value) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    checkAccount();

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  initPrepartions() async {
    controller = await VideoPlayerController.network(
        "https://firebasestorage.googleapis.com/v0/b/hot-deals-dev.appspot.com/o/WhatsApp%20Video%202022-03-07%20at%209.36.43%20PM.mp4?alt=media&token=d736e3fc-a562-4a23-bf39-fb92f0aba273")
      ..initialize().then((value) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    await checkAccount();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfcfdff),
      appBar: AppBar(
        elevation: .2,
        backgroundColor: AppColors.colorPalleteRed,
        centerTitle: false,
        title: Text(
          "Business Owners",
          style: textStyleWidget(
              fontWeight: FontWights.semiBold,
              color: AppColors.white,
              fontSize: FontSize.h1),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              VerticalSpacing(value: 10),
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(5),
              //   child: Container(
              //     width: double.infinity,
              //     height: 200,
              //     decoration: BoxDecoration(
              //       image: DecorationImage(
              //         fit: BoxFit.cover,
              //         image: AssetImage(AppAssets.business),
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                height: 250,
                child: Stack(
                  children: [
                    Container(child: VideoPlayer(controller)),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          print("button  pressed");
                          controller.value.isPlaying
                              ? controller.pause()
                              : controller.play();

                          setState(() {});
                        },
                        child: Icon(
                          controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          size: 50,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              VerticalSpacing(value: 5),
              Text(
                'Watch the video above',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              VerticalSpacing(value: 5),
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: AppStrings.businessText,
                    style: textStyleWidget(
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.normal,
                        fontSize: FontSize.subText_02,
                        color: Color(0xFF0a0b10)),
                  ),
                  // TextSpan(
                  //     text: " [ add contact page link here ]",
                  //     style: textStyleWidget(
                  //         letterSpacing: 1.4,
                  //         fontWeight: FontWeight.normal,
                  //         fontSize: FontSize.subText_02,
                  //         color: Colors.blue),
                  //     recognizer: TapGestureRecognizer()
                  //       ..onTap = () {
                  //         Get.to(ContactUs());
                  //       }),
                ]),
              ),

              /* Row(
                children: [
                  Text(
                    AppStrings.businessText,
                    textAlign: TextAlign.left,
                    style: textStyleWidget(
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.normal,
                        fontSize: FontSize.subText_02,
                        color: Color(0xFF0a0b10)),
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Text(
                      "[add contact page link here]",
                      textAlign: TextAlign.left,
                      style: textStyleWidget(
                          letterSpacing: 1.4,
                          fontWeight: FontWeight.normal,
                          fontSize: FontSize.subText_02,
                          color: Color(0xFF0a0b10)),
                    ),
                  ),
                ],
              ),*/
              VerticalSpacing(value: 25),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: MaterialButton(
                    height: 40,
                    onPressed: () {
                      Get.find<LocalDatabase>().getToken == "" ||
                              Get.find<LocalDatabase>().getToken == null
                          ? ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "Login into the app to create Business account & deal"),
                              ),
                            )
                          : checkUserHadAccount();
                    },
                    splashColor: Colors.red,
                    child: isLoading
                        ? const SizedBox(
                            width: 15,
                            height: 15,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            isAccountCreated
                                ? "Create a Deal"
                                : "Create Business Account",
                            style: textStyleWidget(
                                color: AppColors.white, letterSpacing: 1.2),
                          ),
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    animationDuration: Duration(seconds: 1),
                    minWidth: double.infinity,
                    color: AppColors.colorPalleteRed,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    visualDensity: VisualDensity.adaptivePlatformDensity),
              ),
              ButtonWidget("Pricing Details", Icons.attach_money, () {
                Get.to(PricingInfo());
              }),
            ],
          ),
        ),
      ),
    );
  }

  checkAccount() async {
    DocumentSnapshot documentSnapshot = await Get.find<FireStoreGateway>()
        .checkUserBusinessAccount(Get.find<LocalDatabase>().getToken);

    if (documentSnapshot.exists)
      isAccountCreated = true;
    else
      isAccountCreated = false;

    setState(() {});
  }

  checkUserHadAccount() async {
    await checkAccount();
    if (isAccountCreated)
      Get.to(CreateDeal());
    else
      Get.to(BusinessAccountCreate())!.then((value) async {
        await checkAccount();
      });
    setState(() {});
  }

  void loadingController(bool value) {
    isLoading = value;
    print("condition triggered and the value is $isLoading}");
    setState(() {});
  }
}

class ButtonWidget extends StatelessWidget {
  String? name;
  IconData? iconData;
  late Callback buttonFuntion;

  ButtonWidget(this.name, this.iconData, this.buttonFuntion);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: MaterialButton(
          height: 40,
          onPressed: buttonFuntion,
          splashColor: Colors.orange,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(iconData, color: AppColors.white),
              HorizontalSpacing(value: 10),
              Text(
                name!,
                style:
                    textStyleWidget(color: AppColors.white, letterSpacing: 1.2),
              ),
            ],
          ),
          materialTapTargetSize: MaterialTapTargetSize.padded,
          animationDuration: Duration(seconds: 1),
          minWidth: double.infinity,
          color: AppColors.colorPalleteRed,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}
