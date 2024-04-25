import 'package:get/get.dart';

import '../controllers/listpeminjaman_controller.dart';

class ListpeminjamanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListpeminjamanController>(
      () => ListpeminjamanController(),
    );
  }
}
