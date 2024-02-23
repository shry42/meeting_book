import 'dart:convert';

class RoomsGetModel {
  int id;
  String name;
  int createdBy;
  String createdAt;
  int isActive;
  String floor;
  int seatingCapacity;
  String RoomsGetModelDetails;
  String meetingType;

  RoomsGetModel({
    required this.id,
    required this.name,
    required this.createdBy,
    required this.createdAt,
    required this.isActive,
    required this.floor,
    required this.seatingCapacity,
    required this.RoomsGetModelDetails,
    required this.meetingType,
  });

  factory RoomsGetModel.fromJson(Map<String, dynamic> json) {
    return RoomsGetModel(
      id: json['id'],
      name: json['name'],
      createdBy: json['createdBy'],
      createdAt: json['createdAt'],
      isActive: json['isActive'],
      floor: json['floor'],
      seatingCapacity: json['seatingcapacity'],
      RoomsGetModelDetails: json['RoomsGetModelDetails'],
      meetingType: json['meetingType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'isActive': isActive,
      'floor': floor,
      'seatingcapacity': seatingCapacity,
      'RoomsGetModelDetails': RoomsGetModelDetails,
      'meetingType': meetingType,
    };
  }
}
