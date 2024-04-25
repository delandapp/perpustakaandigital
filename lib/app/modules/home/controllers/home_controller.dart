import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:perpustakaandigital/app/data/constans/endpoint.dart';
import 'package:perpustakaandigital/app/data/models/response_bookSearch.dart';
import 'package:perpustakaandigital/app/data/models/response_buku.dart';
import 'package:perpustakaandigital/app/data/provider/api_provider.dart';
import 'package:perpustakaandigital/app/data/provider/storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<DataBuku>>{
  //TODO: Implement HomeController
  
   final validator = ValidationBuilder().minLength(1).build();
  final RxString username = StorageProvider.read(StorageKey.username).obs;
    final TextEditingController search = TextEditingController();
  final RxInt currentPage = 0.obs;
  final RxInt searchLenght = 0.obs;
    final RxBool loading = false.obs;
    final RxList<DataBukuSearch> listDataBuku = <DataBukuSearch>[].obs;
  RxList<Map<String, String>>  splashData = [
    {
      "image": "assets/splash-1.png",
    },
    {
      "image": "assets/splash-1.png",
    },
    {
      "image": "assets/splash-1.png",
    },
  ].obs;
  final List<Map<String, dynamic>> listData = [];



  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> searchData(String value) async {
    try {
      if (search.text.toString() == "") {
        listDataBuku.value = [];
        searchLenght.value = 0;
        return;
      }
      String data = jsonEncode({
        "query": search.text.toString(),
      });
      search.text.toString() != ""
              ? searchLenght.value = 1
              : searchLenght.value = 0;
      loading.value = true;
      final bearerToken = StorageProvider.read(StorageKey.bearerToken);
      final response = await ApiProvider.instance().post(
          "${Endpoint.book}/search",
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}),
          data: data);
      if (response.statusCode == 200) {
        loading.value = false;
        final ResponseBookSearch responseBook =
            ResponseBookSearch.fromJson(response.data);
        if (responseBook.data!.isEmpty) {
          listDataBuku.value = [];
        } else {
          listDataBuku.value = responseBook.data!;
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null,
              status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }


  Future<void> getData() async{
    change(null, status: RxStatus.loading());

    try {
        final bearerToken = StorageProvider.read(StorageKey.bearerToken);
        final response = await ApiProvider.instance().get(Endpoint.book,options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
        if (response.statusCode == 200) {
          final ResponseBuku responseBook = ResponseBuku.fromJson(response.data);
          print(response);
          if(responseBook.data!.isEmpty) {
            change(null, status: RxStatus.empty());
          } else {
            change(responseBook.data, status: RxStatus.success());
          }
        } else {
          change(null, status: RxStatus.error("Gagal mengambil data"));
        }

    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  String sapaanBerdasarkanWaktu() {
    var jam = DateTime.now().hour;
    if (jam >= 4 && jam < 10) {
      return 'Selamat Pagi';
    } else if (jam >= 10 && jam < 15) {
      return 'Selamat Siang';
    } else if (jam >= 15 && jam < 18) {
      return 'Selamat Sore';
    } else {
      return 'Selamat Malam';
    }
  }
}
