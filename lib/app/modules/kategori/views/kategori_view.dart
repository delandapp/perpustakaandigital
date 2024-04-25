import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kategori_controller.dart';

class KategoriView extends GetView<KategoriController> {
  const KategoriView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KategoriView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'KategoriView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
