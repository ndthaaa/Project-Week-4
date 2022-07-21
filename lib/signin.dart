import 'package:flutter/material.dart';
import 'package:tugas4/mycontact.dart';
import 'package:tugas4/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'controller.dart';



class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      home: const SignIn(),
    );
  }
}

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _passVisibility = true;
  bool isTextEmpty = false;
  bool isTextEmpty2 = false;
  final TextEditingController _passCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final token = false;

  saveToken ()async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token',
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im5kaXRoYUBnbWFpbC5jb20iLCJwYXNzd29yZCI6ImVhNjIwNTQ1ZGU0NTk1NjE1NGIzMDZhOTUxOGRiYTg2IiwiaWF0IjoxNjU4MDU3Njg1LCJleHAiOjE2NTgxNDQwODV9.zXN2_P44HfFyGqrfvGeYqJoFaQPpDkzjR6GhEVuirNU");
    if (token == ''){
      print("tidak bisa login");
    }else{
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context)=>MyContact())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: <Widget> [
          Scaffold(
            backgroundColor:Color.fromRGBO(5, 70, 106, 1),
            body: Container(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 30.0),
                    child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute
                            (builder: (context)
                          {return const SignUp();
                          }));},
                        child:const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        )),
                  ),
                  Container(
                    height: 300,
                    padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                    child: Image.asset('assets/images/logo_contact1.png',
                    ),
                  ),
                  Container(
                    height: 50,
                  ),
                  Container(
                    height: 78,
                    padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                    child: TextField(
                      controller: _emailCon,
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
                        prefixIcon: Icon(Icons.email,
                          color: MaterialStateColor.resolveWith((states) {
                            if (isTextEmpty) {
                              return const Color.fromRGBO(182, 175, 175, 1);
                            }
                            return const Color(0xFF808080);
                          }),
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(29, 62, 83, 1),
                        hintText: 'Email',
                        hintStyle: TextStyle(fontSize: 17.0, color: Color.fromRGBO(182, 175, 175, 1)),
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
                    height: 10,
                  ),
                  Container(
                    height: 68,
                    padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 0.0),
                    child: TextField(
                      controller: _passCon,
                      obscureText: _passVisibility,
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
                          prefixIcon: Icon(Icons.lock,
                            color: MaterialStateColor.resolveWith((states) {
                              if (isTextEmpty2) {
                                return const Color.fromRGBO(182, 175, 175, 1);
                              }
                              return const Color(0xFF808080);
                            }),
                          ),
                          filled: true,
                          fillColor: const Color.fromRGBO(29, 62, 83, 1),
                          hintText: 'Password',
                          hintStyle: TextStyle(fontSize: 17.0, color: Color.fromRGBO(182, 175, 175, 1)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(width: 1,color: Color.fromRGBO(182, 175, 175, 1)),
                          ),
                          suffixIcon: IconButton(onPressed: () {
                            setState(() {
                              _passVisibility = !_passVisibility;
                            });
                          },
                              icon: _passVisibility
                                  ? const Icon(Icons.visibility_off_outlined, color: Color(0xFF808080))
                                  : const Icon(Icons.visibility_outlined, color: Color(0xFF808080))
                          )
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
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
                            onPressed: () //=> saveData()
                            async{
                              var dio= Dio ();
                              try{
                                var options = dio.options;
                                options.headers['authorization']='Bearer token';
                                dio.options =options;
                                var response = await dio.post ('https://phone-book-api.herokuapp.com/api/v1/signin',
                                  data: {
                                    "email": _emailCon.text,
                                    "password": _passCon.text
                                  },
                                );
                                String token = response.data['data']['token']??'';
                                print('Token: $token');
                                txtController.token = token;

                                if (token.isNotEmpty){
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
                                /*  final prefs = await SharedPreferences.getInstance();
                                prefs.setString('token',
                                    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im5kaXRoYUBnbWFpbC5jb20iLCJwYXNzd29yZCI6ImVhNjIwNTQ1ZGU0NTk1NjE1NGIzMDZhOTUxOGRiYTg2IiwiaWF0IjoxNjU4MDU3Njg1LCJleHAiOjE2NTgxNDQwODV9.zXN2_P44HfFyGqrfvGeYqJoFaQPpDkzjR6GhEVuirNU");
                               String token = response.data['data']['token']??'';
                               print ('token: $token');*/
                                catch (e, stackTrace) {
                                  print('Error: $e');
                                  print('Stack Trace: $stackTrace');
                                }
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                  return const MyContact();}));
                              } catch (e, stackTrace) {
                                print('Error: $e');
                                print('Stack Trace: $stackTrace');

                                showDialog (
                                  context: context,
                                  builder: (BuildContext context) =>
                                      popupDialog(),
                                );
                              }
                            },
                            child:const Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            )),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class popupDialog extends StatelessWidget {

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
              'FAILED TO LOGIN',
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
          Text('invalid username or password',
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
                  'BACK',
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