import 'package:hotdealsgemet/core/app_rss/app_strings.dart';
import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
import 'package:hotdealsgemet/view_and_controllers/business_owners/business_owners_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/pricing_info/pricing_info.dart';

class BusinessOwners extends GetView<BusinessOnwersController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessOnwersController>(
      init: BusinessOnwersController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Color(0xFFfcfdff),
          appBar: AppBar(
            elevation: .2,
            backgroundColor: AppColors.colorPalleteRed,
            centerTitle: false,
            title: Text(
              "Hot Deals Hemet",
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AppAssets.business),
                        ),
                      ),
                    ),
                  ),
                  VerticalSpacing(value: 15),
                  Text(
                    AppStrings.businessText,
                    textAlign: TextAlign.left,
                    style: textStyleWidget(
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.normal,
                        fontSize: FontSize.normalText,
                        color: Color(0xFF0a0b10)),
                  ),
                  VerticalSpacing(value: 25),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MaterialButton(
                        height: 40,
                        onPressed: () {
                          controller.checkUserHadAccount();
                        },
                        splashColor: Colors.orange,
                        child: controller.isLoading
                            ? const SizedBox(
                                width: 15,
                                height: 15,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                controller.isAccountCreated ? "Create a Deal" :"Create Business Account",
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
                  ButtonWidget("Pricing Details", Icons.price_check, () {
                    Get.to(PricingInfo());
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
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
