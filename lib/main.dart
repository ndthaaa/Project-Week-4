import 'package:flutter/material.dart';
import 'package:tugas4/addcontact.dart';
import 'package:tugas4/favorite.dart';
import 'package:tugas4/signin.dart';

import 'routes.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      initialRoute: '/signin',
      routes: {
        MyRoutes.signin: (context) => SignIn(),
        MyRoutes.addcontact: (context) => AddContact(),
        MyRoutes.favorite: (context) => Favorite(),
      }
  )
  );
}

