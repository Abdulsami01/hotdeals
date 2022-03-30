import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';

class PricingInfo extends StatefulWidget {
  const PricingInfo({Key? key}) : super(key: key);

  @override
  _PricingInfoState createState() => _PricingInfoState();
}

class _PricingInfoState extends State<PricingInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .2,
        backgroundColor: AppColors.colorPalleteRed,
        centerTitle: false,
        title: Text(
          "Pricing Information",
          style: textStyleWidget(
              fontWeight: FontWights.semiBold,
              color: AppColors.white,
              fontSize: FontSize.h1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpacing(value: 15),
            Text(
              "SUBSCRIPTION PLAN:",
              textAlign: TextAlign.left,
              style: textStyleWidget(
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.h1,
                  color: Color(0xFFdd8f2e)),
            ),
            VerticalSpacing(value: 10),
            Text(
              "\$50. per month for those who sign up for recurring monthly payments.",
              textAlign: TextAlign.left,
              style: textStyleWidget(
                  letterSpacing: 1.4,
                  fontWeight: FontWights.semiBold,
                  fontSize: FontSize.normalText,
                  color: Colors.black.withOpacity(.8)),
            ),
            VerticalSpacing(value: 5),
            Text(
              "Cancel at any time after 3 months. Your add will automatically stay up throughout every monthly cycle, and you will be billed on the same date every month.",
              textAlign: TextAlign.left,
              style: textStyleWidget(
                  fontWeight: FontWeight.normal,
                  fontSize: FontSize.subText_01,
                  color: Colors.black.withOpacity(.7)),
            ),
            VerticalSpacing(value: 15),
            Text(
              'Note: Subscription plan will be launch soon',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            VerticalSpacing(value: 5),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black.withOpacity(.2),
            ),
            VerticalSpacing(value: 25),
            Text(
              "ONE TIME PLAN :",
              textAlign: TextAlign.left,
              style: textStyleWidget(
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.h1,
                  color: Color(0xFF8fc93f)),
            ),
            VerticalSpacing(value: 10),
            Text(
              "\$65. for a one time, one month ad.",
              textAlign: TextAlign.left,
              style: textStyleWidget(
                  letterSpacing: 1.4,
                  fontWeight: FontWights.semiBold,
                  fontSize: FontSize.normalText,
                  color: Colors.black.withOpacity(.8)),
            ),
            VerticalSpacing(value: 5),
            Text(
              "This is not recurring monthly payments.On this plan your ad will automatically delete after the one month cycle.",
              textAlign: TextAlign.left,
              style: textStyleWidget(
                  fontWeight: FontWeight.normal,
                  fontSize: FontSize.subText_01,
                  color: Colors.black.withOpacity(.7)),
            )
          ],
        ),
      ),
    );
  }
}
