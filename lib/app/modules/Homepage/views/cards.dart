import 'package:flutter/material.dart';
import '../../../../style.dart';

class Cards extends StatelessWidget {
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
            Image.asset('assets/cat.png',
                width: 55, height: 56, fit: BoxFit.cover),
            SizedBox(
              height: 10,
            ),
            Text(
              'Cat',
              style: blackTextStyle.copyWith(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
