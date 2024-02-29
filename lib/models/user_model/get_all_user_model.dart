class GetAllUserDetailsModel {
  late String firstName;
  late String lastName;
  late int id;
  late String role;
  late String email;
  late String mobileNo;

  GetAllUserDetailsModel({
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.role,
    required this.email,
    required this.mobileNo,
  });

  // Factory method to create an instance of GetAllUserDetails from JSON
  factory GetAllUserDetailsModel.fromJson(Map<String, dynamic> json) {
    return GetAllUserDetailsModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      id: json['id'],
      role: json['role'],
      email: json['email'],
      mobileNo: json['mobileNo'],
    );
  }
}
