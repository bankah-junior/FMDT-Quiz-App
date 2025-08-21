import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmdt_quiz_app/screens/categories_screen.dart';
import 'package:fmdt_quiz_app/widgets/show_quiz_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> categories = [
    {"name": "Mathematics", "icon": "assets/images/calculator.svg"},
    {"name": "Sports", "icon": "assets/images/ball.svg"},
    {"name": "History", "icon": "assets/images/history.svg"},
    {"name": "Animals", "icon": "assets/images/animals.svg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/images/profile.png"),
                  ),
                  const SizedBox(width: 30),
                  const Text(
                    "Hi, Emmanuel",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Raleway",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              //
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: const TextStyle(
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                        prefixIcon: const Icon(Icons.search, size: 16),
                        filled: true,
                        fillColor: const Color.fromRGBO(244, 244, 244, 0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(14),
                        backgroundColor: const Color.fromRGBO(
                          244,
                          244,
                          244,
                          0.5,
                        ),
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        showQuizDialog(context);
                      },
                      child: SvgPicture.asset(
                        "assets/images/filter.svg",
                        width: 18.5,
                        height: 30.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoriesScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "See more",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),

              //
              SizedBox(
                height: (categories.length / 2).ceil() * 160,
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
                    return Container(
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
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Score History",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "View all",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 14,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              //
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  children: [
                    // Icon(Icons.history, size: 50, color: Colors.grey),
                    SvgPicture.asset(
                      "assets/images/board.svg",
                      width: 24,
                      height: 32,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "You have no scores recorded yet.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Select a category and challenge yourself!",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
