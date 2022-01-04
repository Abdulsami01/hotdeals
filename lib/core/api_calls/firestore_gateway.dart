import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:get/get.dart';
import 'package:hotdealsgemet/core/app_rss/app_strings.dart';

class FireStoreGateway extends GetxController {
  createUser(Map<String, dynamic> userData) async {
    await FirebaseFirestore.instance
        .collection(AppStrings.USERS)
        .doc(userData[AppStrings.userUniqId])
        .set(userData);
  }

  updateUser(Map<String, dynamic> userData, String uniqueId) async {
    await FirebaseFirestore.instance
        .collection(AppStrings.USERS)
        .doc(uniqueId)
        .update(userData);

    //await GetxFire.firestore.updateData(collection: AppStrings.USERS, data: userData,id: uniqueId);
  }

  uploadImage(File file) async {
    //var data =await GetxFire.storage.uploadFile(imageToUpload: file, title: "hari krishna", fileType: "filetype", folder: "folder");

    await postFile(file, "userProfiles");
  }

  createDeal(Map<String, dynamic> userData) async {
    await FirebaseFirestore.instance
        .collection(AppStrings.deals)
        .doc(userData[AppStrings.dealUniqId])
        .set(userData);
    // await GetxFire.firestore.createData(collection: AppStrings.deals, data: userData,id: userData[AppStrings.dealUniqId]);
  }

  static Future<String> postFile(File imageFile, String folderPath) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    Reference reference =
        FirebaseStorage.instance.ref().child(folderPath).child(fileName);

    TaskSnapshot storageTaskSnapshot = await reference.putFile(imageFile);

    print(storageTaskSnapshot.ref.getDownloadURL());

    String dowUrl = await storageTaskSnapshot.ref.getDownloadURL();

    return dowUrl;
  }

  checkUserBusinessAccount(String id) async => await FirebaseFirestore.instance
      .collection(AppStrings.businessDictonary)
      .doc(id)
      .get();

  createBusinessAccount(Map<String, String> data, String userID) async {
    await FirebaseFirestore.instance
        .collection(AppStrings.businessDictonary)
        .doc(userID)
        .set(data);
  }
}
