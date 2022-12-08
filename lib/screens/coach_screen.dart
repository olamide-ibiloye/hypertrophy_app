import 'package:flutter/material.dart';
import 'package:hypertrophy_app/constants.dart';

class CoachScreen extends StatelessWidget {
  const CoachScreen(
      {super.key, required this.coachPoints, required this.exerciseName});

  final List<String> coachPoints;
  final String exerciseName;

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Text(
            'COACH - ${exerciseName.toUpperCase()}',
            style: TextStyle(
              fontSize: currentHeight / 48,
              fontWeight: FontWeight.w700,
              color: kBrandColor,
            ),
          ),
          Column(
            children: coachPoints.map((point) {
              return Row(children: [
                const Text(
                  "\u2022",
                  style: TextStyle(fontSize: 30),
                ), //bullet text
                const SizedBox(
                  width: 10,
                ), //space between bullet and text
                Expanded(
                  child: Text(
                    '\n$point',
                    style: TextStyle(
                      fontSize: currentHeight / 60,
                    ),
                  ), //text
                )
              ]);
            }).toList(),
          )
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:hypertrophy_app/constants.dart';
//
// class CoachScreen extends StatelessWidget {
//   const CoachScreen(
//       {super.key, required this.coachPoints, required this.exerciseName});
//
//   final String coachPoints;
//   final String exerciseName;
//
//   @override
//   Widget build(BuildContext context) {
//     final currentHeight = MediaQuery.of(context).size.height;
//
//     return Container(
//       margin: const EdgeInsets.all(20.0),
//       child: ListView(
//         children: [
//           Text(
//             'COACH - ${exerciseName.toUpperCase()}',
//             style: TextStyle(
//               fontSize: currentHeight / 48,
//               fontWeight: FontWeight.w700,
//               color: kBrandColor,
//             ),
//           ),
//           const SizedBox(
//             height: 20.0,
//           ),
//           Text(coachPoints,
//           style: TextStyle(
//             fontSize: currentHeight / 60,
//           ),),
//         ],
//       ),
//     );
//   }
// }
