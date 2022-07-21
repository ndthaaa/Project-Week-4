import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tugas4/controller.dart';
import 'package:tugas4/mycontact.dart';
import 'package:dio/dio.dart';

class EditContacts extends StatefulWidget {
  final  _id_contact;
  EditContacts(
      this._id_contact,
      );
  @override
  State<EditContacts> createState() => _EditContactsState();
}

class _EditContactsState extends State<EditContacts> {
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
                        //if (gambar != null) {
                        //refreshFoto();
                        //}
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
                            async{
                              var dio= Dio ();
                              try{
                                var token = txtController.token;
                                var options = dio.options;
                                options.headers['authorization']='Bearer $token';
                                dio.options =options;
                                FormData formData = FormData.fromMap({
                                  "name": txtController.NameController2.text,
                                  "phone": txtController.PhoneController.text,
                                  "job": txtController.JobController.text,
                                  "company": txtController.CompanyController.text,
                                  "email": txtController.EmailController2.text,
                                  "image": gambar != null ? await MultipartFile.fromFile(gambar.path) : null,});
                                var response = await dio.put(
                                  'https://phone-book-api.herokuapp.com/api/v1/contacts/${widget._id_contact}',
                                  data: formData,
                                );
                                //String token = response.data['data']['token']??'';
                                print('Token: $token');
                                if (token != null){
                                  print(options.headers);
                                }else{
                                  print('Token invalid');
                                };
                                options.headers['Authorization']='Bearer $token';
                                dio.options=options;
                                try{
                                  var response = await dio.get(
                                    'https://phone-book-api.herokuapp.com/api/v1/contacts',
                                  );
                                  Data.contactList = response.data['data'];
                                  Data.contactList.sort((a,b) => a['name'].compareTo(b['name']));
                                }
                                catch (e, stackTrace) {
                                  print('Error: $e');
                                  print('Stack Trace: $stackTrace');
                                }
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                  return const MyContact();}));
                              } catch (e, stackTrace) {
                                print('Error: $e');
                                print('Stack Trace: $stackTrace');
                              }
                            },
                            child:const Text(
                              'SAVE',
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
