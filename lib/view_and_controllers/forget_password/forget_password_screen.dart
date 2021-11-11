import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getxfire/getxfire.dart';
import 'package:hotdealsgemet/core/app_rss/app_assets.dart';
import 'package:hotdealsgemet/core/app_rss/font_size.dart';
import 'package:hotdealsgemet/core/app_rss/font_weights.dart';
import 'package:hotdealsgemet/view_and_controllers/create_account/create_user_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/forget_password/forget_password_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/login_screen/login_screen_controller.dart';
import 'package:hotdealsgemet/widget/custom_spacing.dart';
import 'package:hotdealsgemet/widget/textstyle_widget.dart';
import 'package:lottie/lottie.dart';

class ForgetPassword extends GetView<ForgetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(

        builder: (builder) {


          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      VerticalSpacing(value:30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,

                            child: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: IconButton(
                                  onPressed: (){
                                    Get.back();
                                  }, icon: Icon(Icons.arrow_back)),
                            ),
                          ),
                          Container(

                            height: 200,
                            width: 200,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.contain,

                                    image: AssetImage(AppAssets.applogo)
                                )
                            ),
                          ),
                        ],
                      ),

                      VerticalSpacing(value: 15),

                      Text(
                        "e-mail",
                        style: textStyleWidget(letterSpacing: .2),
                      ),
                      VerticalSpacing(),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(233, 230, 230, 100),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          controller: controller.emailController,
                          style: textStyleWidget(
                              fontSize: FontSize.normalText,
                              fontWeight: FontWights.normal,
                              color: Colors.black.withOpacity(.5),
                              letterSpacing: 1.2),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 5, left: 5),
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(233, 230, 230, 100), width: .4),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(233, 230, 230, 100), width: .4),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.red, width: .4),
                            ),
                          ),
                          onSubmitted: (value) {

                          },
                          cursorColor: Colors.black45,
                        ),
                      ),

                      VerticalSpacing(value: 25),
                      MaterialButton(
                          height: 40,
                          onPressed: () async {
                           if(!controller.emailController.text.isEmail)
                             {
                               return ;
                             }
                            await controller.passwordRequest();

                          },
                          child: Text(
                            "Submit",
                            style: textStyleWidget(color: Colors.white),
                          ),
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          animationDuration: Duration(seconds: 1),
                          minWidth: double.infinity,
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          // elevation: 2,
                          //   focusElevation:2,
                          visualDensity: VisualDensity.adaptivePlatformDensity),


                      VerticalSpacing(value: 25),

                    ],
                  ),
                )),
          );
        });
  }
}