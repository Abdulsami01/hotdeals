import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
import 'package:hotdealsgemet/view_and_controllers/checkout_page/checkout_screen.dart';

import 'create_deal_controller.dart';

class CreateDeal extends GetView<CreateDealController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<CreateDealController>(
      builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors.red,
              centerTitle: false,
              title: Text(
                "Create Deal",
                style: textStyleWidget(
                    fontWeight: FontWights.semiBold,
                    color: Colors.white,
                    fontSize: FontSize.h1),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    VerticalSpacing(value: 15),
                    Text(
                      "Fill in all the fields to create your deal",
                      textAlign: TextAlign.center,
                      style: textStyleWidget(
                          color: Colors.black, fontSize: FontSize.normalText),
                    ),
                    VerticalSpacing(value: 15),
                    InkWell(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoActionSheet(
                              actions: <CupertinoActionSheetAction>[
                                CupertinoActionSheetAction(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        CupertinoIcons.camera,
                                        color: CupertinoColors.systemBlue,
                                      ),
                                      HorizontalSpacing(value: 10),
                                      const Text('Open Camera'),
                                    ],
                                  ),
                                  onPressed: () {
                                    controller.pickImageFromCamera();
                                    Navigator.pop(context);
                                  },
                                ),
                                CupertinoActionSheetAction(
                                  child: Row(
                                    children: [
                                      const Icon(
                                        CupertinoIcons.collections,
                                        color: CupertinoColors.systemBlue,
                                      ),
                                      HorizontalSpacing(value: 10),
                                      const Text('Open Gallary'),
                                    ],
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                  ),
                                  onPressed: () {
                                    controller.pickImageFormGallary();

                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.black.withOpacity(.2),
                                  width: .4)),
                          alignment: Alignment.center,
                          child: controller.isImageSelected
                              ? Image.file(controller.iFile!)
                              : Image(
                                  image:
                                      AssetImage(AppAssets.gallaru_camera_icon),
                                )),
                    ),
                    VerticalSpacing(value: 15),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(233, 230, 230, 100),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: controller.BusinessNameController,
                        focusNode: controller.BusinessNameFocus,
                        readOnly: controller.readOnly,
                        style: textStyleWidget(
                            fontSize: FontSize.normalText,
                            fontWeight: FontWights.normal,
                            color: Colors.black.withOpacity(.7),
                            letterSpacing: 1.2),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: "busniness name",
                          hintStyle: textStyleWidget(
                              fontSize: FontSize.subText_01,
                              fontWeight: FontWights.light,
                              color: Colors.black.withOpacity(.5),
                              letterSpacing: 1.2),
                          contentPadding: EdgeInsets.only(bottom: 5, left: 5),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(233, 230, 230, 100),
                                width: .4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(233, 230, 230, 100),
                                width: .4),
                          ),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50),
                        ],
                        onSubmitted: (value) {
                          if (controller.BusinessNameController.text
                              .trim()
                              .isEmpty) {
                            return;
                          }
                        },
                        cursorColor: Colors.black45,
                      ),
                    ),
                    VerticalSpacing(value: 10),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(233, 230, 230, 100),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: controller.BusinessEmailAddressController,
                        focusNode: controller.BusinessEmailAddressFocus,
                        readOnly: controller.readOnly,
                        style: textStyleWidget(
                            fontSize: FontSize.normalText,
                            fontWeight: FontWights.normal,
                            color: Colors.black.withOpacity(.5),
                            letterSpacing: 1.2),
                        autocorrect: true,
                        keyboardType: TextInputType.emailAddress,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50),
                        ],
                        decoration: InputDecoration(
                          hintText: "busniness email",
                          hintStyle: textStyleWidget(
                              fontSize: FontSize.smallText,
                              fontWeight: FontWights.light,
                              color: Colors.black.withOpacity(.5),
                              letterSpacing: 1.2),
                          contentPadding: EdgeInsets.only(bottom: 5, left: 5),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(233, 230, 230, 100),
                                width: .4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(233, 230, 230, 100),
                                width: .4),
                          ),
                        ),
                        onSubmitted: (value) {
                          if (controller.BusinessNameController.text
                              .trim()
                              .isEmpty) {
                            return;
                          }
                        },
                        cursorColor: Colors.black45,
                      ),
                    ),
                    VerticalSpacing(value: 10),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(233, 230, 230, 100),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: controller.descriptionController,
                        focusNode: controller.descriptionFocus,
                        readOnly: controller.readOnly,
                        style: textStyleWidget(
                            fontSize: FontSize.normalText,
                            fontWeight: FontWights.normal,
                            color: Colors.black.withOpacity(.5),
                            letterSpacing: 1.2),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "title",
                          hintStyle: textStyleWidget(
                              fontSize: FontSize.smallText,
                              fontWeight: FontWights.light,
                              color: Colors.black.withOpacity(.5),
                              letterSpacing: 1.2),
                          contentPadding: EdgeInsets.only(bottom: 5, left: 5),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(233, 230, 230, 100),
                                width: .4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(233, 230, 230, 100),
                                width: .4),
                          ),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50),
                        ],
                        onSubmitted: (value) {
                          if (controller.BusinessNameController.text
                              .trim()
                              .isEmpty) {
                            return;
                          }
                        },
                        cursorColor: Colors.black45,
                      ),
                    ),
                    VerticalSpacing(value: 10),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(233, 230, 230, 100),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: controller.subDescriptionController,
                        focusNode: controller.subDescriptionFocus,
                        readOnly: controller.readOnly,
                        style: textStyleWidget(
                            fontSize: FontSize.normalText,
                            fontWeight: FontWights.normal,
                            color: Colors.black.withOpacity(.5),
                            letterSpacing: 1.2),
                        keyboardType: TextInputType.streetAddress,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(100),
                        ],
                        decoration: InputDecoration(
                          hintText: "description",
                          hintStyle: textStyleWidget(
                              fontSize: FontSize.smallText,
                              fontWeight: FontWights.light,
                              color: Colors.black.withOpacity(.5),
                              letterSpacing: 1.2),
                          contentPadding: EdgeInsets.only(bottom: 5, left: 5),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(233, 230, 230, 100),
                                width: .4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(233, 230, 230, 100),
                                width: .4),
                          ),
                        ),
                        onSubmitted: (value) {
                          if (controller.BusinessNameController.text
                              .trim()
                              .isEmpty) {
                            return;
                          }
                        },
                        cursorColor: Colors.black45,
                      ),
                    ),
                    VerticalSpacing(value: 10),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(233, 230, 230, 100),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: controller.shopCodeController,
                        focusNode: controller.shopCodeFocus,
                        readOnly: controller.readOnly,
                        style: textStyleWidget(
                            fontSize: FontSize.normalText,
                            fontWeight: FontWights.normal,
                            color: Colors.black.withOpacity(.5),
                            letterSpacing: 1.2),
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(8),
                        ],
                        decoration: InputDecoration(
                          hintText: "coupon code must start with HDH",
                          hintStyle: textStyleWidget(
                              fontSize: FontSize.smallText,
                              fontWeight: FontWights.light,
                              color: Colors.black.withOpacity(.5),
                              letterSpacing: 1.2),
                          contentPadding: EdgeInsets.only(bottom: 5, left: 5),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(233, 230, 230, 100),
                                width: .4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(233, 230, 230, 100),
                                width: .4),
                          ),
                        ),
                        onSubmitted: (value) {
                          if (controller.BusinessNameController.text
                              .trim()
                              .isEmpty) {
                            return;
                          }
                        },
                        cursorColor: Colors.black45,
                      ),
                    ),
                    VerticalSpacing(value: 10),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(233, 230, 230, 100),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: controller.shopNameController,
                        focusNode: controller.shopNameFocus,
                        readOnly: controller.readOnly,
                        style: textStyleWidget(
                            fontSize: FontSize.normalText,
                            fontWeight: FontWights.normal,
                            color: Colors.black.withOpacity(.5),
                            letterSpacing: 1.2),
                        keyboardType: TextInputType.name,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50),
                        ],
                        decoration: InputDecoration(
                          hintText: "shop name",
                          hintStyle: textStyleWidget(
                              fontSize: FontSize.smallText,
                              fontWeight: FontWights.light,
                              color: Colors.black.withOpacity(.5),
                              letterSpacing: 1.2),
                          contentPadding: EdgeInsets.only(bottom: 5, left: 5),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(233, 230, 230, 100),
                                width: .4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(233, 230, 230, 100),
                                width: .4),
                          ),
                        ),
                        onSubmitted: (value) {
                          if (controller.BusinessNameController.text
                              .trim()
                              .isEmpty) {
                            return;
                          }
                        },
                        cursorColor: Colors.black45,
                      ),
                    ),
                    VerticalSpacing(value: 10),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(233, 230, 230, 100),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: controller.shopPhoneNumberController,
                        focusNode: controller.shopPhoneNumberFocus,
                        readOnly: controller.readOnly,
                        style: textStyleWidget(
                            fontSize: FontSize.normalText,
                            fontWeight: FontWights.normal,
                            color: Colors.black.withOpacity(.5),
                            letterSpacing: 1.2),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        decoration: InputDecoration(
                          hintText: "shop phone number",
                          hintStyle: textStyleWidget(
                              fontSize: FontSize.smallText,
                              fontWeight: FontWights.light,
                              color: Colors.black.withOpacity(.5),
                              letterSpacing: 1.2),
                          contentPadding: EdgeInsets.only(bottom: 5, left: 5),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(233, 230, 230, 100),
                                width: .4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(233, 230, 230, 100),
                                width: .4),
                          ),
                        ),
                        onSubmitted: (value) {
                          if (controller.BusinessNameController.text
                              .trim()
                              .isEmpty) {
                            return;
                          }
                        },
                        cursorColor: Colors.black45,
                      ),
                    ),
                    VerticalSpacing(value: 10),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(233, 230, 230, 100),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: controller.shopAddressController,
                        focusNode: controller.shopAddressFocus,
                        readOnly: controller.readOnly,
                        style: textStyleWidget(
                            fontSize: FontSize.normalText,
                            fontWeight: FontWights.normal,
                            color: Colors.black.withOpacity(.5),
                            letterSpacing: 1.2),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(70),
                        ],
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                          hintText: "shop address",
                          hintStyle: textStyleWidget(
                              fontSize: FontSize.smallText,
                              fontWeight: FontWights.light,
                              color: Colors.black.withOpacity(.5),
                              letterSpacing: 1.2),
                          contentPadding: EdgeInsets.only(bottom: 5, left: 5),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(233, 230, 230, 100),
                                width: .4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(233, 230, 230, 100),
                                width: .4),
                          ),
                        ),
                        onSubmitted: (value) {
                          if (controller.BusinessNameController.text
                              .trim()
                              .isEmpty) {
                            return;
                          }
                        },
                        cursorColor: Colors.black45,
                      ),
                    ),
                    VerticalSpacing(value: 15),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: MaterialButton(
                          height: 40,
                          onPressed: controller.isLoading
                              ? () {}
                              : () {
                                  controller.data();

                                  if (controller.isLoading) {
                                    return;
                                  }
                                  print("button called");

                                  if (controller.iFile.isNull) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: const Text("Select Image file"),
                                    ));
                                    return;
                                  }
                                  if (controller.BusinessNameController.text
                                      .trim()
                                      .isEmpty) {
                                    FocusScope.of(context).requestFocus(
                                        controller.BusinessNameFocus);
                                    return;
                                  }
                                  if (controller
                                      .BusinessEmailAddressController.text
                                      .trim()
                                      .isEmpty) {
                                    FocusScope.of(context).requestFocus(
                                        controller.BusinessEmailAddressFocus);
                                    return;
                                  }
                                  if (!GetUtils.isEmail(controller
                                      .BusinessEmailAddressController.text)) {
                                    print("email error");
                                    FocusScope.of(context).requestFocus(
                                        controller.BusinessEmailAddressFocus);
                                    return;
                                  }
                                  if (controller.descriptionController.text
                                      .trim()
                                      .isEmpty) {
                                    FocusScope.of(context).requestFocus(
                                        controller.descriptionFocus);
                                    return;
                                  }
                                  if (controller.subDescriptionController.text
                                      .trim()
                                      .isEmpty) {
                                    FocusScope.of(context).requestFocus(
                                        controller.subDescriptionFocus);
                                    return;
                                  }

                                  if (controller.shopCodeController.text
                                      .trim()
                                      .isEmpty) {
                                    FocusScope.of(context)
                                        .requestFocus(controller.shopCodeFocus);
                                    return;
                                  }
                                  String codeTemp = controller
                                      .shopCodeController.text
                                      .substring(0, 3);
                                  print("hari");
                                  print(codeTemp);
                                  if (codeTemp != "HDH") {
                                    FocusScope.of(context)
                                        .requestFocus(controller.shopCodeFocus);
                                    return;
                                  }
                                  if (controller.shopNameController.text
                                      .trim()
                                      .isEmpty) {
                                    FocusScope.of(context)
                                        .requestFocus(controller.shopNameFocus);
                                    return;
                                  }
                                  if (controller.shopPhoneNumberController.text
                                      .trim()
                                      .isEmpty) {
                                    FocusScope.of(context).requestFocus(
                                        controller.shopPhoneNumberFocus);
                                    return;
                                  }
                                  if (controller.shopAddressController.text
                                      .trim()
                                      .isEmpty) {
                                    FocusScope.of(context).requestFocus(
                                        controller.shopAddressFocus);
                                    return;
                                  }

                                  controller.createDeal(controller.iFile!);
                                },
                          splashColor: Colors.orange,
                          child: controller.isLoading
                              ? SizedBox(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                  width: 15,
                                  height: 15,
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.business,
                                        color: AppColors.white),
                                    HorizontalSpacing(value: 10),
                                    Text(
                                      "Create Deal",
                                      style: textStyleWidget(
                                          color: AppColors.white,
                                          letterSpacing: 1.2),
                                    ),
                                  ],
                                ),
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          animationDuration: Duration(seconds: 1),
                          minWidth: double.infinity,
                          color: AppColors.colorPalleteRed,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          visualDensity: VisualDensity.adaptivePlatformDensity),
                    ),
                    VerticalSpacing(value: 20),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
