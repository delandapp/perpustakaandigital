import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constans/endpoint.dart';
import '../../../data/models/response_profile.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class ProfileController extends GetxController with StateMixin{

  var detailProfile = Rxn<DataProfile>();
  final loading = false.obs;
  final loadingLogout = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController teleponController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController namalengkapController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getDataUser();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getDataUser() async {
    detailProfile.value = null;
    change(null, status: RxStatus.loading());

    try {
     final bearerToken = StorageProvider.read(StorageKey.bearerToken);
      final responseDetailBuku = await ApiProvider.instance().get(Endpoint.profil,options: Options(headers: {"Authorization": "Bearer $bearerToken"}));

      if (responseDetailBuku.statusCode == 200) {
        final ResponseProfile responseBuku = ResponseProfile.fromJson(responseDetailBuku.data);

        if (responseBuku.data == null) {
          change(null, status: RxStatus.empty());
        } else {
          detailProfile(responseBuku.data);
          emailController.text = detailProfile.value!.email.toString();
          teleponController.text = detailProfile.value!.noTelp.toString();
          usernameController.text = detailProfile.value!.username.toString();
          namalengkapController.text = detailProfile.value!.namaLengkap.toString();
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

 logout() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      final bearerToken = StorageProvider.read(StorageKey.bearerToken);
      var response = await ApiProvider.instance().get(
          Endpoint.logout,options: Options(headers: {"Authorization": "Bearer $bearerToken"})
      );

      if (response.statusCode == 200) {
        
        StorageProvider.clearAll();
        Get.offAllNamed(Routes.LOGIN);
      } else {
      }
      loading(false);
    } on DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
        }
      } else {
      }
    } catch (e) {
      loading(false);
    }
  }

  updateProfilePost() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final bearerToken = StorageProvider.read(StorageKey.bearerToken);
        var response = await ApiProvider.instance().put(Endpoint.updateProfile,
            data:
            {
              "Username" : usernameController.text.toString(),
              "NamaLengkap" : namalengkapController.text.toString(),
              "Email" : emailController.text.toString(),
              "NoTelepon" : teleponController.text.toString(),
            },options: Options(headers: {"Authorization": "Bearer $bearerToken"})
        );
        if (response.statusCode == 201) {
          final ResponseProfile responseBuku = ResponseProfile.fromJson(response.data);
          detailProfile(responseBuku.data);
          emailController.text = detailProfile.value!.email.toString();
          teleponController.text = detailProfile.value!.noTelp.toString();
          usernameController.text = detailProfile.value!.username.toString();
          namalengkapController.text = detailProfile.value!.namaLengkap.toString();
          change(null, status: RxStatus.success());
          await StorageProvider.write(StorageKey.status, "logged");
          await StorageProvider.write(StorageKey.username, detailProfile.value!.username.toString());
          await StorageProvider.write(StorageKey.idUser, detailProfile.value!.id.toString());
          String username = usernameController.text.toString();
          Get.snackbar("Success", "Update Profile Akun $username Berhasil", backgroundColor: const Color(0xFFFD5B35),
              colorText: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
          );
          getDataUser();
        } else {
          Get.snackbar(
              "Sorry",
              "Update Profile Gagal",
              backgroundColor: Colors.red,
              colorText: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
          );
        }
      }
      loading(false);
    } on DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['Message']}",
              backgroundColor: Colors.red, colorText: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
          );
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
        );
      }
    } catch (e) {
      loading(false);
      Get.snackbar(
          "Error", e.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
      );
    }
  }

}
