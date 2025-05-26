import 'package:boking_app/app/data/help.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final VoidCallback? onCartPressed;
  Icon? icon;

  CustomAppBar({Key? key, this.height = kToolbarHeight, this.onCartPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Hilangkan back button default
      backgroundColor: primaryColor,
      elevation: 0,
      centerTitle: true,
      title: Image.asset(
        'assets/images/kai_logo.png', // Pastikan kamu punya asset ini
        // height: 30,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
            icon:
                icon ??
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 40,
                  color: Colors.white,
                ),
            onPressed: onCartPressed ?? () {},
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
