import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:hotdealsgemet/core/api_calls/firebase_storage.dart';
import 'package:hotdealsgemet/core/app_rss/app_strings.dart';
import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
import 'package:hotdealsgemet/core/models/user_profile_model.dart';
import 'package:hotdealsgemet/core/services/local_database.dart';
import 'package:hotdealsgemet/view_and_controllers/home_screen/home_screen.dart';
import 'package:image_picker/image_picker.dart';

class SettingsController extends GetxController
{

  late final  db= Get.find<LocalDatabase>();


  late UserProfile userprofile;
  Map<String,dynamic> json={};

  late final instance;
  SettingsController()
  {
  instance=db.getStorageInstance;
if(instance.read(AppStrings.token)==null || instance.read(AppStrings.token)=="")
  {

  }else
    {
      getUserProfile();
    }

  }



  getUserProfile()
  async{

    print("the  storing token is ${instance.read(AppStrings.token)}");
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('USERS')
        .doc(instance.read(AppStrings.token))
        .get();

      json ={
      "userUniqId":doc["userUniqId"],
      "photoUrl":doc["photoUrl"],
      "userName":doc["userName"],
      "DateTime":doc["DateTime"],
      "eMail":doc["eMail"],
    };

   update();
  }




  late  XFile? image;
  late ImagePicker _picker;
   File? iFile;
   bool isLoading=false;

   TextEditingController userNameController =TextEditingController();

  @override
  void onInit() {
    _picker = ImagePicker();
  }

  pickImageFormGallary()
  async{
    image = await _picker.pickImage(source: ImageSource.gallery);
    iFile=await File(image!.path);

    update();
  }

  pickImageFromCamera()
  async {
    image = await _picker.pickImage(source: ImageSource.camera);
    iFile=File(image!.path);

    update();
  }



  updateUser(File file)
  async{
    controlLoading(true);
    Map<String,String> userData={};


    if(file != null || userNameController.text.isNotEmpty)
      {

        if(userNameController.text.trim().length != 0)
        {
          userData["userName"]=userNameController.text;
        }
        if(file !=null) {
          String imageUrl = await FirebaseStorageService.postFile(
              file, "profiles/");
          userData["photoUrl"] = imageUrl;
        }
        await FirebaseFirestore.instance
            .collection('USERS').doc( Get
            .find<LocalDatabase>()
            .getToken).update(userData);

        DocumentSnapshot doc = await FirebaseFirestore.instance
            .collection('USERS')
            .doc(Get
            .find<LocalDatabase>()
            .getToken)
            .get();

        json ={
          "userUniqId":doc["userUniqId"],
          "photoUrl":doc["photoUrl"],
          "userName":doc["userName"],
          "DateTime":doc["DateTime"],
          "eMail":doc["eMail"],
        };
        Get.offAll(HomeScreen());
      }
    controlLoading(false);
    update();
  }

 controlLoading(bool value)
 {
   isLoading=value;
   update();
 }

}