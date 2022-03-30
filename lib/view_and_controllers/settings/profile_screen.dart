import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
import 'package:hotdealsgemet/view_and_controllers/settings/settings_screen_controller.dart';
import 'package:hotdealsgemet/widget/custom_spacing.dart';

class ProfileScreen extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
        builder: (SettingsController controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Profile Settings"),
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              VerticalSpacing(value: 20),
              ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    height: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12)),
                    child: controller.iFile == null
                        ? Image(
                            image: AssetImage(AppAssets.noprofilepicture),
                          )
                        : Image(
                            image: FileImage(controller.iFile!),
                          ),
                  )),
              VerticalSpacing(value: 15),
              InkWell(
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) {
                      return CupertinoActionSheet(
                        actions: <CupertinoActionSheetAction>[
                          CupertinoActionSheetAction(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  CupertinoIcons.camera,
                                  color: CupertinoColors.systemBlue,
                                ),
                                HorizontalSpacing(value: 10),
                                const Text('Open Camera'),
                              ],
                            ),
                            onPressed: () {
                              controller.pickImageFromCamera();
                              Navigator.pop(context);
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: Row(
                              children: [
                                const Icon(
                                  CupertinoIcons.collections,
                                  color: CupertinoColors.systemBlue,
                                ),
                                HorizontalSpacing(value: 10),
                                const Text('Open Gallary'),
                              ],
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ),
                            onPressed: () {
                              controller.pickImageFormGallary();

                              Navigator.pop(context);
                            },
                          )
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.red.shade500,
                      borderRadius: BorderRadius.circular(5)),
                  alignment: Alignment.center,
                  child: Text(
                    "Add profile photo",
                    style: textStyleWidget(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
              VerticalSpacing(value: 25),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(233, 230, 230, 100),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: controller.userNameController,
                  style: textStyleWidget(
                      fontSize: FontSize.normalText,
                      fontWeight: FontWights.normal,
                      color: Colors.black.withOpacity(.5),
                      letterSpacing: 1.2),
                  decoration: InputDecoration(
                    hintText: "User Name",
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
                  cursorColor: Colors.black45,
                ),
              ),
            ],
          ),
        ),
        extendBody: true,
        bottomNavigationBar: InkWell(
          onTap: () {
            if (controller.userNameController.text.isEmpty &&
                controller.iFile == null) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: const Text(
                    "Select image or Enter userName to update user profile"),
              ));
              return;
            }
            print("updateUser called");
            controller.updateUser(controller.iFile!);
          },
          child: Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(5)),
            alignment: Alignment.center,
            child: controller.isLoading
                ? SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(),
                  )
                : Text(
                    "Update",
                    style: textStyleWidget(color: Colors.white, fontSize: 16),
                  ),
          ),
        ),
      );
    });
  }
}
