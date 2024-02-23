class CreateMeetingModel {
  int roomId;
  String date;
  String startTime;
  String endTime;
  String meetingType;
  String purpose;
  List<int> participants;

  CreateMeetingModel({
    required this.roomId,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.meetingType,
    required this.purpose,
    required this.participants,
  });

  factory CreateMeetingModel.fromJson(Map<String, dynamic> json) {
    return CreateMeetingModel(
      roomId: json['roomId'],
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      meetingType: json['meetingType'],
      purpose: json['purpose'],
      participants: List<int>.from(json['participant']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roomId': roomId,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'meetingType': meetingType,
      'purpose': purpose,
      'participant': participants,
    };
  }
}
