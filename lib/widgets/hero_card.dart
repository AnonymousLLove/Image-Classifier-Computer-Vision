import 'package:flutter/material.dart';

class CustomProfileCard extends StatelessWidget {
  final String imagePath;
  final String name;

  const CustomProfileCard({
    super.key,
    required this.imagePath,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Colors.black,
            Color(0xff081b25),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 15)),
          Container(
            height: 100,
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
                fontFamily: 'Dancing Script',
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 20),
          ),
        ],
      ),
    );
  }
}
