import 'package:flutter/cupertino.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
import 'package:hotdealsgemet/core/services/local_database.dart';
import 'package:hotdealsgemet/view_and_controllers/all_deals/all_deals_controller.dart';
import 'package:hotdealsgemet/view_and_controllers/search_deal/search_screen_controller.dart';
import 'package:hotdealsgemet/widget/deal_widget.dart';

class SearchDeals extends GetView<SearchDealController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchDealController>(builder: (builder) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: CupertinoColors.systemRed,
          titleSpacing: 10,

          title: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: controller.searchController,
              autofocus: true,
              style: textStyleWidget(
                  fontSize: FontSize.normalText,
                  fontWeight: FontWights.normal,
                  color: Colors.black.withOpacity(.8),
                  letterSpacing: 1.2),

              decoration: InputDecoration(
                hintText: "Search Deals",
                contentPadding: EdgeInsets.only(bottom: 5, left: 5),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: Color.fromRGBO(233, 230, 230, 100), width: .4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: Color.fromRGBO(233, 230, 230, 100), width: .4),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.red, width: .4),
                ),
              ),
              onSubmitted: (value) {

                controller.onChangedListner();
              },
              onChanged: (value){
                controller.onChangedListner();

              },
              cursorColor: Colors.black45,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              controller.listOfDeals.length == 0 || controller.listOfDeals.isEmpty
                  ? Container(
                    width: double.infinity,
                    height: 500,
                    alignment: Alignment.center,

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            fit: BoxFit.cover,
                            image: AssetImage(AppAssets.search),
                          ),
                          VerticalSpacing(value: 25),
                          Text("Type in search bar the business you would like to find",style: textStyleWidget(color: Colors.black.withOpacity(.5),fontSize: FontSize.normalText,fontWeight: FontWights.semiBold),textAlign: TextAlign.center,),

                        ],
                      ),
                    ),
                  )
                  : ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: controller.listOfDeals.length,
                      itemBuilder: (_, index) {
                        return InkWell(
                            onTap: (){

                              Get.find<LocalDatabase>().getToken== "" || Get.find<LocalDatabase>().getToken== null ? null : controller.addToFavDeal(controller.listOfDeals[index].id);
                            },
                            child: DealWidget(controller.listOfDeals[index]));
                      })
            ],
          ),
        ),
      );
    });
  }
}
