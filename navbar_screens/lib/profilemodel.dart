import 'package:flutter/material.dart';

class ProfileModel{
  String ? name;
  String ? email;
  String ? address;
  String ? phone;
  String ? image;
  String ? about;

ProfileModel({
  required this.name,
  required this.email,
  required this.address,
  required this.phone,
  required this.image,
  required this.about
});  
}