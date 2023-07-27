// ignore_for_file: public_member_api_docs, sort_constructors_first
class InfoModel {

  final String brand;
  final String model;
  final String serialNumber;

  InfoModel({
    required this.brand,
    required this.model,
    required this.serialNumber,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      brand: json['brand'], 
      model: json['model'], 
      serialNumber: json['serial']
    );
  }
}
