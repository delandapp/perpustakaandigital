import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:perpustakaandigital/app/data/models/response_laporan.dart';

import '../controllers/pinjamhistory_controller.dart';

class PinjamhistoryView extends GetView<PinjamhistoryController> {
  const PinjamhistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1,
              decoration: const BoxDecoration(color: Colors.white),
              child: MyPinjamTrue(controller: controller,data: state!.state1!,),
              )
      )
    );
  }
}


class MyPinjamTrue extends StatelessWidget {
  const MyPinjamTrue({super.key, required this.controller, required this.data});
  final PinjamhistoryController controller;
  final DataLaporan data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox.expand(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF000000),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.000000),
                        ),
                      ),
                      child: Text(
                        'Kembali ke Halaman History',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily:
                                GoogleFonts.poppins(fontWeight: FontWeight.bold)
                                    .fontFamily),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          top: 20,
          left: 20,
          right: 20,
          bottom: 50,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/qr.png",
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Status Peminjaman",
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    overflow: TextOverflow.visible,
                    fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w800)
                        .fontFamily,
                    fontSize: 17.0,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nama",
                    style: GoogleFonts.inriaSans(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      isDense: true,
                      fillColor: const Color(0xFFE4E3E3),
                      filled: true,
                      suffixIcon: const Icon(Icons.person),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(color: Color(0xFFE4E3E3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(color: Color(0xFFE4E3E3)),
                      ),
                    ),
                    initialValue:
                        controller.username.toString(),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Buku Yang Dipinjam",
                    style: GoogleFonts.inriaSans(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      isDense: true,
                      fillColor: const Color(0xFFE4E3E3),
                      filled: true,
                      suffixIcon: const Icon(Icons.book),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(color: Color(0xFFE4E3E3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(color: Color(0xFFE4E3E3)),
                      ),
                    ),
                    initialValue:
                        data.judulBuku.toString(),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tanggal Pinjam",
                    style: GoogleFonts.inriaSans(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      isDense: true,
                      fillColor: const Color(0xFFE4E3E3),
                      filled: true,
                      suffixIcon: const Icon(Icons.date_range),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(color: Color(0xFFE4E3E3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(color: Color(0xFFE4E3E3)),
                      ),
                    ),
                    initialValue:
                        data.tanggalPinjam.toString(),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tanggal Kembali",
                    style: GoogleFonts.inriaSans(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      isDense: true,
                      fillColor: const Color(0xFFE4E3E3),
                      filled: true,
                      suffixIcon: const Icon(Icons.date_range),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(color: Color(0xFFE4E3E3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(color: Color(0xFFE4E3E3)),
                      ),
                    ),
                    initialValue:
                        data.deadline.toString(),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Status",
                    style: GoogleFonts.inriaSans(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      isDense: true,
                      fillColor: const Color(0xFFE4E3E3),
                      filled: true,
                      suffixIcon: const Icon(Icons.date_range),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(color: Color(0xFFE4E3E3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(color: Color(0xFFE4E3E3)),
                      ),
                    ),
                    initialValue:
                        data.tanggalKembali.toString() == 'Belum dikembalikan' ? 'Masih Di Pinjam' : 'Sudah Dikembalikan',
                  )
                ],
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ],
    );
  }
}
