import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsbkcare/app/modules/daftar_antrian/controllers/daftar_antrian_controller.dart';

import '../../../../data/componen/fetch_data.dart';
import '../../../shammer/shimmer_antrian.dart';

class WidgetTitleAntrian extends StatelessWidget {
  final String msg;
  const WidgetTitleAntrian({Key? key, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DaftarAntrianController());
    return FutureBuilder(
      future: API.getDataPx(noKtp: controller.dataPasien.value.noKtp ?? ''),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState != ConnectionState.waiting &&
            snapshot.data != null) {
          final scan = snapshot.data!;
          return scan == 200
              ? Container(
                  decoration: const BoxDecoration(
                    color: Color(0xff4babe7),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Penting !!",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17)),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                            "Pasien Belum Terdaftar di RS, Harap membawa KTP Saat datang ke Unit Registrasi Guna Melakukan Verifikasi",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 14)),
                        Text(msg),
                      ],
                    ),
                  ),
                )
              : SizedBox(height: 20);
        } else {
          return SizedBox(height: 20);
        }
      },
    );
  }
}
