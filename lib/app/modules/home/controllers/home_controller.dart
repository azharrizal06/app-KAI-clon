import 'dart:convert';

import 'package:boking_app/app/data/Domain.dart';
import 'package:boking_app/app/data/serviseAuth.dart';
import 'package:boking_app/app/modules/home/Model/StatsiunModel.dart';
import 'package:boking_app/app/modules/home/views/home_view.dart';
import 'package:boking_app/app/modules/home/views/login_view.dart';
import 'package:boking_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  void checkLoginStatus() async {
    await Future.delayed(Duration(seconds: 2)); // simulasi delay splash
    bool isLogin = await AuthService.isLoggedIn();
    Logger().i(isLogin);

    if (isLogin) {
      Get.offAll(HomeView()); // ganti dengan route kamu
    } else {
      Get.offAll(LoginView()); // ganti dengan route login kamu
    }
  }

  RxString asal = "Pilih Stasiun Asal".obs;
  RxString tujuan = "Pilih Stasiun Tujuan".obs;
  RxBool isRoundTrip = false.obs;

  void setAsal(String value) {
    asal.value = value;
  }

  void setTujuan(String value) {
    tujuan.value = value;
  }

  void tukarAsalTujuan() {
    final temp = asal.value;
    asal.value = tujuan.value;
    tujuan.value = temp;
  }

  Future<void> pilihKereta(bool isAsal, BuildContext context) async {
    await fetchStasiun();
    final hasil = await showModalBottomSheet<String>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const Text(
                "Pilih Kereta",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: stasiun.length,
                itemBuilder: (context, index) {
                  var namaKereta = stasiun[index];
                  return ListTile(
                    title: Text(namaKereta.name ?? ""),
                    subtitle: const Text("Detail Kereta"),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.pop(context, namaKereta.name);
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
    if (hasil != null) {
      if (isAsal) {
        setAsal(hasil);
      } else {
        setTujuan(hasil);
      }
    }
  }

  var stasiun = <DataSatasiun>[].obs;

  Future<void> fetchStasiun() async {
    try {
      final response = await http.get(Uri.parse(Domain.stasiun));

      if (response.statusCode == 200) {
        final model = StatsiunModel.fromJson(response.body);
        stasiun.value = model.data ?? [];
        Logger().i(stasiun);
      } else {
        throw Exception('Failed to load stasiun');
      }
    } catch (e) {
      Logger().e('Error: $e');
    }
  }

  @override
  void onInit() {
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
}
