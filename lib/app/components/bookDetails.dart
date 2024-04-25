import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:perpustakaandigital/app/data/constans/constans.dart';
import 'package:perpustakaandigital/app/data/models/response_ulasan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:perpustakaandigital/app/data/models/response_detailsbook.dart';

class MyBookDetails extends StatelessWidget {
  const MyBookDetails(
      {super.key,
      required this.dataBookDetails,
      required this.dataUlasan,
      required this.controller});
  final DataBookDetails dataBookDetails;
  final List<DataUlasan>? dataUlasan;
  final controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 70),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(dataBookDetails.coverBuku.toString()),
                fit: BoxFit.cover),
          ),
          child: Row(
            children: [
              Container(
                height: 190,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    image: DecorationImage(
                        image:
                            NetworkImage(dataBookDetails.coverBuku.toString()),
                        fit: BoxFit.fill)),
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(dataBookDetails.judulBuku.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily:
                              GoogleFonts.poppins(fontWeight: FontWeight.w700)
                                  .fontFamily,
                          fontSize: 20),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  Text("By ${dataBookDetails.penulisBuku.toString()}",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily:
                              GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                  .fontFamily,
                          fontSize: 17),
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis),
                  RatingBarIndicator(
                    direction: Axis.horizontal,
                    rating: dataBookDetails.rating!.toDouble(),
                    itemCount: 5,
                    itemSize: 24,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: dataBookDetails.kategori!
                              .map(
                                (e) => Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: kSecondaryColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    e.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500)
                                          .fontFamily,
                                    ),
                                  ),
                                ),
                              )
                              .toList()),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            Expanded(
              flex: 16,
              child: ElevatedButton(
                onPressed: () => controller.showMyPinjam(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1ED900),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.01),
                  ),
                ),
                child: Text(
                  'PINJAM',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily:
                          GoogleFonts.baloo2(fontWeight: FontWeight.bold)
                              .fontFamily),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Obx(
              () => GestureDetector(
                  onTap: () => controller.addKoleksiBuku(),
                  child: FaIcon(
                      controller.detailBuku.value.koleksi == true
                          ? FontAwesomeIcons.heartCircleCheck
                          : FontAwesomeIcons.heart,
                      color: Colors.red)),
            )),
            const Expanded(child: SizedBox()),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFFFBFF00),
            borderRadius: BorderRadius.circular(5),
          ),
          child: ReadMoreText(
            dataBookDetails.deskripsi.toString(),
            trimLines: 5,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: " Baca Selengkapnya ",
            trimExpandedText: " Show Less ",
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue[700],
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue[700],
            ),
            style: TextStyle(
                fontFamily:
                    GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily,
                fontSize: 20),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Ulasan Buku",
          style: TextStyle(
              fontFamily:
                  GoogleFonts.poppins(fontWeight: FontWeight.w700).fontFamily,
              fontSize: 20),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20),
        Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: const EdgeInsets.only(bottom: 100),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color:  const Color(0xFFFBFF00),
              borderRadius: BorderRadius.circular(5),
            ),
            child: buildUlasanList())
      ]),
    );
  }

  Widget buildUlasanList() {
    final width = MediaQuery.of(Get.context!).size.width;

    return dataUlasan!.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dataUlasan!.length,
            itemBuilder: (context, index) {
              DataUlasan ulasan = dataUlasan![index];
              return Container(
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: width,
                height: 80,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        ulasan.ulasan ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 20.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          '• ${ulasan.username}' ?? '',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFE84218),
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        : Container(
            width: width,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xFF424242),
                width: 0.5,
              ),
            ),
            child: Text(
              'Belum ada ulasan buku',
              style: GoogleFonts.inriaSans(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
          );
  }
}
