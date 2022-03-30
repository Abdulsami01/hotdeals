import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:hotdealsgemet/core/api_calls/firebase_storage.dart';
import 'package:hotdealsgemet/core/api_calls/firestore_gateway.dart';
import 'package:hotdealsgemet/core/app_rss/app_strings.dart';
import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
import 'package:hotdealsgemet/core/services/local_database.dart';
import 'package:image_picker/image_picker.dart';

class EditDealController extends GetxController {


  TextEditingController BusinessNameController = TextEditingController();

  TextEditingController BusinessEmailAddressController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController subDescriptionController = TextEditingController();

  TextEditingController shopCodeController = TextEditingController();


  TextEditingController shopNameController = TextEditingController();

  TextEditingController shopPhoneNumberController = TextEditingController();


  TextEditingController shopAddressController = TextEditingController();

  FocusNode BusinessNameFocus = FocusNode();
  FocusNode BusinessEmailAddressFocus = FocusNode();
  FocusNode descriptionFocus = FocusNode();
  FocusNode subDescriptionFocus = FocusNode();
  FocusNode shopCodeFocus = FocusNode();
  FocusNode shopNameFocus = FocusNode();
  FocusNode shopPhoneNumberFocus = FocusNode();
  FocusNode shopAddressFocus = FocusNode();


  bool isLoading = false;
  bool readOnly = false;

  late XFile? image;
  late ImagePicker _picker = ImagePicker();



  late File? iFile;
  bool isImageSelected = false;




 late  DocumentSnapshot documentSnapshot;


  init(String uniqId)
 async {
   updateButtonStatus(true);

   print("the uniq id is ${uniqId}");
   Future.delayed(Duration(seconds: 3));
   documentSnapshot = await FireStoreGateway.getSingleDeal(uniqId);

   BusinessNameController.text=documentSnapshot["businessName"];

   BusinessEmailAddressController.text =documentSnapshot["businessEmail"];

   BusinessEmailAddressController.text = documentSnapshot["businessEmail"].toString();

   descriptionController.text = documentSnapshot["description"].toString();

   subDescriptionController.text = documentSnapshot["subDescription"].toString();

   shopCodeController.text = documentSnapshot["shopCode"].toString();


   shopNameController.text = documentSnapshot["shopName"].toString();

   shopPhoneNumberController.text = documentSnapshot["shopPhoneNumber"];


   shopAddressController.text = documentSnapshot["shopAddress"].toString();

   updateButtonStatus(false);
   update();





    update();
  }



  pickImageFormGallary() async {
    image = await _picker.pickImage(source: ImageSource.gallery);
    iFile = await File(image!.path);


    isImageSelected = true;
    update();
  }

  pickImageFromCamera() async {
    image = await _picker.pickImage(source: ImageSource.camera);
    iFile = File(image!.path);
    isImageSelected = true;

    update();
  }

 String shopdata = "";


  EditDealController({required this.shopdata})
  {

    if(shopdata !="")
    {
      init(shopdata);
    }
    update();
  }




  updateButtonStatus(bool value)
  {
    isLoading=value;
    update();
  }



  createDeal()
  async {
    updateButtonStatus(true);


    Map<String,dynamic> dealData={};
    String image="";
if(isImageSelected)
  {
   image= await FirebaseStorageService.postFile(iFile!,"DealImages/");
  }


    dealData["imageLink"]= isImageSelected ? image : documentSnapshot["imageLink"];
    dealData["userId"]=(Get.find<LocalDatabase>().getStorageInstance.read(AppStrings.token)).toString();
    dealData["dealUniqId"]=documentSnapshot["dealUniqId"];
    dealData["businessName"]=BusinessNameController.text;
    dealData["businessEmail"]=BusinessEmailAddressController.text;
    dealData["description"]=descriptionController.text;
    dealData["subDescription"]=subDescriptionController.text;
    dealData["shopCode"]=shopCodeController.text;
    dealData["shopName"]=shopNameController.text;
    dealData["shopPhoneNumber"]=shopPhoneNumberController.text;
    dealData["shopAddress"]=shopAddressController.text;

    await FireStoreGateway.updateSingleDeal(documentSnapshot["dealUniqId"], dealData);



    // go to payment procedure

    updateButtonStatus(false);
    Get.back();

  }

}


