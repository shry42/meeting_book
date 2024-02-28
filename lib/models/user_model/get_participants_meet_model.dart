class GetMeetParticipantsModel {
  String? firstName;
  String lastName;
  int id;

  GetMeetParticipantsModel({
    required this.firstName,
    required this.lastName,
    required this.id,
  });

  factory GetMeetParticipantsModel.fromJson(Map<String, dynamic> json) {
    return GetMeetParticipantsModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'id': id,
    };
  }
}
