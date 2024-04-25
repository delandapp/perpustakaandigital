import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/custom_button.dart';
import '../../../components/custom_textfield.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    // Size
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Color
    const Color primary = Color (0xFF000000);
    const Color textColor = Color (0xFFFAFAFA);
    const Color colorButton = Color (0xFFFBFF00);

    // Size Text
    double text = 18.0;
    // double text3 = 14.0;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 51,
          backgroundColor: colorButton,
          elevation: 0,
          title: SizedBox(
            child: Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: Image.asset("assets/images/logo.png")
                  ),
                ),

                Center(
                  child: Text(
                    'Profile User',
                    style: GoogleFonts.plusJakartaSans(
                      color: primary,
                      fontWeight: FontWeight.w800,
                      fontSize: text,
                    ),
                  ),
                ),

                Positioned(
                  right: 5,
                  child: RefreshIndicator(
                    onRefresh: () async {
                      // await controller.ge();
                    },
                    child: GestureDetector(
                      onTap: () async {
                        await controller.logout();
                      },
                      child: const Icon(
                        Icons.logout_rounded,
                        color: primary,
                        size: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          child: RefreshIndicator(
            onRefresh: () async{
              await controller.getDataUser();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: dataProfile(width, height),
            ),
          ),
        ),
      )
    );
  }

  Widget dataProfile(double width, double bodyHeight){
    const Color colorButton = Color (0xFFFBFF00);

    return Obx((){
      if(controller.detailProfile.value == null){
        return SizedBox(
          width: width,
          height: bodyHeight,
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFD5B35)),
            ),
          ),
        );
      }else {
        var dataUser = controller.detailProfile.value;
        return Column(
          children: [
          Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Colors.black.withOpacity(0.10),
                  width: 0.3
              )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/profil.png",
                        width: 100,
                        height: 100,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
        
                    // Button Overlay
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          // Handle button tap (e.g., open image picker)
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFF5F5F5),
                          ),
                          padding: const EdgeInsets.all(5),
                          child: const Icon(
                            Icons.stars_rounded,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        
                const SizedBox(
                  height: 10,
                ),
        
                Text(
                  dataUser!.username.toString(),
                  maxLines: 1,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16.0,
                    letterSpacing: -0.3,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
        
                const SizedBox(
                  height: 5,
                ),
        
                Text(
                  dataUser.alamat.toString(),
                  maxLines: 1,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16.0,
                    letterSpacing: -0.3,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ))
          ),
        
            const SizedBox(
              height: 30,
            ),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nama Lengkap', textAlign: TextAlign.start,style: GoogleFonts.plusJakartaSans(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextField(
                                controller: controller.namalengkapController,
                                hintText: 'Nama Lengkap',
                                onChanged: (value){
        
                                },
                                obsureText: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please input nama lengkap';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
        
                        const SizedBox(
                          width: 10,
                        ),
        
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Username', textAlign: TextAlign.start,style: GoogleFonts.plusJakartaSans(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextField(
                                controller: controller.usernameController,
                                hintText: 'Username',
                                onChanged: (value){
        
                                },
                                obsureText: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please input username';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
        
                    const SizedBox(
                      height: 10,
                    ),
        
                    Text('Email', textAlign: TextAlign.start,style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: controller.emailController,
                      hintText: 'Email',
                      onChanged: (value){
        
                      },
                      obsureText: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please input email';
                        }
                        return null;
                      },
                    ),
        
                    const SizedBox(
                      height: 10,
                    ),
        
                    Text('Telepon', textAlign: TextAlign.start,style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: controller.teleponController,
                      hintText: 'Telepon',
                      onChanged: (value){
        
                      },
                      obsureText: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please input telepon';
                        }
                        return null;
                      },
                    ),
        
                    const SizedBox(
                      height: 30,
                    ),
        
                    CustomButton(
                        onPressed: ()=>controller.updateProfilePost(),
                        radius: 10.10,
                        buttonColor: colorButton,
                        child: Obx(() => controller.loadingLogout.value?
                        const CircularProgressIndicator(
                          color: Colors.white,
                        ): Text(
                          'Update Profile',
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ))
                    ),
                  ],
                ),
              ),
            ),
        
          ],
        );
      }
    });
  }
}
