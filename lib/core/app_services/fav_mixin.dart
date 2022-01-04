
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hotdealsgemet/core/app_rss/app_strings.dart';
import 'package:hotdealsgemet/core/services/local_database.dart';

mixin FavService
{

  updateDealToFav(String id)
  async{
    var q = await FirebaseFirestore.instance
        .collection('Fav')
        .doc(Get.find<LocalDatabase>().getStorageInstance.read(AppStrings.token))
        .collection("Favs")
        .get();
    List<DocumentSnapshot> d=q.docs;
    print(d.length);
    if (d.isEmpty || d.length==0) {
      print("this fav list is empty");
      await FirebaseFirestore.instance
          .collection('Fav')
          .doc(Get.find<LocalDatabase>().getStorageInstance.read(AppStrings.token))
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
            .doc(Get.find<LocalDatabase>().getStorageInstance.read(AppStrings.token))
            .collection("Favs")
            .doc(id)
            .set({"id": id});

      }else
      {
        //delete
        print("already this deals added in fav list so deleting");
        await FirebaseFirestore.instance
            .collection('Fav')
            .doc(Get.find<LocalDatabase>().getStorageInstance.read(AppStrings.token))
            .collection("Favs")
            .doc(id).delete();

      }


    }
  }


}