import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PPAndTC extends StatefulWidget {

  late String type;

  PPAndTC({required this.type});

  @override
  _PPAndTCState createState() => _PPAndTCState();


}

class _PPAndTCState extends State<PPAndTC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.type == "PP" ? "Privacy Policy" : "Terms & Conditions"),backgroundColor: Colors.red,),
      body: Center(
        child: SfPdfViewer.asset(widget.type == "PP" ?"assets/pdf/privacy_policy.pdf": "assets/pdf/terms_conditions.pdf"),

      ),
    );
  }
}
