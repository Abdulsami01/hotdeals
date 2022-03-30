import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:hotdealsgemet/core/api_calls/firestore_gateway.dart';
import 'package:hotdealsgemet/core/app_rss/app_strings.dart';
import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
import 'package:hotdealsgemet/core/services/local_database.dart';
import 'package:hotdealsgemet/view_and_controllers/edit_deal/edit_deal_screen.dart';

class UserDeals extends StatefulWidget {
  const UserDeals({Key? key}) : super(key: key);

  @override
  _UserDealsState createState() => _UserDealsState();
}

class _UserDealsState extends State<UserDeals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Biz Deals"),
        backgroundColor: Colors.red,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(AppStrings.deals)
            .where("userId", isEqualTo: Get.find<LocalDatabase>().getToken)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            List<DocumentSnapshot> data = snapshot.data!.docs;
            return SingleChildScrollView(

                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount:  data.length,

                  itemBuilder: (_,index){
                    return  dealWidget(data[index]);
                  },
                    ),

            );
          }
          return Container();
        },
      ),
    );
  }


  dealWidget( data)
  {


    bool isActive =false;
    int daysCounts =0;
    Timestamp stamp = data["paidData"];
    DateTime paidDate = stamp.toDate();


    Timestamp stamp1 = data["expireData"];
    DateTime expireDate = stamp1.toDate();



    int daysCount =expireDate.difference(DateTime.now()).inDays;
    print("the days cound is $daysCount");
    if(!daysCount.isNegative)
    {
      daysCounts=daysCount;
     isActive=true;
    }


   return  Container(
      margin: EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
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
                image: NetworkImage(data["imageLink"]),
              ),
            ),
          ),
          VerticalSpacing(value: 10),
          Text(
          data["description"],
            style: textStyleWidget(
                color: Colors.red,
                fontSize: FontSize.h2,

                fontWeight: FontWights.semiBold),
          ),
          VerticalSpacing(value: 5),
          Text(
           data["subDescription"],
            style: textStyleWidget(
                color: Colors.black.withOpacity(.7),
                fontSize: FontSize.normalText,
                fontWeight: FontWights.semiBold),
          ),
          VerticalSpacing(value: 5),
          Text(
            data["shopName"],
            style: textStyleWidget(
                color: Colors.black.withOpacity(.6),
                fontSize: FontSize.smallText,
                fontWeight: FontWights.semiBold),
          ),
          VerticalSpacing(value: 5),
          Text(
            data["shopAddress"],
            style: textStyleWidget(
                color: Colors.black.withOpacity(.5),
                fontSize: FontSize.smallText,
                fontWeight: FontWights.semiBold),
          ),
          VerticalSpacing(value: 5),
          Text(
            data["shopPhoneNumber"],
            style: textStyleWidget(
                color: Colors.black.withOpacity(.5),
                fontSize: FontSize.subText_01,
                fontWeight: FontWights.semiBold),
          ),
          VerticalSpacing(value: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isActive ?   Text(
                "${daysCounts.round()} days remaining",
                style: textStyleWidget(
                    color: Colors.green.withOpacity(.5),
                    fontSize: FontSize.subText_01,
                    fontWeight: FontWights.semiBold),
              ):   Text(
                "Expired  ${daysCounts.round()} ago",
                style: textStyleWidget(
                    color: Colors.red.withOpacity(.5),
                    fontSize: FontSize.subText_01,
                    fontWeight: FontWights.semiBold),
              ),

             Row(
               children: [
                 IconButton(onPressed: (){
                   print("printing data from deal page ${data["shopAddress"]}");
                   Get.to(EditDeal(dealUniqId: data["dealUniqId"]));
                 },
                   icon: Icon(Icons.edit),color: AppColors.colorPalleteRed,),
                 IconButton(onPressed: (){
                   !isActive? FireStoreGateway.deleteDeal(data["dealUniqId"]) : null;

                 },
                   icon: Icon(Icons.delete),color: AppColors.colorPalleteRed,),

               ],
             )
            ],
          ),
        ],
      ),
    );
  }
}
