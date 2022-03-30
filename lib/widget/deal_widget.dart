import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotdealsgemet/core/app_rss/font_size.dart';
import 'package:hotdealsgemet/core/app_rss/font_weights.dart';
import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';

import 'package:hotdealsgemet/core/services/local_database.dart';
import 'package:hotdealsgemet/widget/custom_spacing.dart';
import 'package:hotdealsgemet/widget/textstyle_widget.dart';

class DealWidget extends StatefulWidget {
  late DocumentSnapshot data;

  @override
  _DealWidgetState createState() => _DealWidgetState();

  DealWidget(this.data);
}

class _DealWidgetState extends State<DealWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black.withOpacity(.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              width: double.infinity,
              height: 150,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(widget.data["imageLink"]),
              ),
            ),
          ),
          VerticalSpacing(value: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.data["description"],
                style: textStyleWidget(
                    color: Colors.red,
                    fontSize: FontSize.h2,
                    fontWeight: FontWights.semiBold),
              ),
              //Favourite Icon
              Get.find<LocalDatabase>().getToken == null ||
                      Get.find<LocalDatabase>().getToken == ""
                  ? InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "Login into the app to add this as your fav deal"),
                        ));
                      },
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.black.withOpacity(.5),
                      ))
                  : StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Fav')
                          .doc(Get.find<LocalDatabase>().getToken)
                          .collection("Favs")
                          .snapshots(),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          List<DocumentSnapshot> data = snapshot.data!.docs;

                          bool value = false;
                          print("cut line");
                          data.forEach((element) {
                            if (element["id"].toString() ==
                                widget.data["dealUniqId"].toString()) {
                              value = true;
                            }
                          });

                          return value
                              ? Icon(
                                  Icons.favorite_border,
                                  color: Colors.black.withOpacity(.5),
                                )
                              : Icon(
                                  Icons.favorite,
                                  color: Colors.red.withOpacity(.8),
                                );
                        }
                        return Icon(
                          Icons.favorite_border,
                          color: Colors.black.withOpacity(.5),
                        );
                      },
                    )
            ],
          ),
          VerticalSpacing(value: 5),
          Row(
            children: [
              Text('*'),
              Text(
                widget.data["subDescription"],
                style: textStyleWidget(
                    color: Colors.black.withOpacity(.7),
                    fontSize: FontSize.normalText,
                    fontWeight: FontWights.semiBold),
              ),
            ],
          ),
          VerticalSpacing(value: 5),
          Text(
            widget.data["shopName"],
            style: textStyleWidget(
                color: Colors.black.withOpacity(.6),
                fontSize: FontSize.smallText,
                fontWeight: FontWights.semiBold),
          ),
          VerticalSpacing(value: 5),
          Text(
            widget.data["shopAddress"],
            style: textStyleWidget(
                color: Colors.black.withOpacity(.5),
                fontSize: FontSize.smallText,
                fontWeight: FontWights.semiBold),
          ),
          VerticalSpacing(value: 5),
          Text(
            widget.data["shopPhoneNumber"],
            style: textStyleWidget(
                color: Colors.black.withOpacity(.5),
                fontSize: FontSize.subText_01,
                fontWeight: FontWights.semiBold),
          ),
          VerticalSpacing(value: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'CODE:',
                style: TextStyle(
                    color: Colors.blueAccent.withOpacity(.8),
                    fontSize: FontSize.h1,
                    fontWeight: FontWights.semiBold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                widget.data["shopCode"],
                style: textStyleWidget(
                    color: Colors.blueAccent.withOpacity(.8),
                    fontSize: FontSize.h1,
                    fontWeight: FontWights.semiBold),
              ),
              // Get.find<LocalDatabase>().getToken == null ||
              //         Get.find<LocalDatabase>().getToken == ""
              //     ? InkWell(
              //         onTap: () {
              //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //             content: Text(
              //                 "Login into the app to add this as your fav deal"),
              //           ));
              //         },
              //         child: Icon(
              //           Icons.favorite_border,
              //           color: Colors.black.withOpacity(.5),
              //         ))
              //     : StreamBuilder<QuerySnapshot>(
              //         stream: FirebaseFirestore.instance
              //             .collection('Fav')
              //             .doc(Get.find<LocalDatabase>().getToken)
              //             .collection("Favs")
              //             .snapshots(),
              //         builder: (_, snapshot) {
              //           if (snapshot.hasData) {
              //             List<DocumentSnapshot> data = snapshot.data!.docs;
              //
              //             bool value = false;
              //             print("cut line");
              //             data.forEach((element) {
              //               if (element["id"].toString() ==
              //                   widget.data["dealUniqId"].toString()) {
              //                 value = true;
              //               }
              //             });
              //
              //             return value
              //                 ? Icon(
              //                     Icons.favorite_border,
              //                     color: Colors.black.withOpacity(.5),
              //                   )
              //                 : Icon(
              //                     Icons.favorite,
              //                     color: Colors.red.withOpacity(.8),
              //                   );
              //           }
              //           return Icon(
              //             Icons.favorite_border,
              //             color: Colors.black.withOpacity(.5),
              //           );
              //         },
              //       )
            ],
          ),
        ],
      ),
    );
  }
}
