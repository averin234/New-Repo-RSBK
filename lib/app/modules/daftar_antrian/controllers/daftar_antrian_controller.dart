import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rsbkcare/app/data/componen/publics.dart';

class DaftarAntrianController extends GetxController {
  //TODO: Implement DaftarAntrianController

  final dataPasien = Publics.controller.getDataRegist;
  final date = ''.obs;

  @override
  void onInit() {
    String hariIni = DateFormat('yyyy-MM-dd').format(DateTime.now());
    date.value = hariIni;
    super.onInit();
  }
}
