import 'package:flutter/material.dart';
import 'package:rsbkcare/app/data/componen/publics.dart';
import 'package:get/get.dart';

class SettingProfileController extends GetxController {
  //TODO: Implement SettingProfileController
  //TODO: Implement HomeController
  final dataRegist = Publics.controller.getDataRegist;
  final bagianValue = '';
  final pwlama = TextEditingController();
  final pwbaru = TextEditingController();
  final pwbaruconfirm = TextEditingController();
}
