import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (builder) {
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
              Container(
                  margin: EdgeInsets.only(top: 50),
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  child: Image(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(AppAssets.applogo),
                  )),
              Text(
                "E-mail",
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
                  focusNode: controller.emailFocus,
                  controller: controller.email_controller,
                  readOnly: controller.readOnly,
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
                    if (controller.email_controller.text.trim().isEmpty) {
                      return;
                    } else if (!controller.email_controller.text.isEmail) {}
                  },
                  cursorColor: Colors.black45,
                ),
              ),
              VerticalSpacing(value: 15),
              Text(
                "Password",
                style: textStyleWidget(
                  letterSpacing: .2,
                ),
              ),
              VerticalSpacing(),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(233, 230, 230, 100),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  obscureText: true,
                  controller: controller.password_controller,
                  focusNode: controller.passwordFocus,
                  readOnly: controller.readOnly,
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
                  ),
                  onSubmitted: (value) {
                    if (controller.password_controller.text.trim().isEmpty) {
                      return;
                    }
                  },
                  cursorColor: Colors.black45,
                ),
              ),
              VerticalSpacing(value: 25),
              MaterialButton(
                  height: 40,
                  onPressed: controller.isLoading
                      ? () {}
                      : () async {
                          if (controller.isLoading) {
                            return;
                          }
                          if (controller.email_controller.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: const Text("Enter E-mail"),
                            ));
                            FocusScope.of(context)
                                .requestFocus(controller.emailFocus);
                            return;
                          } else if (!controller
                              .email_controller.text.isEmail) {
                            return;
                          }

                          if (controller.password_controller.text
                              .trim()
                              .isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: const Text("Enter Password"),
                            ));
                            FocusScope.of(context)
                                .requestFocus(controller.passwordFocus);

                            return;
                          }

                          controller.loginValidations();
                          // GetxFire.auth.createUserWithEmailAndPassword(
                          //     email: "harikrishnarko007@gmail.com",
                          //     password: "123456");
                        },
                  child: controller.isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ))
                      : Text(
                          "Login",
                          style: textStyleWidget(color: Colors.white),
                        ),
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  animationDuration: const Duration(seconds: 1),
                  minWidth: double.infinity,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  // elevation: 2,
                  //   focusElevation:2,
                  visualDensity: VisualDensity.adaptivePlatformDensity),
              VerticalSpacing(value: 10),
              InkWell(
                onTap: controller.isLoading
                    ? () {}
                    : () {
                        if (controller.isLoading) {
                          return;
                        }
                        controller.gotToForgetPasswordScreen();

                        // controller.resetPassword();
                      },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  //padding: EdgeInsets.only(right: 16),
                  child: Text(
                    "Forgot password?",
                    style: textStyleWidget(
                        isUnderline: true,
                        fontSize: FontSize.subText_01,
                        letterSpacing: 1.2,
                        color: Colors.black.withOpacity(.8)),
                  ),
                ),
              ),
              VerticalSpacing(value: 25),
              MaterialButton(
                  height: 40,
                  splashColor: Colors.red.withOpacity(.4),
                  onPressed: controller.isLoading
                      ? () {}
                      : () async {
                          if (controller.isLoading) {
                            return;
                          }
                          controller.gotToCreateAccountScreen();
                        },
                  child: Text(
                    "Create a account",
                    style: textStyleWidget(color: Colors.red),
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  animationDuration: Duration(seconds: 1),
                  minWidth: double.infinity,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  // elevation: 2,
                  //   focusElevation:2,
                  visualDensity: VisualDensity.adaptivePlatformDensity),
              VerticalSpacing(value: 15),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                //padding: EdgeInsets.only(right: 16),
                child: Text(
                  "or",
                  style: textStyleWidget(
                      fontSize: FontSize.subText_01,
                      letterSpacing: 1.2,
                      color: Colors.black.withOpacity(.5)),
                ),
              ),
              VerticalSpacing(value: 15),
              InkWell(
                onTap: controller.isLoading
                    ? () {}
                    : () {
                        if (controller.isLoading) {
                          return;
                        }
                        controller.gotToHomeScreenScreen();
                      },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  //padding: EdgeInsets.only(right: 16),
                  child: Text(
                    "Browse as a guest",
                    style: textStyleWidget(
                        fontSize: FontSize.normalText,
                        letterSpacing: 1.2,
                        color: Colors.black.withOpacity(.8)),
                  ),
                ),
              ),
            ],
          ),
        )),
      );
    });
  }
}
