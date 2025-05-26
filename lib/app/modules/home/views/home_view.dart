import 'package:boking_app/app/Widget/Appcustom.dart';
import 'package:boking_app/app/Widget/fromBoking.dart';
import 'package:boking_app/app/data/help.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 50,
        onCartPressed: () {
          // Aksi ketika tombol keranjang ditekan
          print('Keranjang ditekan');
        },
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset('assets/images/banner.png', fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Text(
              'lihat semua',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 15,
                decoration: TextDecoration.underline,
                color: primaryColor,
              ),
            ),
            kaipoint(),
            TicketBookingForm(),
          ],
        ),
      ),
    );
  }


  Widget kaipoint() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Image.asset(
                  'assets/images/wallet 1.png', // ganti dengan ikon dompet kamu
                  width: 36,
                  height: 36,
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('KAIpay'),
                    Text(
                      'Aktivasi',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(height: 40, width: 1, color: Colors.grey[300]),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/images/poin.png', // ganti dengan ikon piala kamu
                  width: 36,
                  height: 36,
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Point Anda'),
                    Text(
                      '30 Poin',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
