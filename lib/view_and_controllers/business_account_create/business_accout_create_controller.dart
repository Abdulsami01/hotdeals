import 'package:get/get_instance/src/extension_instance.dart';
import 'package:hotdealsgemet/core/api_calls/firestore_gateway.dart';
import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
import 'package:hotdealsgemet/core/services/local_database.dart';

class BusinessAccoutCreateController extends GetxController
{

  final _formKey=GlobalKey<FormState>();

  final userNameController =TextEditingController();
  FocusNode userNameFocus=FocusNode();

  final emailController =TextEditingController();
  FocusNode emailFocus=FocusNode();

  bool readOnly=false;

  get getFormKey =>_formKey;


  bool isLoading=false;

  createAccount()
async  {

    bool value=_formKey.currentState!.validate();

    if(value)
      {
        loadingController(true);
        // create a bussiness account in firebase and move to create a deal page

       await Get.find<FireStoreGateway>().createBusinessAccount({"accountOwnerName":userNameController.text,"e-mailID":emailController.text}, Get.find<LocalDatabase>().getToken);
        loadingController(false);
        Get.back();
       //
      }

  }



  void loadingController(bool value)
  {
    isLoading=value;
    update();
  }


  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    emailFocus.dispose();
    userNameFocus.dispose();
  }

}