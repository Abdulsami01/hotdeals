import 'package:hotdealsgemet/core/app_rss/app_strings.dart';
import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';

import 'contact_us_screen_controller.dart';

class ContactUs extends GetView<ContactUsController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactUsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.red,
            centerTitle: false,
            title: Text(
              "Contact Us",
              style: textStyleWidget(
                  fontWeight: FontWights.semiBold,
                  color: Colors.white,
                  fontSize: FontSize.h1),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    VerticalSpacing(value: 10),
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(AppAssets.applogo))),
                    ),

                    // Text(
                    //   "HEMET CA.\n 92545",
                    //   textAlign: TextAlign.center,
                    //   style: textStyleWidget(
                    //       fontWeight: FontWights.normal,
                    //       fontSize: FontSize.normalText,
                    //       color: AppColors.secondary_text_color),
                    // ),
                    VerticalSpacing(value: 45),
                    Container(
                      //  padding: EdgeInsets.all(22),
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 60),
                      width: MediaQuery.of(context).size.width,
                      //height: MediaQuery.of(context).size.height / 3.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: Colors.black12,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,

                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'For Phone Call or Text Support',
                            style: TextStyle(
                              height: MediaQuery.of(context).size.height / 300,
                              color: Colors.black,
                            ),
                          ),
                          VerticalSpacing(value: 15),
                          Row(
                            children: [
                              HorizontalSpacing(value: 15),
                              Icon(
                                Icons.call,
                                color: Colors.black,
                              ),
                              HorizontalSpacing(value: 15),
                              Text(
                                " 951-599-8889",
                                textAlign: TextAlign.center,
                                style: textStyleWidget(
                                  letterSpacing: 1.4,
                                  fontWeight: FontWights.bold,
                                  fontSize: FontSize.h2,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          VerticalSpacing(value: 10),
                          Divider(
                            color: Colors.black12,
                          ),
                          VerticalSpacing(value: 10),
                          Text(
                            "For email support",
                            style: TextStyle(
                              height: MediaQuery.of(context).size.height / 650,
                              color: Colors.black,
                            ),
                          ),
                          VerticalSpacing(value: 15),
                          Row(
                            children: [
                              HorizontalSpacing(value: 15),
                              Icon(
                                Icons.mail,
                                color: Colors.black,
                              ),
                              VerticalSpacing(value: 10),
                              HorizontalSpacing(value: 18),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.6,
                                child: Text(
                                  "Support.HotDealsHemet@gmail.com",
                                  //overflow: TextOverflow.ellipsis,
                                  // softWrap: false,
                                  // textAlign: TextAlign.center,
                                  style: textStyleWidget(
                                    letterSpacing: 1.4,
                                    fontWeight: FontWights.bold,
                                    fontSize: FontSize.h1,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    VerticalSpacing(value: 10),
                    // ElevatedButton(
                    //   onPressed: null,
                    //   child: Text(
                    //     'Make a phone call',
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    //   style: ButtonStyle(
                    //     backgroundColor:
                    //         MaterialStateProperty.all<Color>(Colors.red),
                    //   ),
                    // ),

                    //
                    // Text(
                    //   "For Help Text",
                    //   textAlign: TextAlign.left,
                    //   style: textStyleWidget(
                    //       letterSpacing: 1.4,
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: FontSize.normalText,
                    //       color: AppColors.secondary_text_color),
                    // ),
                    // VerticalSpacing(value: 10),
                    // Text(
                    //   "714-496-9970",
                    //   textAlign: TextAlign.left,
                    //   style: textStyleWidget(
                    //       letterSpacing: 1.4,
                    //       fontWeight: FontWights.extraBold,
                    //       fontSize: FontSize.h2,
                    //       color: AppColors.secondary_text_color),
                    // ),
                    // VerticalSpacing(value: 20),
                    // Text(
                    //   "For phone call support",
                    //   textAlign: TextAlign.left,
                    //   style: textStyleWidget(
                    //       letterSpacing: 1.4,
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: FontSize.normalText,
                    //       color: AppColors.secondary_text_color),
                    // ),
                    // VerticalSpacing(value: 10),
                    // Text(
                    //   "( 951 ) 599-8889",
                    //   textAlign: TextAlign.left,
                    //   style: textStyleWidget(
                    //       letterSpacing: 1.4,
                    //       fontWeight: FontWights.extraBold,
                    //       fontSize: FontSize.h2,
                    //       color: AppColors.secondary_text_color),
                    // ),
                    // VerticalSpacing(value: 20),
                    // Text(
                    //   "For email support",
                    //   textAlign: TextAlign.left,
                    //   style: textStyleWidget(
                    //       letterSpacing: 1.4,
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: FontSize.normalText,
                    //       color: AppColors.secondary_text_color),
                    // ),
                    // VerticalSpacing(value: 10),
                    // Text(
                    //   "LauraMonk.HotDeals@gmail.com",
                    //   textAlign: TextAlign.left,
                    //   style: textStyleWidget(
                    //       fontWeight: FontWights.normal,
                    //       fontSize: FontSize.subText_01,
                    //       color: AppColors.secondary_text_color),
                    // ),
                    //
                    // VerticalSpacing(value: 20),

                    // Container(
                    //   width: 200,
                    //   height:200,
                    //   decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //           fit: BoxFit.cover,
                    //           image: AssetImage(AppAssets.applogo)
                    //       )
                    //   ),
                    // ),
                    // VerticalSpacing(value: 15),
                    // Text(
                    //   "HEMET CA.\n 92545",
                    //   textAlign: TextAlign.center,
                    //
                    //   style: textStyleWidget(
                    //
                    //       fontWeight: FontWights.normal,
                    //       fontSize: FontSize.normalText,
                    //       color: AppColors.secondary_text_color),
                    // ),
                    // InkWell(
                    //     onTap: (){
                    //
                    //       controller.testingPurpose();
                    //     },
                    //     child: Text("testing"))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
