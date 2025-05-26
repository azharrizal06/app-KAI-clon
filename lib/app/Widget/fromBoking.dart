import 'package:boking_app/app/Widget/Bottom.dart';
import 'package:boking_app/app/modules/home/controllers/home_controller.dart';
import 'package:boking_app/app/modules/train/controllers/train_controller.dart';
import 'package:boking_app/app/modules/train/views/train_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketBookingForm extends StatefulWidget {
  const TicketBookingForm({Key? key}) : super(key: key);

  @override
  State<TicketBookingForm> createState() => _TicketBookingFormState();
}

class _TicketBookingFormState extends State<TicketBookingForm> {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    TrainController trainController = Get.put(TrainController());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Asal
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      homeController.pilihKereta(true, context);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Asal"),
                        SizedBox(height: 4),
                        Obx(
                          () => Text(
                            homeController.asal.value,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    homeController.tukarAsalTujuan();
                  },
                  child: const Icon(Icons.compare_arrows, color: Colors.blue),
                ),

                // Tujuan
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      homeController.pilihKereta(false, context);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Tujuan"),
                        SizedBox(height: 4),
                        Obx(
                          () => Text(
                            homeController.tujuan.value,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 32),

            // Tanggal
            Row(
              children: [
                // Berangkat
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Tanggal Berangkat"),
                      const SizedBox(height: 8),
                      Text(
                        "20 Jul 2023",
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Pulang Pergi Toggle
                Column(
                  children: [
                    Obx(
                      () => Transform.scale(
                        scale: 0.6,
                        child: Switch(
                          value: homeController.isRoundTrip.value,
                          activeColor: Colors.orange,
                          onChanged: (value) {
                            homeController.isRoundTrip.value = value;
                          },
                        ),
                      ),
                    ),
                    const Text("Pulang Pergi"),
                  ],
                ),
                // Tanggal Kembali
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Tanggal Kembali",
                        style: TextStyle(
                          color:
                              homeController.isRoundTrip.value
                                  ? Colors.black
                                  : Colors.grey.shade400,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "20 Jul 2023",
                        style: TextStyle(
                          color:
                              homeController.isRoundTrip.value
                                  ? Colors.black
                                  : Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const Divider(height: 32),

            // Kelas & Penumpang
            Row(
              children: [
                // Kelas Kereta
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Kelas Kereta"),
                      SizedBox(height: 8),
                      Text(
                        "Semua",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Penumpang
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text("Penumpang"),
                      SizedBox(height: 8),
                      Text(
                        "Select One",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Usia > 3th dan < 3th
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text("0 bayi  ", style: TextStyle(color: Colors.blue)),
                Text("usia > 3 th  "),
                Text("usia < 3 th"),
              ],
            ),

            const SizedBox(height: 8),

            const Text(
              "Penumpang bayi tidak mendapatkan kursi sendiri",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            // Tombol Cari
            SizedBox(
              width: double.infinity,
              child: BottomCostom(
                Controller: () {
                  trainController.fetchTrains();
                  // Get.to(TrainView());
                },
                label: "Cari",
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCustomModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
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
                "Hasil Pencarian",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Daftar kereta
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("stasiun ${index + 1}"),
                    subtitle: const Text("Detail Kereta"),
                    trailing: const Icon(Icons.arrow_forward),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
