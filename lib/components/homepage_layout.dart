import 'package:flutter/material.dart';
import 'package:hypertrophy_app/constants.dart';
import 'package:hypertrophy_app/components/auth.dart';
import 'package:hypertrophy_app/add_new_exercise/exercise_bank.dart';
import 'package:hypertrophy_app/components/exercise_tiles_generator.dart';

ExerciseBank exerciseBank = ExerciseBank();

class HomePageLayout extends StatefulWidget {
  const HomePageLayout({super.key, required this.mainBody});

  final Widget mainBody;

  @override
  State<HomePageLayout> createState() => _HomePageLayoutState();
}

class _HomePageLayoutState extends State<HomePageLayout> {
  TextEditingController editingController = TextEditingController();
  String searchActivator = '';
  List<String> items = [];

  void getExerciseSearchMatch(String query) {
    List<String> exerciseMatches = [];
    List<String> allExercise = exerciseBank.allExercisesKeysFinder();

    if (query.isNotEmpty) {
      for (String exercise in allExercise) {
        if (exercise.contains(query)) {
          exerciseMatches.add(exercise);
        }
      }
      setState(() {
        items.clear();
        items.addAll(exerciseMatches);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Auth().signOut();
            },
            icon: const Icon(
              Icons.logout,
              size: 30,
            ),
          )
        ],
        title: Text(
          'Virtual Personal Trainer',
          style: kHeaderTextStyle.copyWith(
            fontSize: 25,
          ),
        ),
        backgroundColor: kBrandColor,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 2,
                child: TextField(
                  controller: editingController,
                  decoration: kTextFieldDecoration.copyWith(
                    labelText: 'Search',
                    labelStyle: const TextStyle(
                      color: kBrandColor,
                    ),
                    hintText: 'Search your exercise',
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchActivator = value;
                    });
                    getExerciseSearchMatch(value);
                  },
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              searchActivator == ''
              ? widget.mainBody
              : Expanded(
                flex: 25,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ExerciseTile(
                        exerciseName: items[index],
                        getExerciseVideoID: exerciseBank.getAllExerciseVideoID);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
