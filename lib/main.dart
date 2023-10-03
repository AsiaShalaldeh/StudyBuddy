import 'package:flutter/material.dart';

void main() {
  runApp(StudentListApp());
}

class Student {
  final String id;
  final String name;
  final String major;
  final double rating;
  final String imageUrl;

  Student({
    required this.id,
    required this.name,
    required this.major,
    required this.rating,
    required this.imageUrl,
  });
}

class StudentListApp extends StatelessWidget {
  final List<Student> students = [
    Student(
        id: '1',
        name: 'John Doe',
        major: 'Computer Science',
        rating: 84.0,
        imageUrl: 'assets/images/std3.jpg'),
    Student(
        id: '2',
        name: 'Jane Smith',
        major: 'Mathematics',
        rating: 76.0,
        imageUrl: 'assets/images/std1.jpg'),
    Student(
        id: '3',
        name: 'Alice Johnson',
        major: 'Physics',
        rating: 90.0,
        imageUrl: 'assets/images/std2.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Student List'),
        ),
        body: ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            final student = students[index];
            return StudentCard(
              student: student,
            );
          },
        ),
      ),
    );
  }
}

class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            ClipOval(
                child: Container(
                    child: Image.asset(student.imageUrl,
                        width: 50, height: 50, fit: BoxFit.cover))),
            const SizedBox(width: 16.0),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      student.name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text('ID: ${student.id}'),
                    Text('Major: ${student.major}'),
                    Row(
                      children: [
                        const Text(
                          'Rating: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RatingStars(rating: student.rating),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingStars extends StatelessWidget {
  final double rating;

  const RatingStars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    final double ratingOutOf5 =
        (rating / 20.0).clamp(0, 5); // Convert 0-100 scale to 0-5
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) => Icon(
          index < ratingOutOf5.round() ? Icons.star : Icons.star_border,
          color: Colors.yellow,
        ),
      ),
    );
  }
}
