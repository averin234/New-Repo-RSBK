import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
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

  final _packageName = ''.obs;
  String get packageName => _packageName.value;

  late final DeviceInfoPlugin deviceInfo;

  @override
  void onInit() async{
    super.onInit();

    deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _packageName.value = packageInfo.version;

  }

}
