import 'package:flutter/material.dart';
import 'package:tugas4/controller.dart';

class DetailContacts extends StatefulWidget {
  final  _id_contact;
  final _image;
  DetailContacts(
      this._id_contact,
      this._image
      );

  @override
  State<DetailContacts> createState() => _DetailContactsState();
}

class _DetailContactsState extends State<DetailContacts> {
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
                  widget._image == null
                      ? CircleAvatar(
                      backgroundColor: Color(0xFFC4C4C4),
                      radius: 90,
                      child: const Icon(Icons.person_rounded, size: 150, color: Colors.black)
                  )
                      : CircleAvatar(
                      radius: 90,
                      backgroundImage: NetworkImage(widget._image)),
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
