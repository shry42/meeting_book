class GetAllUserDetailsModel {
  late String firstName;
  late String lastName;
  late int id;
  late String role;

  GetAllUserDetailsModel({
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.role,
  });

  // Factory method to create an instance of GetAllUserDetails from JSON
  factory GetAllUserDetailsModel.fromJson(Map<String, dynamic> json) {
    return GetAllUserDetailsModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      id: json['id'],
      role: json['role'],
    );
  }
}
