import 'package:pharmacy_app/features/authentication/data/models/pharmacy_model.dart';
import 'package:pharmacy_app/features/authentication/data/models/user_model.dart';

class CompleteProfileResponseModel {
  final String? message;
  final UserModel user;
  final PharmacyModel pharmacy;

  CompleteProfileResponseModel({
    required this.message,
    required this.user,
    required this.pharmacy,
  });

  factory CompleteProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return CompleteProfileResponseModel(
      message: json['message'],
      user: UserModel.fromJson(json['user']),
      pharmacy: PharmacyModel.fromJson(json['pharmacy']),
    );
  }
}
