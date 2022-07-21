import 'package:flutter/material.dart';
import 'package:tugas4/controller.dart';


class DetailRecent extends StatefulWidget {

  final  _id_contact;
  DetailRecent(
      this._id_contact,
      );
  @override
  State<DetailRecent> createState() => _DetailRecentState();
}

class _DetailRecentState extends State<DetailRecent> {
  PageController controller=PageController();
  bool isTextEmpty = false;
  bool isTextEmpty2 = false;

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
                    height: 260,
                    padding: const EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
                    child: Image.asset('assets/images/profil.png',
                    ),
                  ),
                  Text(txtController.NameController2.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20
                    ),),
                  SizedBox(height: 40,),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 10.0),
                      child: Row(
                        children: [
                          Icon(Icons.phone,size: 30,),
                          Container(width: 20,),
                          Text(txtController.PhoneController.text,
                            style: TextStyle(
                                fontSize: 18
                            ),),
                        ],
                      )
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 10.0),
                      child: Row(
                        children: [
                          Icon(Icons.assured_workload,size: 30,),
                          Container(width: 20,),
                          Text(txtController.CompanyController.text,
                            style: TextStyle(
                                fontSize: 18
                            ),),
                        ],
                      )
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 10.0),
                      child: Row(
                        children: [
                          Icon(Icons.work_history,size: 30,),
                          Container(width: 20,),
                          Text(txtController.JobController.text,
                            style: TextStyle(
                                fontSize: 18
                            ),),
                        ],
                      )
                  ),

                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(100.0, 10.0, 60.0, 10.0),
                      child: Row(
                        children: [
                          Icon(Icons.mail,size: 30,),
                          Container(width: 20,),
                          Text(txtController.EmailController2.text,
                            style: TextStyle(
                                fontSize: 18
                            ),),
                        ],
                      )
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
