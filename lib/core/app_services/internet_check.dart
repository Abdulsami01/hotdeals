import 'package:internet_connection_checker/internet_connection_checker.dart';

mixin InternetService

{


  checkInternet()async  => await InternetConnectionChecker().hasConnection;





}