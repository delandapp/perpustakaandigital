import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perpustakaandigital/app/components/bookSearch.dart';
import 'package:perpustakaandigital/app/components/buildSection.dart';
import 'package:perpustakaandigital/app/components/searchInput.dart';
import 'package:perpustakaandigital/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final heightFullBody =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final widthFullBody = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: heightFullBody,
      width: widthFullBody,
      child: controller.obx((state) => Stack(
            children: [
              Obx(
                () => Expanded(
                  child: controller.searchLenght.value == 1
                      ? controller.loading.value == false
                          ? controller.listDataBuku.isEmpty
                              ? const Center(child: Text("Tidak Ada Buku"))
                              : BookSearch(data: controller.listDataBuku)
                          : const Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                width: widthFullBody,
                                color: Colors.white,
                                child: Image.asset(
                                  "assets/images/search.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Column(
                                children: state!.map((data) {
                                  return SizedBox(
                                    height: heightFullBody * 0.3,
                                    child: buildSection(data: data),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(5)),
                  height: 40,
                  child: MyInputSearch(
                    prefixIcon: Icons.search,
                    validator: controller.validator,
                    controller: controller,
                    controllerField: controller.search,
                    height: 10,
                    width: 10,
                    hintText: "Search Your Favorit Book",
                    autoFocus: false,
                  ),
                ),
              ),
            ],
          )),
    ));
  }
}
