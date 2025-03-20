class Course {
  final String university;
  final String course;
  final String description;
  final String duration;
  final String tuitionFee;
  final String location;
  final String contactEmail;

  Course({
    required this.university,
    required this.course,
    required this.description,
    required this.duration,
    required this.tuitionFee,
    required this.location,
    required this.contactEmail,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      university: json['university'],
      course: json['course'] ,
      description: json['description'] ,
      duration: json['duration'] ,
      tuitionFee: json['tuition_fee'] ,
      location: json['location'] ,
      contactEmail: json['contact_email'] ,
    );
  }
}

