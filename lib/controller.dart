import 'package:flutter/material.dart';

class txtController {
  static final NameController = TextEditingController();
  static final NameController2 = TextEditingController();
  static final PhoneController = TextEditingController();
  static final EmailController2 = TextEditingController();
  static final CompanyController = TextEditingController();
  static final JobController = TextEditingController();
  static String? token;
}


class Data {
  static List<dynamic> contactList=[];
  static List<dynamic> contactFavorite=[];
  static List<dynamic> contactRecent=[];
  static Map<String,dynamic>? contactInfo;
}