class MyMeetingsGetModel {
  final int id;
  final int userId;
  final int roomId;
  final String? date;
  final String? startTime;
  final String? endTime;
  // final int isFeedback;

  final String? suggestion;
  final String? additionalComments;
  final String? meetingType;
  final String? purpose;
  final String name;
  final String firstName;
  final String lastName;

  MyMeetingsGetModel({
    required this.id,
    required this.userId,
    required this.roomId,
    required this.date,
    required this.startTime,
    required this.endTime,
    // required this.isFeedback,
    this.suggestion,
    this.additionalComments,
    required this.meetingType,
    required this.purpose,
    required this.name,
    required this.firstName,
    required this.lastName,
  });

  factory MyMeetingsGetModel.fromJson(Map<String, dynamic> json) {
    return MyMeetingsGetModel(
      id: json['id'],
      userId: json['userId'],
      roomId: json['roomId'],
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      suggestion: json['suggestion'],
      additionalComments: json['additionalComments'],
      meetingType: json['meetingType'],
      purpose: json['purpose'],
      name: json['name'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
