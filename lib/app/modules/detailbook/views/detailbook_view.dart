import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perpustakaandigital/app/components/bookDetails.dart';

import '../controllers/detailbook_controller.dart';

class DetailbookView extends GetView<DetailbookController> {
  const DetailbookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.obx(
      (state) => Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: double.infinity,
                    color: Color(0xFFFBFF00),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.arrow_back),
                        Text('Kembali',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                fontFamily: GoogleFonts.poppins().fontFamily))
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.93,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: MyBookDetails(
                      controller: controller,
                      dataBookDetails: state!.state1!,
                      dataUlasan: state.state2!,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
