import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/course_model.dart';

class CourseProvider with ChangeNotifier {
  List<Course> _courses = [];
  List<Course> get filteredCourses => _filteredCourses;

  List<Course> _filteredCourses = [];

  Future<void> loadCourses() async {
    final String response = await rootBundle.loadString('assets/data/courses.json');
    final List<dynamic> data = json.decode(response);
    _courses = data.map((e) => Course.fromJson(e)).toList();
    _filteredCourses = _courses;
    notifyListeners();
  }

  void searchCourses(String query) {
    if (query.isEmpty) {
      _filteredCourses = _courses;
    } else {
      _filteredCourses = _courses
          .where((course) =>
      course.university.toLowerCase().contains(query.toLowerCase()) ||
          course.course.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
