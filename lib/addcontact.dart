import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tugas4/controller.dart';
import 'package:tugas4/mycontact.dart';
import 'package:dio/dio.dart';

class AddContactPage extends StatelessWidget {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Contact",
      home: const AddContact(),
    );
  }
}

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  PageController controller=PageController();
  bool isTextEmpty = false;
  bool isTextEmpty2 = false;
  var gambar;
  XFile? image;
  Future _getImage() async {
    final XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedFile != null) {
      return File(pickedFile.path);
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Color.fromRGBO(220, 220, 220, 1),
            body: Container(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text('Back',
                          style: TextStyle(
                              fontSize: 17
                          ),)
                      ],
                    ),
                  ),
                  Container(
                    height: 300,
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: gambar == null
                        ? IconButton(
                      icon: const Icon(Icons.person_rounded, color: Colors.black, size: 150,),
                      onPressed: () async {
                        gambar = await _getImage();
                        setState(() {
                          gambar == image;
                        });
                      },
                    ):
                    Image.file(gambar),
                  ),
                  Container(
                    height: 78,
                    padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                    child: TextField(

                      controller: txtController.NameController2,
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            isTextEmpty = true;
                          } else {
                            isTextEmpty = false;
                          }
                        });
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,
                          color: MaterialStateColor.resolveWith((states) {
                            if (isTextEmpty) {
                              return const Color(0xFF808080);
                            }
                            return const Color.fromRGBO(0, 0, 0, 1);
                          }),
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(196, 196, 196, 1),
                        hintText: 'Name',
                        hintStyle: TextStyle(fontSize: 17.0, color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(width: 1,color: Color.fromRGBO(182, 175, 175, 1)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 78,
                    padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                    child: TextField(
                      controller: txtController.PhoneController,
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            isTextEmpty = true;
                          } else {
                            isTextEmpty = false;
                          }
                        });
                      },

                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_android,
                          color: MaterialStateColor.resolveWith((states) {
                            if (isTextEmpty) {
                              return const Color(0xFF808080);
                            }
                            return const Color.fromRGBO(0, 0, 0, 1);
                          }),
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(196, 196, 196, 1),
                        hintText: 'Phone',
                        hintStyle: TextStyle(fontSize: 17.0, color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(width: 1,color: Color.fromRGBO(182, 175, 175, 1)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 68,
                    padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 0.0),
                    child: TextField(
                      controller: txtController.EmailController2,
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            isTextEmpty2 = true;
                          } else {
                            isTextEmpty2 = false;
                          }
                        });
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email,
                          color: MaterialStateColor.resolveWith((states) {
                            if (isTextEmpty2) {
                              return const Color(0xFF808080);
                            }
                            return const Color.fromRGBO(0, 0, 0, 1);
                          }),
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(196, 196, 196, 1),
                        hintText: 'Email',
                        hintStyle: TextStyle(fontSize: 17.0, color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(width: 1,color: Color.fromRGBO(182, 175, 175, 1)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 4,
                          child: TextField(
                            controller: txtController.CompanyController,
                            onChanged: (value) {
                              setState(() {
                                if (value.isNotEmpty) {
                                  isTextEmpty = true;
                                } else {
                                  isTextEmpty = false;
                                }
                              });
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.assured_workload_sharp,
                                color: MaterialStateColor.resolveWith((states) {
                                  if (isTextEmpty) {
                                    return const Color(0xFF808080);
                                  }
                                  return const Color.fromRGBO(0, 0, 0, 1);
                                }),
                              ),
                              filled: true,
                              fillColor: const Color.fromRGBO(196, 196, 196, 1),
                              hintText: 'Company',
                              hintStyle: TextStyle(fontSize: 17.0, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(width: 1,color: Color.fromRGBO(182, 175, 175, 1)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 4,
                          child: TextField(
                            controller: txtController.JobController,
                            onChanged: (value) {
                              setState(() {
                                if (value.isNotEmpty) {
                                  isTextEmpty = true;
                                } else {
                                  isTextEmpty = false;
                                }
                              });
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.work_history_rounded,
                                color: MaterialStateColor.resolveWith((states) {
                                  if (isTextEmpty) {
                                    return const Color(0xFF808080);
                                  }
                                  return const Color.fromRGBO(0, 0, 0, 1);
                                }),
                              ),
                              filled: true,
                              fillColor: const Color.fromRGBO(196, 196, 196, 1),
                              hintText: 'Job',
                              hintStyle: TextStyle(fontSize: 17.0, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(width: 1,color: Color.fromRGBO(182, 175, 175, 1)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 78,
                    padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0)
                          ),
                          primary: const Color.fromRGBO(233,69, 96, 1)
                      ),
                      onPressed: () {
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                        child: TextButton(
                            onPressed: ()
                            async {
                              var dio = Dio();
                              try {
                                var token = txtController.token;
                                var options = dio.options;
                                options.headers['Authorization'] = 'Bearer $token';
                                dio.options = options;
                                var response = await dio.post(
                                    'https://phone-book-api.herokuapp.com/api/v1/contacts',
                                    data: {
                                      "name": txtController.NameController2.text,
                                      "phone": txtController.PhoneController.text,
                                      "email": txtController.EmailController2.text,
                                      "company": txtController.CompanyController.text,
                                      "job": txtController.JobController.text
                                    }
                                );
                                print(response);
                                //String token = response.data['data'];
                                print('Token: $token');
                                if (token != null){
                                  print(options.headers);
                                } else {
                                  print('Token tidak valid');
                                };
                                options.headers['Authorization'] = 'Bearer $token';
                                dio.options = options;
                                try{
                                  var response = await dio.get(
                                      'https://phone-book-api.herokuapp.com/api/v1/contacts');
                                  Data.contactList = response.data['data'];
                                  Data.contactList.sort((a,b) => a['name'].compareTo(b['name']));
                                } catch (e, stackTrace) {
                                  print("Error: $e");
                                  print("Stack Trace: $stackTrace");
                                }
                                showDialog (
                                  context: context,
                                  builder: (BuildContext context) =>
                                      popupDialogSukses(),
                                );
                              }
                              catch (e, stackTrace) {
                                print("Error: $e");
                                print("Stack Trace: $stackTrace");
                              }
                              /*showDialog (
                                context: context,
                                builder: (BuildContext context) =>
                                    popupDialogGagal(),
                              )*/;},
                            child:const Text(
                              'CREATE NEW ACCOUNT',
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class popupDialogGagal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      title: Container(
        height: 40,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0)
          ),
          color: Color(0xFFCA000E),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 25),
          child: Text(
              'ADD CONTACT FAILED ',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'MMC',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
              )
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('There are fields that required your attention',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'MMC',
              )
          ),
          SizedBox(height: 40,),
          // Tombol Putih Kembali
          Container(
            width: 150,
            height: 40,
            padding: EdgeInsets.only(left:10, right:10),
            child: ElevatedButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              style: ElevatedButton.styleFrom(
                  elevation: 1,
                  primary: Colors.white,
                  side: BorderSide(
                    color: Color(0xFFCA000E),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: Text(
                  'RETRY',
                  style: TextStyle(
                    fontFamily: 'MMC',
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFCA000E),
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class popupDialogSukses extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      title: Container(
        height: 40,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0)
          ),
          color: Colors.green,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 25),
          child: Text(
              'SUCCESS',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'MMC',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
              )
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Contact successfully created',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'MMC',
              )
          ),
          SizedBox(height: 40,),
          // Tombol Putih Kembali
          Container(
            width: 150,
            height: 40,
            padding: EdgeInsets.only(left:10, right:10),
            child: ElevatedButton(
              onPressed: (() {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context)
                    {return MyContact();}));
              }),
              style: ElevatedButton.styleFrom(
                  elevation: 1,
                  primary: Colors.white,
                  side: BorderSide(
                    color: Colors.green,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: Text(
                  'OK',
                  style: TextStyle(
                    fontFamily: 'MMC',
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Colors.green,
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}