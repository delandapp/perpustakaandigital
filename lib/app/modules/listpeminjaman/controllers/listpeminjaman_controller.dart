import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/custom_textfield.dart';
import '../../../data/constans/endpoint.dart';
import '../../../data/models/response_history_peminjaman.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class ListpeminjamanController extends GetxController with StateMixin {
  var historyPeminjaman = RxList<DataHistoryPeminjaman>();
  String idUser = StorageProvider.read(StorageKey.idUser);

  // Post Ulasan
  double ratingBuku = 0;
  final loadingUlasan = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController ulasanController = TextEditingController();
  final loading = false.obs;
  RxBool dataHistoryPeminjaman = false.obs;
  RxInt jumlahData = 0.obs;
  RxInt denda = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getDataPeminjaman();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  deleteHistory(int idbook) async {
    loading(true);
    final bearerToken = StorageProvider.read(StorageKey.bearerToken);
    try {
      final response = await ApiProvider.instance().delete(
          '${Endpoint.pinjam}/$idbook',
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
      if (response.statusCode == 200) {
        loading(false);
        jumlahData.value = jumlahData.value - 1;
      } else {
        change(null, status: RxStatus.error("Gagal Menghapus Data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        loading(false);
        if (e.response?.data != null) {
          change(null,
              status: RxStatus.error("${e.response?.data['message']}"));
          loading(false);
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    }
  }

  Future<void> getDataPeminjaman() async {
    change(null, status: RxStatus.loading());

    try {
      final bearerToken = StorageProvider.read(StorageKey.bearerToken);
      final responseHistoryPeminjaman = await ApiProvider.instance().get(
          '${Endpoint.pinjam}/list',
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));

      if (responseHistoryPeminjaman.statusCode == 200) {
        final ResponseHistoryPeminjaman responseHistory =
            ResponseHistoryPeminjaman.fromJson(responseHistoryPeminjaman.data);

        if (responseHistory.data!.isEmpty) {
          historyPeminjaman.clear();
          change(null, status: RxStatus.empty());
        } else {
          jumlahData.value = responseHistory.data!.length;
          historyPeminjaman.assignAll(responseHistory.data!);
          responseHistory.data!.asMap().forEach((index,e) {
            String dateString = e.deadline.toString();
            String dateString2 = e.tanggalPinjam.toString();
            List<String> dateParts = dateString.split('-');
            List<String> dateParts2 = dateString2.split('-');
            int day = int.parse(dateParts[2]);
            int month = int.parse(dateParts[1]);
            int year = int.parse(dateParts[0]);
            int day2 = int.parse(dateParts2[2]);
            int month2 = int.parse(dateParts2[1]);
            int year2 = int.parse(dateParts2[0]);
            DateTime targetDate = DateTime(year, month, day);
            DateTime targetDateLama = DateTime(year2, month2, day2);
            DateTime now = DateTime.now();

            Duration difference2 = now.difference(targetDate);
            Duration lama = now.difference(targetDateLama);
            int daysDifference = difference2.inDays.toInt();
            int lamaDay = lama.inDays.toInt();
            historyPeminjaman[index].lama = lamaDay;
            historyPeminjaman[index].denda = daysDifference > 0 ? daysDifference * 10000 : 0;
            print("${e.judulBuku.toString()} = ${daysDifference}");
          });
          change(null, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal Memanggil Data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final responseData = e.response?.data;
        if (responseData != null) {
          final errorMessage = responseData['Message'] ?? "Unknown error";
          change(null, status: RxStatus.error(errorMessage));
        }
      } else {
        change(null, status: RxStatus.error(e.message));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  // View Post Ulasan Buku
  Future<void> kontenBeriUlasan(String idBuku, String namaBuku) async {
    return showDialog<void>(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFFFFFff),
          title: Text(
            'Berikan Ulasan Buku',
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w800,
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          content: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(Get.context!).size.width,
              child: Form(
                key: formKey,
                child: ListBody(
                  children: <Widget>[
                    Divider(
                      height: 2,
                      color: Colors.grey.withOpacity(0.20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Rating Buku',
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: RatingBar.builder(
                        allowHalfRating: false,
                        itemCount: 5,
                        minRating: 1,
                        initialRating: 5,
                        direction: Axis.horizontal,
                        itemSize: 50,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Color(0xFFFD5B35),
                        ),
                        onRatingUpdate: (double value) {
                          ratingBuku = value;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Ulasan Buku',
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      preffixIcon: const Icon(Icons.rate_review_rounded),
                      onChanged: (value) {},
                      controller: ulasanController,
                      hintText: 'Ulasan Buku',
                      obsureText: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Pleasse input ulasan buku';
                        }

                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: <Widget>[
            SizedBox(
              width: MediaQuery.of(Get.context!).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: MediaQuery.of(Get.context!).size.width,
                  height: 50,
                  child: TextButton(
                    autofocus: true,
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFFD5B35),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      animationDuration: const Duration(milliseconds: 300),
                    ),
                    onPressed: () {
                      postUlasanBuku(idBuku, namaBuku);
                      Navigator.of(Get.context!).pop();
                    },
                    child: Text(
                      'Save Review Book',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  postUlasanBuku(String buku, String namaBuku) async {
    loadingUlasan(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        int ratingBukuInt = ratingBuku.round();
        final response = await ApiProvider.instance().post(Endpoint.ulasan,
            data: dio.FormData.fromMap({
              "Rating": ratingBukuInt,
              "BukuID": buku,
              "Ulasan": ulasanController.text.toString()
            }));
        if (response.statusCode == 201) {
          Get.snackbar("Success", "Ulasan Buku $namaBuku berhasil di simpan",
              backgroundColor: const Color(0xFFFD5B35),
              colorText: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10));
          ulasanController.text = '';
        } else {
          Get.snackbar("Sorry", "Ulasan gagal di simpan, Silakan coba kembali",
              backgroundColor: Colors.red,
              colorText: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10));
        }
      }
      loadingUlasan(false);
    } on dio.DioException catch (e) {
      loadingUlasan(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.red,
              colorText: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10));
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10));
      }
    } catch (e) {
      loadingUlasan(false);
      Get.snackbar("Error", e.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10));
    }
  }
}
