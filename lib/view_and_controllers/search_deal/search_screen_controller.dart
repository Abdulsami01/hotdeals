import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:hotdealsgemet/core/api_calls/firebase_storage.dart';
import 'package:hotdealsgemet/core/app_rss/app_strings.dart';
import 'package:hotdealsgemet/core/app_services/filter_valid_deals.dart';
import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
import 'package:hotdealsgemet/core/services/local_database.dart';

class SearchDealController extends GetxController  with FitlerDeals{
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  List<DocumentSnapshot> listOfDeals = [];
  late final db = Get.find<LocalDatabase>();
  late final instance;
  SearchDealController()
  {
    instance = db.getStorageInstance;
  }

  onChangedListner() async {
    loadingController(true);
    listOfDeals.clear();
    List<DocumentSnapshot> d = await FirebaseStorageService.getAllDeals();

    List<DocumentSnapshot> dd=  returnValidDeals(d).where((element) =>
    searchController.text.contains(element["shopName"])
        ||
        searchController.text.contains(element["description"])

    )
        .toList();
    listOfDeals.addAll(dd);

    print("listOfDeals length is ${listOfDeals.length}");
    loadingController(false);
    update();
  }


  loadingController(bool value) {
    isLoading = value;
    update();
  }

  addToFavDeal(String id) async {
    //checking if this document is already in database or not
    var q = await FirebaseFirestore.instance
        .collection('Fav')
        .doc(instance.read(AppStrings.token))
        .collection("Favs")
        .get();
    List<DocumentSnapshot> d=q.docs;
    print(d.length);
    if (d.isEmpty || d.length==0) {
      print("this fav list is empty");
      await FirebaseFirestore.instance
          .collection('Fav')
          .doc(instance.read(AppStrings.token))
          .collection("Favs")
          .doc(id)
          .set({"id": id});
    }
    else {
      print("document is not null");
      List<DocumentSnapshot> dd=d.where((element) => element.id==id).toList();
      if(dd.isEmpty)
      {
        print("adding to fav list");
        await FirebaseFirestore.instance
            .collection('Fav')
            .doc(instance.read(AppStrings.token))
            .collection("Favs")
            .doc(id)
            .set({"id": id});

      }else
      {
        //delete
        print("already this deals added in fav list so deleting");
        await FirebaseFirestore.instance
            .collection('Fav')
            .doc(instance.read(AppStrings.token))
            .collection("Favs")
            .doc(id).delete();

      }


    }
  }
  @override
  void onClose() {
    searchController.dispose();
  }
}
