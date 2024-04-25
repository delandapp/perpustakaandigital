import 'package:perpustakaandigital/app/data/models/response_buku.dart';
import 'package:flutter/material.dart';
import 'package:perpustakaandigital/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/constans/constans.dart';
import 'package:auto_size_text/auto_size_text.dart';

class buildSection extends StatelessWidget {
  const buildSection({
    super.key,
    required this.data,
  });

  final DataBuku data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.kategoriBuku.toString(),
                    style: TextStyle(
                      height: 1.2,
                      fontFamily: GoogleFonts.poppins(
                        fontWeight: FontWeight.w900,
                      ).fontFamily,
                      fontSize: 16.0,
                      color: const Color(0xff09142E),
                    ),
                  ),
                  ColoredBox(
                    color: const Color(0xFFFBFF00),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: 3,
                    ),
                  )
                ],
              ),
              GestureDetector(
                  onTap: () => Get.toNamed(Routes.KATEGORI, parameters: {"kategori" : data.kategoriBuku.toString()}),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color(0xFFFBFF00), shape: BoxShape.circle),
                    child: const FaIcon(
                      size: 15,
                      color: Colors.black,
                      FontAwesomeIcons.chevronRight,
                    ),
                  )),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.22,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: data.buku!
                    .map((e) => SizedBox(
                      width: MediaQuery.of(context).size.width * 0.38,
                      child: GestureDetector(
                        onTap: () => Get.toNamed(Routes.DETAILBOOK, parameters: {"idbook" : e.bukuID.toString()}),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ColoredBox(
                            color: const Color(0xFFFBFF00),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 20,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        e.coverBuku.toString(),
                                        fit: BoxFit.fill,
                                        width: MediaQuery.of(context).size.width * 0.3,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.26,
                                    child: AutoSizeText(
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      minFontSize: 16,
                                      maxFontSize: 20,
                                      e.judul.toString(),
                                      style: TextStyle(
                                        height: 1.2,
                                        fontWeight: FontWeight.w900,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 16.0,
                                        color: const Color(0xff09142E),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ))
                    .toList(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
