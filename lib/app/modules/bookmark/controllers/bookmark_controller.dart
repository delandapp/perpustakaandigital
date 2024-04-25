import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:perpustakaandigital/app/data/constans/endpoint.dart';
import 'package:perpustakaandigital/app/data/models/response_bookmark_book.dart';
import 'package:perpustakaandigital/app/data/provider/api_provider.dart';
import 'package:perpustakaandigital/app/data/provider/storage_provider.dart';

class BookmarkController extends GetxController with StateMixin<List<DataBookmark>> {
  //TODO: Implement BookmarkController
  String idUser = StorageProvider.read(StorageKey.idUser);
  final loading = false.obs;
  RxBool dataBookmark = false.obs;
  RxInt jumlahData = 0.obs;
  RxList<DataBookmark> listKoleksi = <DataBookmark>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getDataKoleksi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
    deleteKoleksi(int idbook) async {
      loading(true);
      final bearerToken = StorageProvider.read(StorageKey.bearerToken);
      try {
        final response = await ApiProvider.instance().delete('${Endpoint.koleksi}/$idbook',options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
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
            change(null, status: RxStatus.error("${e.response?.data['message']}"));
             loading(false);
          }
        } else {
          change(null, status: RxStatus.error(e.message ?? ""));
        }
      }
    }
   Future<void> getDataKoleksi() async {
    change(null, status: RxStatus.loading());

    try {
      final bearerToken = StorageProvider.read(StorageKey.bearerToken);
      final responseKoleksiBuku = await ApiProvider.instance().get(
          '${Endpoint.koleksi}/$idUser',options: Options(headers: {"Authorization": "Bearer $bearerToken"}));

      if (responseKoleksiBuku.statusCode == 200) {
        final ResponseBookmarkBook responseKoleksi = ResponseBookmarkBook.fromJson(responseKoleksiBuku.data);
        if(responseKoleksi.data!.isEmpty ) {
            change(responseKoleksi.data, status: RxStatus.success());
            dataBookmark.value = true;
          } else {
            dataBookmark.value = false;
            change(responseKoleksi.data, status: RxStatus.success());
            listKoleksi.value = responseKoleksi.data!;
            jumlahData.value = responseKoleksi.data!.length;
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
}
