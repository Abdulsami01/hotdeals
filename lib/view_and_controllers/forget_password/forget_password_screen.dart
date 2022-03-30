import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';


class ForgetPassword extends GetView<ForgetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(builder: (builder) {
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
              VerticalSpacing(value: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: IconButton(
                          onPressed: () {
                            controller.goBack();
                          },
                          icon: Icon(Icons.arrow_back)),
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
                            image: AssetImage(AppAssets.applogo))),
                  ),
                ],
              ),
              VerticalSpacing(value: 15),
              Text(
                "Reset password link will be sent to your email which you entered below",
                style: textStyleWidget(
                    letterSpacing: .2, color: Colors.black.withOpacity(.5)),
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
                  focusNode: controller.emailFocus,
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
                  onSubmitted: (value) {},
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
                          if (!controller.emailController.text.isEmail) {
                            return;
                          }else if (controller.emailController.text.trim().isEmpty)
                            {
                              FocusScope.of(context).requestFocus(controller.emailFocus);
                              return ;
                            }
                          await controller.passwordRequest();
                        },
                  child: controller.isLoading ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      )) :Text(
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
