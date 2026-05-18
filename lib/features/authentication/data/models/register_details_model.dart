class RegisterDetailsModel {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String pharmacyName;
  final int governorateID;
  final int cityID;
  final String detailedAddress;
  final String pharmacyLicense;

  RegisterDetailsModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.pharmacyName,
    required this.governorateID,
    required this.cityID,
    required this.detailedAddress,
    required this.pharmacyLicense,
  });
}
