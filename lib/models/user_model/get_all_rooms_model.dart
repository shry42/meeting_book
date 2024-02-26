import 'dart:convert';

class RoomsGetModel {
  int id;
  String name;
  int isActive;
  String floor;
  int seatingCapacity;
  String roomDetails;
  String meetingType;

  RoomsGetModel({
    required this.id,
    required this.name,
    required this.isActive,
    required this.floor,
    required this.seatingCapacity,
    required this.roomDetails,
    required this.meetingType,
  });

  factory RoomsGetModel.fromJson(Map<String, dynamic> json) {
    return RoomsGetModel(
      id: json['id'],
      name: json['name'],
      isActive: json['isActive'],
      floor: json['floor'],
      seatingCapacity: json['seatingcapacity'],
      roomDetails: json['roomDetails'],
      meetingType: json['meetingType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isActive': isActive,
      'floor': floor,
      'seatingcapacity': seatingCapacity,
      'RoomsGetModelDetails': roomDetails,
      'meetingType': meetingType,
    };
  }
}
