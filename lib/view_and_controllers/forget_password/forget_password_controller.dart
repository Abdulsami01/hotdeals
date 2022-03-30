import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotdealsgemet/core/api_calls/auth.dart';
import 'package:hotdealsgemet/core/app_rss/app_strings.dart';
import 'package:hotdealsgemet/widget/custom_spacing.dart';
import 'package:hotdealsgemet/widget/textstyle_widget.dart';

class ForgetPasswordController extends GetxController
{
  TextEditingController emailController =TextEditingController();
  FocusNode emailFocus=FocusNode();
  bool isLoading=false;


  passwordRequest()
  async{
    buttonControl(true);
  String value=  await Get.find<AuthenticationService>().requestOtpMail(emailController.text);
  if(value==AppStrings.success)
    {
      Get.defaultDialog(title: "Forget Password Request",middleText: "Check Your Email to Reset Password");
    }
    if(value==AppStrings.failure)
    {
      print(value);

      Get.defaultDialog(title: "Forget Password Request",middleText: "Enter Account Created Email");
    }

    //Get.back();

    buttonControl(false);

  }
  buttonControl(bool value)
  {
    print("----");
    isLoading =value;
    update();
  }





  goBack()
  {
    Get.back();

  }

}