import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/info_pluitcare_controller.dart';

class InforsbkcareView extends GetView<InforsbkcareController> {
  const InforsbkcareView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info RSBK HealthCare'),
        centerTitle: true,
        elevation: 1,
      ),
      body: Center(
        child: Text(
          'InforsbkcareView is working',
          style: GoogleFonts.nunito(fontSize: 20),
        ),
      ),
    );
  }
}
