import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
import 'package:hotdealsgemet/view_and_controllers/checkout_page/checkout_screen_controller.dart';
import 'package:purchases_flutter/errors.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class CheckOutScreen extends GetView<CheckoutController> {
  Map<String, dynamic> dealData;

  CheckOutScreen(this.dealData);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.colorPalleteRed,
            centerTitle: false,
            title: Text(
              "Checkout Page",
              style: textStyleWidget(
                  fontWeight: FontWights.semiBold,
                  color: Colors.white,
                  fontSize: FontSize.h1),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  VerticalSpacing(value: 10),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black.withOpacity(.2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            child: Image(
                              fit: BoxFit.cover,
                              image: FileImage(File(dealData["imageLink"])),
                            ),
                          ),
                        ),
                        VerticalSpacing(value: 10),
                        Text(
                          dealData["description"],
                          style: textStyleWidget(
                              color: Colors.red,
                              fontSize: FontSize.h2,
                              fontWeight: FontWights.semiBold),
                        ),
                        VerticalSpacing(value: 5),
                        Text(
                          dealData["subDescription"],
                          style: textStyleWidget(
                              color: Colors.black.withOpacity(.7),
                              fontSize: FontSize.normalText,
                              fontWeight: FontWights.semiBold),
                        ),
                        VerticalSpacing(value: 5),
                        Text(
                          dealData["shopName"],
                          style: textStyleWidget(
                              color: Colors.black.withOpacity(.6),
                              fontSize: FontSize.smallText,
                              fontWeight: FontWights.semiBold),
                        ),
                        VerticalSpacing(value: 5),
                        Text(
                          dealData["shopAddress"],
                          style: textStyleWidget(
                              color: Colors.black.withOpacity(.5),
                              fontSize: FontSize.smallText,
                              fontWeight: FontWights.semiBold),
                        ),
                        VerticalSpacing(value: 5),
                        Text(
                          dealData["shopPhoneNumber"],
                          style: textStyleWidget(
                              color: Colors.black.withOpacity(.5),
                              fontSize: FontSize.subText_01,
                              fontWeight: FontWights.semiBold),
                        ),
                        VerticalSpacing(value: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              dealData["shopCode"],
                              style: textStyleWidget(
                                  color: Colors.blueAccent.withOpacity(.8),
                                  fontSize: FontSize.h3,
                                  fontWeight: FontWights.semiBold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  VerticalSpacing(value: 20),
                  Text(
                    "\$50. per month for those who sign up for recurring monthly payments.",
                    textAlign: TextAlign.left,
                    style: textStyleWidget(
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize.normalText,
                        color: Colors.black.withOpacity(.7)),
                  ),
                  Text(
                    "Your add will automatically stay up throughout every monthly cycle, and you will be billed on the same date every month.",
                    textAlign: TextAlign.left,
                    style: textStyleWidget(
                        fontWeight: FontWeight.normal,
                        fontSize: FontSize.normalText,
                        color: Colors.black.withOpacity(.7)),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: controller.isLoading
                  ? () {}
                  : () async {
                      await controller.payNow(dealData);

                      //print(purchaserInfo.allPurchaseDates);
                    },
              child: Container(
                height: 45,
                alignment: Alignment.center,
                child: controller.isLoading
                    ? SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        "Pay now",
                        style: textStyleWidget(color: AppColors.white),
                      ),
                decoration: BoxDecoration(
                  color: AppColors.colorPalleteRed,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
