import 'package:flutter/foundation.dart';

enum AddressType { home, office, Other }

class Address{
  final String id;
  final String label;
  final String fulladdress;
  final String city;
  final String state;
  final String zipCode;
  final bool isDefault;
  final AddressType type;

  Address({
    required this.id,
    required this.label,
    required this.fulladdress,
    required this.city,
    required this.state,
    required this.zipCode,
    this.isDefault= false,
    this.type = AddressType.home
  });
  String get typeString => type.name;
}