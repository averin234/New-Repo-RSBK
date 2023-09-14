import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rsbkcare/app/data/model/antrian_rs/jadwal_px.dart';
import '../../../../data/componen/my_font_size.dart';
import '../../../../data/model/profile_pasien/data_px.dart';
import '../../../../routes/app_pages.dart';

class CardListViewAntrian extends StatelessWidget {
  final Lists list;
  final DataPx scan;

  const CardListViewAntrian(
      {super.key, required this.list, required this.scan});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(Routes.DETAIL_ANTRIAN,
                arguments: {'data': list, 'scan': scan});
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            padding: const EdgeInsets.only(top: 10, left: 20),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0x6cc7d1db)),
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : Color(0xff404258),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.local_hospital,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        list.namaBagian ?? '',
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ]),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  // 'rumah sakit pluit',
                  list.namaKlinik ?? '',
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: MyFontSize.large2),
                ),
                const SizedBox(
                  height: 9,
                ),
                const Divider(
                  indent: 5,
                  endIndent: 20,
                  thickness: 1.5,
                  height: 2,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.grey,
                    ),
                    const Text("Jadwal Antrean :"),
                    Text(
                      (list.tgl ?? '').substring(0, 10),
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 15),
                    ),
                    CustomButton(label: 'Lihat Detail', onPressed: () {}),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const CustomButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0),
            topLeft: Radius.circular(12),
            bottomRight: Radius.circular(12)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xff4babe7),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            label,
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}
