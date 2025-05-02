import 'package:avengers/widgets/hero_card.dart';
import 'package:avengers/widgets/pick_image.dart';
import 'package:flutter/material.dart';

class Avenge extends StatefulWidget {
  const Avenge({super.key});

  @override
  State<Avenge> createState() => _AvengeState();
}

class _AvengeState extends State<Avenge> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: Column(
      children: [
        Text(
          'Superhero Who?',
          style: TextStyle(
              fontFamily: 'Dancing Script',
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 40),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomProfileCard(
              imagePath: 'assets/10020.jpg',
              name: 'Tom Holland',
            ),
            SizedBox(width: 20),
            CustomProfileCard(
              imagePath: 'assets/10007.jpg',
              name: 'Chris Hemsworth',
            ),
          ]),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomProfileCard(
              imagePath: 'assets/10031.jpg',
              name: 'Gal Gadot',
            ),
            SizedBox(width: 20),
            CustomProfileCard(
              imagePath: 'assets/10005.jpg',
              name: 'Chris Evans',
            ),
          ]),
        ),
        UploadImageBox()
      ],
    ));
  }
}
