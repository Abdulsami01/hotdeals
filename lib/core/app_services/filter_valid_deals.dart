

import 'package:cloud_firestore/cloud_firestore.dart';

mixin FitlerDeals
{



  List<DocumentSnapshot> returnValidDeals(List<DocumentSnapshot> listOfDeal)
  {
    List<DocumentSnapshot> temp =[];
    listOfDeal.forEach((element) {

      Timestamp stamp = element["paidData"];
      DateTime paidDate = stamp.toDate();


      Timestamp stamp1 = element["expireData"];
      DateTime expireDate = stamp1.toDate();



      int daysCount =expireDate.difference(paidDate).inDays;
      if(!daysCount.isNegative)
      {
        temp.add(element);
      }
    });

    return temp;
  }


}