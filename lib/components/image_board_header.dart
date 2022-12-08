import 'package:flutter/material.dart';
import 'package:hypertrophy_app/constants.dart';

class ImageBoardHeader extends StatelessWidget {
  const ImageBoardHeader(
      {super.key, required this.imageName, required this.exerciseName});

  final String imageName;
  final String exerciseName;

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;

    return Container(
      height: currentHeight / 4,
      width: double.infinity,
      decoration: topImage(imageName: imageName),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
            child: BackButton(
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              exerciseName,
              style: kHeaderTextStyle.copyWith(
                fontSize: currentHeight / 30,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
