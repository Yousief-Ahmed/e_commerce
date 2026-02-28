import 'package:e_commerce/features/checkout/domain/entities/shipping_info_entity.dart';

class ShippingInfoModel {
  String? name;
  String? phone;
  String? email;
  String? address;
  String? city;
  String? addressDetails;

  ShippingInfoModel({
    this.name,
    this.phone,
    this.email,
    this.address,
    this.city,
    this.addressDetails,
  });

  ShippingInfoModel.fromEntity(ShippingInfoEntity entity) {
    name = entity.name;
    phone = entity.phone;
    email = entity.email;
    address = entity.address;
    city = entity.city;
    addressDetails = entity.addressDetails;
  }

  toJson() {
    return {
      "name": name,
      "phone": phone,
      "email": email,
      "address": address,
      "city": city,
      "addressDetails": addressDetails,
    };
  }

  String getFullAddress() {
    return "$address, $addressDetails, $city";
  }
}
