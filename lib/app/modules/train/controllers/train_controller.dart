import 'package:boking_app/app/data/Domain.dart';
import 'package:boking_app/app/modules/home/Model/jawalmodel.dart';
import 'package:boking_app/app/modules/train/views/train_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';

class TrainController extends GetxController {
  RxList<DataJadawal> jadwal = <DataJadawal>[].obs;

  Future<List<DataJadawal>> fetchTrains() async {
    final response = await http.post(
      Uri.parse(Domain.jadwal),
      body: json.encode({
        "origin_station_id": 12,
        "destination_station_id": 89,
      }),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      Logger().i('Trains fetched successfully');
      Logger().i(response.body);

      // Parse response body ke JadawalModel
      final jadwalModel = JadawalModel.fromJson(response.body);

      // Simpan data jadwal ke RxList jadwal
      jadwal.assignAll(jadwalModel.data ?? []);

      Get.to(TrainView());

      return jadwal; // kembalikan list jadwal
    } else {
      Logger().e('Failed to load trains: ${response.statusCode}');
      Get.snackbar("Gagal", "Tidak ada jadwal saat ini");
      return [];
    }
  }

  final count = 0.obs;
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

  void increment() => count.value++;
}
