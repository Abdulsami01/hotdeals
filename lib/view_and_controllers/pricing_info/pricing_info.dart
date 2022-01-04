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
              "Subscription Plan",
              textAlign: TextAlign.left,
              style: textStyleWidget(
                  letterSpacing: 1.4,
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.h1,
                  color: Color(0xFF0a0b10)),
            ),
            VerticalSpacing(value: 10),
            Text("\$50. per month for those who sign up for recurring monthly payments. Cancel at time after 3 months. Your ad will automatically stay up through every monthly cycle, and you will be billed on the same date every month.",       textAlign: TextAlign.left,
              style: textStyleWidget(
                  letterSpacing: 1.4,
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.normalText,
                  color: Colors.black.withOpacity(.7)),),
            VerticalSpacing(value: 15),
            Text(
              "One time plan",
              textAlign: TextAlign.left,
              style: textStyleWidget(
                  letterSpacing: 1.4,
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.h1,
                  color: Color(0xFF0a0b10)),
            ),
            VerticalSpacing(value: 10),
            Text("\$65. per month for one time / ONE MONTH ad.  This is NOT on recurring monthly payments. On this plan your ad will automatically delete after one month. If you wish to continue your ad, you will need to resubmit a new ad with a new payment.",       textAlign: TextAlign.left,
              style: textStyleWidget(
                  letterSpacing: 1.4,
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.normalText,
                  color: Colors.black.withOpacity(.7)),)
          ],
        ),
      ),
    );
  }
}
