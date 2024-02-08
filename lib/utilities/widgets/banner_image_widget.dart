import 'package:flutter/material.dart';

class BannerImageWidget extends StatelessWidget {
  const BannerImageWidget(
      {super.key, required this.imagepath, required this.textData});
  final String imagepath;
  final String textData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 280,
        height: 170,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset('assets/images/classroom.jpg').image, fit: BoxFit.cover)),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [Colors.black87, Colors.white10])),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
              child: Text(
                textData,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
