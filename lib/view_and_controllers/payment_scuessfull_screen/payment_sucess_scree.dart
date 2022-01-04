import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
import 'package:hotdealsgemet/view_and_controllers/home_screen/home_screen.dart';

class PaymentSucessScreen extends StatefulWidget {
  const PaymentSucessScreen({Key? key}) : super(key: key);

  @override
  _PaymentSucessScreenState createState() => _PaymentSucessScreenState();
}

class _PaymentSucessScreenState extends State<PaymentSucessScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: .2,
          backgroundColor: AppColors.colorPalleteRed,
          centerTitle: true,
          title: Text(
            "Payment Success",
            style: textStyleWidget(
                fontWeight: FontWights.semiBold,
                color: AppColors.white,
                fontSize: FontSize.h1),
          ),
        ),

        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: 250,
                    height: 150 ,
                    child: Image(
                      image: AssetImage(AppAssets.success_payment),
                      width: 250,
                      height: 150 ,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                VerticalSpacing(value: 10),
                Text("Successfully purchased \$65 one month package",       textAlign: TextAlign.center,
                  style: textStyleWidget(
                      letterSpacing: 1.4,
                      fontWeight: FontWeight.bold,
                      fontSize: FontSize.normalText,
                      color: Colors.black.withOpacity(.7)),)
              ],
            ),
          ),
        ),

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15.0),
          child: InkWell(
            onTap: (){
              Get.offAll(HomeScreen());

            },
            child: Container(
              height: 45,

              alignment: Alignment.center,
              child: Text("OK",style: textStyleWidget(color: AppColors.white),),
              decoration: BoxDecoration(
                color: AppColors.colorPalleteRed,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),


      ),
    );
  }
}
