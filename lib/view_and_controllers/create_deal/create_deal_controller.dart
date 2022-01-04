import 'dart:io';
import 'package:hotdealsgemet/view_and_controllers/checkout_page/checkout_screen.dart';
import 'package:hotdealsgemet/view_and_controllers/home_screen/home_screen.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'package:uuid/uuid.dart';

import 'package:get/get_instance/src/extension_instance.dart';
import 'package:hotdealsgemet/core/api_calls/firestore_gateway.dart';
import 'package:hotdealsgemet/core/app_rss/app_strings.dart';
import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
import 'package:hotdealsgemet/core/api_calls/firebase_storage.dart';
import 'package:hotdealsgemet/core/services/local_database.dart';
import 'package:image_picker/image_picker.dart';

class CreateDealController extends GetxController
{
  TextEditingController BusinessNameController=TextEditingController();

  TextEditingController BusinessEmailAddressController=TextEditingController();

  TextEditingController descriptionController=TextEditingController();

  TextEditingController subDescriptionController=TextEditingController();

  TextEditingController shopCodeController=TextEditingController();


  TextEditingController shopNameController=TextEditingController();

  TextEditingController shopPhoneNumberController=TextEditingController();


  TextEditingController shopAddressController=TextEditingController();

  FocusNode BusinessNameFocus=FocusNode();
  FocusNode BusinessEmailAddressFocus=FocusNode();
  FocusNode descriptionFocus=FocusNode();
  FocusNode subDescriptionFocus=FocusNode();
  FocusNode shopCodeFocus=FocusNode();
  FocusNode shopNameFocus=FocusNode();
  FocusNode shopPhoneNumberFocus=FocusNode();
  FocusNode shopAddressFocus=FocusNode();



  bool isLoading=false;
  bool readOnly=false;








  late  XFile? image;
   late ImagePicker _picker;
  late File? iFile;
  bool isImageSelected=false;




   @override
   void onInit() {
//

     _picker = ImagePicker();
     update();
   }



  pickImageFormGallary()
  async{
  image = await _picker.pickImage(source: ImageSource.gallery);
     iFile=await File(image!.path);


     isImageSelected=true;
     update();
  }

  pickImageFromCamera()
 async {
   image = await _picker.pickImage(source: ImageSource.camera);
   iFile=File(image!.path);
   isImageSelected=true;

   update();
  }


  data()
async{
  print("called offerings funtion");

  Offerings offerings = await Purchases.getOfferings();
  if (offerings.current != null) {
    print("all data");
  }
  
  print(offerings.all.length);


}


  createDeal(File file)
 async {
   updateButtonStatus(true);


   Map<String,dynamic> dealData={};

   dealData["imageLink"]=file.path;
   dealData["userId"]=(Get.find<LocalDatabase>().getStorageInstance.read(AppStrings.token)).toString();
   dealData["dealUniqId"]=Uuid().v1();
   dealData["businessName"]=BusinessNameController.text;
   dealData["businessEmail"]=BusinessEmailAddressController.text;
   dealData["description"]=descriptionController.text;
   dealData["subDescription"]=subDescriptionController.text;
   dealData["shopCode"]=shopCodeController.text;
   dealData["shopName"]=shopNameController.text;
   dealData["shopPhoneNumber"]=shopPhoneNumberController.text;
   dealData["shopAddress"]=shopAddressController.text;
   dealData["expireData"]="null";
   dealData["paidData"]="null";
   dealData["paidType"]="null";


   Get.to(CheckOutScreen(dealData));

   // go to payment procedure

   updateButtonStatus(false);

  }


   updateButtonStatus(bool value)
   {
     isLoading=value;
     update();
   }

  @override
  void dispose() {
    Get.delete<CreateDealController>();
  }
}