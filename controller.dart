import 'package:flutter/material.dart';

class txtController {
  static final NameController = TextEditingController();
  static final PassswordController = TextEditingController();
  static final EmailController = TextEditingController();
  static String? token;
}

class Data {
  static List<dynamic> contactList=[];
  static Map<String,dynamic>? contactInfo;
}