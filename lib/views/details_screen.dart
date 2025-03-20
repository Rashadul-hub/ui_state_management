
import 'package:flutter/material.dart';
import '../models/course_model.dart';
import '../widgets/info_tile_widget.dart';


class DetailsScreen extends StatelessWidget {
  final Course course;

  const DetailsScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        // title: const Text('Course Details'),

        title: const Text('Course Details', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 20),
        child: SingleChildScrollView(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: course.course,
                    child: Text(
                      course.course,
                      style: TextStyle(
                        fontSize: screenWidth > 600 ? 28 : 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    course.university,
                    style: TextStyle(
                      fontSize: screenWidth > 600 ? 18 : 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Using InfoTileWidget
                  InfoTileWidget(icon: Icons.description, title: 'Description', value: course.description),
                  InfoTileWidget(icon: Icons.schedule, title: 'Duration', value: course.duration),
                  InfoTileWidget(icon: Icons.monetization_on, title: 'Tuition Fee', value: course.tuitionFee),
                  InfoTileWidget(icon: Icons.location_on, title: 'Location', value: course.location),
                  InfoTileWidget(icon: Icons.email, title: 'Contact Email', value: course.contactEmail),

                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Back'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, screenHeight * 0.07),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}