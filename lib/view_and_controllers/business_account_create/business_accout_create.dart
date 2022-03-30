import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';

import 'business_accout_create_controller.dart';

class BusinessAccountCreate extends GetView<BusinessAccoutCreateController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessAccoutCreateController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: .2,
            backgroundColor: AppColors.colorPalleteRed,
            centerTitle: false,
            titleSpacing: 0,
            title: Text(
              "Create Business Account",
              style: textStyleWidget(
                  fontWeight: FontWights.semiBold,
                  color: AppColors.white,
                  fontSize: FontSize.h1),
              textScaleFactor: 1,
            ),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: controller.getFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    VerticalSpacing(value: 20),
                    Text(
                      "Create a business account before creating a deal",
                      style: textStyleWidget(fontSize: FontSize.normalText),
                      textAlign: TextAlign.center,
                    ),
                    VerticalSpacing(value: 20),
                    Container(
                      width: double.infinity,
                      child: Container(
                        width: 195,
                        height: 140,
                        alignment: Alignment.center,
                        child: Image(
                          image: AssetImage(AppAssets.applogo),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    VerticalSpacing(value: 30),
                    Text(
                      "Enter Business Name",
                      style: textStyleWidget(fontSize: FontSize.subText_01),
                      textAlign: TextAlign.start,
                    ),
                    VerticalSpacing(value: 8),
                    TextFormField(
                      controller: controller.userNameController,
                      focusNode: controller.userNameFocus,
                      readOnly: controller.readOnly,
                      style: textStyleWidget(
                          fontSize: FontSize.normalText,
                          fontWeight: FontWights.normal,
                          color: Colors.black.withOpacity(.7),
                          letterSpacing: 1.2),
                      keyboardType: TextInputType.name,
                      showCursor: true,
                      decoration: InputDecoration(
                        hintStyle: textStyleWidget(
                            fontSize: FontSize.subText_01,
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
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.colorPalleteRed, width: .4),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.colorPalleteRed, width: .4),
                        ),
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(50),
                      ],
                      cursorColor: Colors.black45,
                      validator: (text) {
                        if (text!.isEmpty || text == null) {
                          return "Enter username";
                        }
                        return null;
                      },
                      onSaved: (text) {},
                    ),
                    VerticalSpacing(value: 20),
                    Text(
                      "Enter Business e-Mail",
                      style: textStyleWidget(fontSize: FontSize.subText_01),
                      textAlign: TextAlign.start,
                    ),
                    VerticalSpacing(value: 8),
                    TextFormField(
                      controller: controller.emailController,
                      focusNode: controller.emailFocus,
                      readOnly: controller.readOnly,
                      style: textStyleWidget(
                          fontSize: FontSize.normalText,
                          fontWeight: FontWights.normal,
                          color: Colors.black.withOpacity(.7),
                          letterSpacing: 1.2),
                      keyboardType: TextInputType.emailAddress,
                      showCursor: true,
                      decoration: InputDecoration(
                        hintStyle: textStyleWidget(
                            fontSize: FontSize.subText_01,
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
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.colorPalleteRed, width: .4),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.colorPalleteRed, width: .4),
                        ),
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(50),
                      ],
                      cursorColor: Colors.black45,
                      validator: (text) {
                        if (!GetUtils.isEmail(text!) ||
                            text.isEmpty ||
                            text == null) {
                          return "Enter Correct Email";
                        }
                        return null;
                      },
                      onSaved: (text) {},
                    ),
                    VerticalSpacing(value: 20),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: MaterialButton(
                          height: 40,
                          onPressed: () {
                            controller.createAccount();
                          },
                          splashColor: Colors.orange,
                          child: controller.isLoading
                              ? SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    HorizontalSpacing(value: 10),
                                    Text(
                                      "Create Business Account",
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
                    )
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
