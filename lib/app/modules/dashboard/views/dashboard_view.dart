import 'package:google_fonts/google_fonts.dart';
import 'package:perpustakaandigital/app/modules/listpeminjaman/views/listpeminjaman_view.dart';
import 'package:perpustakaandigital/app/modules/home/views/home_view.dart';
import 'package:perpustakaandigital/app/modules/profile/controllers/profile_controller.dart';
import 'package:perpustakaandigital/app/modules/profile/views/profile_view.dart';
import 'package:perpustakaandigital/app/modules/bookmark/views/bookmark_view.dart';
import 'package:perpustakaandigital/app/modules/history/views/history_view.dart';
import 'package:flutter/material.dart';

import '../../../components/customBarMaterial.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
           appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black,),
          backgroundColor: const Color(0xFFFBFF00),
        title: const Text(""),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFFFFFFFF),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            width: double.infinity,
            height: 200,
           decoration: BoxDecoration(
                      image: DecorationImage(
                          image: const AssetImage('assets/images/search.png'),
                          fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop)),
                          ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Column(
              children: [
                const Expanded(child: CircleAvatar(backgroundImage: AssetImage("assets/images/profil.png"),radius: 80,),),
                Text(
              'Profile',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900,fontFamily: GoogleFonts.poppins().fontFamily),)
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              controller.changeTabIndex(1);
            },
            leading: Icon(
              Icons.home,
              size: 35,
              color: Colors.blue[600],
            ),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900,fontFamily: GoogleFonts.poppins().fontFamily),
            ),
          ),
          ListTile(
            onTap: () {
              controller.changeTabIndex(2);
            },
            leading: Icon(
              Icons.date_range,
              size: 35,
              color: Colors.blue[600],
            ),
            title: Text(
              'List Peminjaman',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900,fontFamily: GoogleFonts.poppins().fontFamily),
            ),
          ),
          ListTile(
            onTap: () {
              controller.changeTabIndex(3);
            },
            leading: Icon(
              Icons.history,
              size: 35,
              color: Colors.blue[600],
            ),
            title: Text(
              'Riwayat Peminjaman',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900,fontFamily: GoogleFonts.poppins().fontFamily),
            ),
          ),
          ListTile(
            onTap: () {
              controller.changeTabIndex(4);
            },
            leading: Icon(
              Icons.bookmark,
              size: 35,
              color: Colors.blue[600],
            ),
            title: Text(
              'Favorit Saya',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900,fontFamily: GoogleFonts.poppins().fontFamily),
            ),
          ),
          ListTile(
            onTap: () {
               final ProfileController profileController = Get.put(ProfileController());
               profileController.logout();
            },
            leading: Icon(
              Icons.logout,
              size: 35,
              color: Colors.blue[600],
            ),
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900,fontFamily: GoogleFonts.poppins().fontFamily),
            ),
          ),
        ],),
      ),
            body: SafeArea(
              child: SafeArea(
                child: Center(
                    child: IndexedStack(
                  index: controller.tabIndex,
                  children: const [
                    ProfileView(),
                    HomeView(),
                    HistoryView(),
                    ListpeminjamanView(),
                    BookmarkView(),
                  ],
                )),
              ),
            ),
            bottomNavigationBar: CustomBottomBarMaterial(
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex,
            ));
      },
    );
  }
}
