import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
import 'package:hotdealsgemet/view_and_controllers/fav_deals/fav_deals_screen_controller.dart';
import 'package:hotdealsgemet/widget/deal_widget.dart';

class FavDeals extends GetView<FavDealsController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavDealsController>(
        init: FavDealsController(),
        builder: (FavDealsController controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("Favorite Deals"),
              backgroundColor: AppColors.colorPalleteRed,
            ),
            body: controller.isLoading
                ? Center(
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: controller.listOfAllFavDeals.length,
                            itemBuilder: (_, index) {
                              return DealWidget(
                                  controller.listOfAllFavDeals[index]);
                            })
                      ],
                    ),
                  ),
          );
        });
  }
}
