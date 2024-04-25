import 'package:perpustakaandigital/app/components/starRating.dart';
import 'package:perpustakaandigital/app/data/models/response_bookSearch.dart';
import 'package:flutter/material.dart';
import 'package:perpustakaandigital/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BookSearch extends StatelessWidget {
  const BookSearch({
    super.key,
    required this.data,
  });

  final List<DataBukuSearch> data;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 90),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.6, mainAxisSpacing: 10, crossAxisSpacing: 20),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.toNamed(Routes.DETAILBOOK, parameters: {"idbook" : data[index].bukuID.toString()}),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(data[index].coverBuku.toString()), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 140,
                    width: 100,
                    child: Image.network(data[index].coverBuku.toString(),
                        fit: BoxFit.fill),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFFBFF00),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(data[index].judul.toString(),style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.bold).fontFamily),),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(data[index].deskripsi.toString(),maxLines: 3,overflow: TextOverflow.ellipsis),
                          ),
                          StarRating(
                            rating: data[index].rating!.toDouble(),
                            starColor: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}