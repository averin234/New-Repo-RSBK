import 'package:flutter/material.dart';
import 'package:rsbkcare/app/modules/shammer/shimmer_antrian.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rsbkcare/app/data/componen/fetch_data.dart';
import 'package:rsbkcare/app/data/model/profile_pasien/data_px.dart';
import 'package:rsbkcare/app/modules/daftar_antrian/controllers/daftar_antrian_controller.dart';
import 'package:rsbkcare/app/modules/daftar_antrian/views/widgets/widget_listview_antrian.dart';
import 'package:rsbkcare/app/modules/daftar_antrian/views/widgets/widget_title_antrian.dart';
import 'package:rsbkcare/app/modules/daftar_antrian/views/widgets/widgets_select_calender.dart';
import 'package:rsbkcare/app/modules/home/views/widgets/widget_no_antri.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../data/componen/my_font_size.dart';
import '../../../data/componen/my_style.dart';
import '../../../routes/app_pages.dart';
import '../../home/views/home_view.dart';

class DaftarAntrianView extends StatefulWidget {
  const DaftarAntrianView({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _DaftarAntrianViewState createState() => _DaftarAntrianViewState();
}

class _DaftarAntrianViewState extends State<DaftarAntrianView> {
  // this enable our app to able to pull down
  late RefreshController _refreshController; // the refresh controller
  var _scaffoldKey =
      GlobalKey<ScaffoldState>(); // this is our key to the scaffold widget
  @override
  void initState() {
    _refreshController =
        RefreshController(); // we have to use initState because this part of the app have to restart
    super.initState();
  }

  final controller = Get.put(DaftarAntrianController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) =>
                  HomeView()), // Ganti dengan halaman home Anda
        );
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xff4babe7),
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          header: WaterDropMaterialHeader(),
          onLoading: _onLoading,
          onRefresh: _onRefresh,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor:
                    Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : Color(0xff2C3333),
                elevation: 1,
                floating: true,
                pinned: true,
                snap: true,
                stretch: true,
                leading: IconButton(
                    icon: const Icon(Icons.arrow_circle_left_rounded),
                    color: Colors.blue,
                    iconSize: 40,
                    onPressed: () {
                      Get.toNamed(Routes.HOME);
                    }),
                title: Text(
                  "Daftar Antrean",
                  style: GoogleFonts.nunito(
                      fontSize: MyFontSize.large1, fontWeight: FontWeight.bold),
                ),
                bottom: AppBar(
                  backgroundColor: const Color(0xff4babe7),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(0.0),
                    ),
                  ),
                  toolbarHeight: 150,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  title: Column(
                    children: [
                      HorizontalWeekCalendarPackage1(),
                      SizedBox(height: 5)
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  const WidgetTitleAntrian(
                    msg: '',
                  ),
                  Container(
                    height: 1000,
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Color(0xfff6f9fe)
                          : Color(0xff2C3333),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFe0e0e0).withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(2, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20, bottom: 0),
                          child: Text("Antrean Saat ini",
                              style: MyStyle.textTitleBlack),
                        ),
                        FutureBuilder(
                          future: API.getDataPx(
                              noKtp: controller.dataPasien.value.noKtp ?? ''),
                          builder: (context, snapshot) {
                            if (snapshot.hasData &&
                                snapshot.connectionState !=
                                    ConnectionState.waiting &&
                                snapshot.data != null) {
                              final scan = snapshot.data!;
                              if (scan.code == 500) {
                                return Center(
                                  child: listAntrian(scan),
                                );
                              } else {
                                return listAntrian(scan);
                              }
                            } else {
                              return Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  padding: const EdgeInsets.only(top: 30),
                                  child:  Column(
                                    children: [
                                      shimmerAntrian(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      shimmerAntrian(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      shimmerAntrian(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      shimmerAntrian(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      shimmerAntrian(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      shimmerAntrian(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ));
                            }
                          },
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Obx listAntrian(DataPx scan) {
    return Obx(() {
      return FutureBuilder(
          future: API.getJadwalPx(
            noKtp: controller.dataPasien.value.noKtp!,
            tgl: controller.date.value,
          ),
          builder: (context, snapshot1) {
            if (snapshot1.hasData &&
                snapshot1.connectionState != ConnectionState.waiting &&
                snapshot1.data != null) {
              final data = snapshot1.data!;
              if (data.code != 200) {
                return const SizedBox(
                  height: 200,
                  child: Center(
                    child: WidgetNoAntri(),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: data.list!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final list = data.list!;
                    return Container(
                      child: CardListViewAntrian(
                        list: list[index],
                        scan: scan,
                      ),
                    );
                  },
                );
              }
            } else {
              return Container();
            }
          });
    });
  }

  _onLoading() {
    _refreshController
        .loadComplete(); // after data returned,set the //footer state to idle
  }

  _onRefresh() {
    setState(() {
// so whatever you want to refresh it must be inside the setState
      DaftarAntrianView(); // if you only want to refresh the list you can place this, so the two can be inside setState
      _refreshController
          .refreshCompleted(); // request complete,the header will enter complete state,
// resetFooterState : it will set the footer state from noData to idle
    });
  }
}
