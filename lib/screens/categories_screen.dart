import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmdt_quiz_app/widgets/show_quiz_dialog.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final List<Map<String, dynamic>> categories = [
    {"name": "Mathematics", "icon": "assets/images/calculator.svg"},
    {"name": "Sports", "icon": "assets/images/ball.svg"},
    {"name": "History", "icon": "assets/images/history.svg"},
    {"name": "Animals", "icon": "assets/images/animals.svg"},
    {"name": "Anime", "icon": "assets/images/anime.svg"},
    {"name": "Vehicles", "icon": "assets/images/vehicles.svg"},
    {"name": "Film", "icon": "assets/images/film.svg"},
    {"name": "Video Games", "icon": "assets/images/video_game.svg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Quiz Categories",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Raleway",
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            var category = categories[index];
            return GestureDetector(
              onTap: () {
                showQuizDialog(context, category["name"]);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 246, 234, 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCategoryIcon(category["icon"]),
                    const SizedBox(height: 8),
                    Text(
                      category["name"],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Raleway",
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// Flexible icon builder for both SVG and IconData
  Widget _buildCategoryIcon(dynamic icon) {
    if (icon is String) {
      return SvgPicture.asset(icon, width: 90, height: 90);
    } else if (icon is IconData) {
      return Icon(icon, size: 90, color: Colors.orange);
    }
    return const SizedBox();
  }
}
