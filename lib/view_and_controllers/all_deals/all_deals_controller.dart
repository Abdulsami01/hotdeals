

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hotdealsgemet/core/api_calls/firebase_storage.dart';
import 'package:hotdealsgemet/core/app_rss/app_strings.dart';
import 'package:hotdealsgemet/core/app_services/fav_mixin.dart';
import 'package:hotdealsgemet/core/app_services/filter_valid_deals.dart';
import 'package:hotdealsgemet/core/services/local_database.dart';

class AllDealsController extends GetxController with FavService , FitlerDeals {
  bool isLoading = false;
  List<DocumentSnapshot> listOfDeals = [];

  late final db = Get.find<LocalDatabase>();
  late final instance;

  late Stream stream;


  AllDealsController()
  {
    getAllDeals();
  }

   getAllDeals()
   async{
     instance = db.getStorageInstance;

     loadingController(true);

     listOfDeals.clear();

     List<DocumentSnapshot> listOfDeal = await FirebaseStorageService.getAllDeals();
    listOfDeals=returnValidDeals(listOfDeal);

     print("list of deals lenth is ${listOfDeals.length}");
     loadingController(false);
     update();
   }

  loadingController(bool value) {
    isLoading = value;
    update();
  }

  fetchAllFavDeals() async {
    DocumentSnapshot favDocs = await FirebaseFirestore.instance
        .collection('Fav')
        .doc(instance.read(AppStrings.token))
        .get();
    print("data");
    print(favDocs);
  }

  updateDealToFav(String id);

}

