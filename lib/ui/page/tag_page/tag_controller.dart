import 'package:app/base/get/getx_controller_inject.dart';
import 'package:app/model/ContactInfo.dart';

class TagController extends BaseGetController{
  List<ContactInfo> contacts = [
    ContactInfo(name: "", tagIndex: ''),
    ContactInfo(name: "aurest", tagIndex: 'a'),
    ContactInfo(name: "beng", tagIndex: 'b'),
    ContactInfo(name: "cheng", tagIndex: 'c'),
    ContactInfo(name: "dengs", tagIndex: 'd'),
  ];

  @override
  void onInit() {
    super.onInit();
  }
}