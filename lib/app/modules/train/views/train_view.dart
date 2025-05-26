import 'package:boking_app/app/modules/home/Model/jawalmodel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/train_controller.dart';

class TrainView extends GetView<TrainController> {
  const TrainView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TrainView'), centerTitle: true),
      body: ListView.builder(
        itemCount: controller.jadwal.length,
        itemBuilder: (context, index) {
          DataJadawal train = controller.jadwal[index];
          // Assuming JadawalModel has properties like name, details, etc.
          return ListTile(
            title: Text('${train.train!.name} - ${train.departureTime}'),
            subtitle: Text(
              'From: ${train.originStation!.name} - To: ${train.destinationStation!.name}',
            ),
            onTap: () {
              // Handle tap event
              Get.snackbar('Train Selected', 'You selected Train ${index + 1}');
            },
          );
        },
      ),
    );
  }
}
