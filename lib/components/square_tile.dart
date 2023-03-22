import 'package:flutter/material.dart';
import 'package:stock_management/components/my_button_google.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath,
  });
  void signUserInGoogle() {}
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[200],
      ),
      child: MyButtonG(
                onTap: signUserInGoogle,
              ),
      // child: Image.asset(
      //   imagePath,
      //   height: 40,
      // ),
    );
  }
}
