import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perpustakaandigital/app/data/models/response_laporan.dart';
import 'package:flutter_dash/flutter_dash.dart';

class MyLaporan extends StatelessWidget {
  const MyLaporan({super.key, required this.data});
  final DataLaporan data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 40,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                top: 50,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Text(
                        "PEMINJAMAN BERHASIL",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "TANGGAL PINJAM",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 10),
                            ),
                            Text(
                              data.tanggalPinjam.toString(),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                       const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "TANGGAL KEMBALI",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 10),
                            ),
                            Text(
                              data.tanggalPinjam.toString(),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ID PEMINJAMAN",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 10),
                            ),
                            Text(
                              data.peminjamanID.toString(),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "KODE PEMINJAMAN",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 10),
                            ),
                            Text(
                              data.kodePeminjaman.toString(),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Dash(direction: Axis.horizontal,length: 340, dashLength: 3, dashColor: Colors.black),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "NAMA",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 10),
                            ),
                            Text(
                              data.username.toString(),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "NAMA BUKU",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 10),
                            ),
                            Text(
                              data.judulBuku.toString(),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset("assets/images/Check.png")
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
