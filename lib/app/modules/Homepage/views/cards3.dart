import 'package:flutter/material.dart';
import '../../../../style.dart';

class Cards3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        width: 69,
        height: 130,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Image.asset('assets/bird.png',
                width: 55, height: 56, fit: BoxFit.cover),
            SizedBox(
              height: 10,
            ),
            Text(
              'Bird',
              style: blackTextStyle.copyWith(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
