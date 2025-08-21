import 'package:flutter/material.dart';

void showQuizDialog(BuildContext context) {
  int questionCount = 5;
  String difficulty = "Easy";

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Quiz Settings",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Raleway",
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.orange,
                              width: 1.2,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 18,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Quiz Number Controller
                  Column(
                    children: [
                      const Text(
                        "How many questions would you like?",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          cQuizControlButton(
                            child: const Icon(
                              Icons.remove,
                              color: Colors.orange,
                            ),
                            onPressed: () {
                              if (questionCount > 1) {
                                setState(() => questionCount--);
                              }
                            },
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 90,
                            height: 48,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(244, 244, 244, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              questionCount.toString(),
                              style: const TextStyle(
                                fontFamily: "Raleway",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          cQuizControlButton(
                            child: const Icon(Icons.add, color: Colors.orange),
                            onPressed: () {
                              setState(() => questionCount++);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Difficulty Dropdown
                  Column(
                    children: [
                      const Text(
                        "Select Difficulty",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(244, 244, 244, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: difficulty,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          items: ["Easy", "Medium", "Hard"]
                              .map(
                                (diff) => DropdownMenuItem(
                                  value: diff,
                                  child: Text(
                                    diff,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Raleway",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() => difficulty = value);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  // Start Quiz Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Start Quiz",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Widget cQuizControlButton({
  required Widget child,
  required VoidCallback onPressed,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: 90,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange, width: 1.2),
      ),
      child: Center(child: child),
    ),
  );
}
