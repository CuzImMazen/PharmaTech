import 'package:pharmacy_app/features/auth/data/models/pharmacy_model.dart';
import 'package:pharmacy_app/features/auth/data/models/user_model.dart';

class LoginResponseModel {
  final String message;
  final UserModel user;
  final PharmacyModel? pharmacy;

  LoginResponseModel({
    required this.message,
    required this.user,
    this.pharmacy,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json['message'],
      user: UserModel.fromJson(json['user']),
      pharmacy: json['pharmacy'] != null
          ? PharmacyModel.fromJson(json['pharmacy'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'user': user.toJson(),
    'pharmacy': pharmacy?.toJson(),
  };
}
