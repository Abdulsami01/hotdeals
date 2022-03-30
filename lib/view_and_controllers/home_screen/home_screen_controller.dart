import 'package:get/get.dart';
import 'package:hotdealsgemet/core/api_calls/firestore_gateway.dart';
import 'package:hotdealsgemet/view_and_controllers/settings/settings_screen_controller.dart';

class HomeScreenController extends GetxController {
  bool isLoading = false;

  HomeScreenController() {
    fetchProfile();
  }

  String url = "";

  fetchProfile() async {
    controlLoading(true);
    Future.delayed(Duration(seconds: 5));

    //url =await  FireStoreGateway.getVideo();
    update();
    controlLoading(false);
  }

  controlLoading(bool value) {
    isLoading = value;
    update();
  }
}
