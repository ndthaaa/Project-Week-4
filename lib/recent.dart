import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tugas4/detailrecent.dart';
import 'package:tugas4/editcontacts.dart';
import 'package:tugas4/mycontact.dart';
import 'package:tugas4/favorite.dart';
import 'controller.dart';


class Recent extends StatefulWidget {
  const Recent({Key? key}) : super(key: key);

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  PageController controller=PageController();
  static final SearchController = TextEditingController();

  var dio = Dio();
  void refresh () async {
    dio.options.headers['Authorization'] =
    'Bearer ${txtController.token}';
    try {
      var response = await dio.get(
        'https://phone-book-api.herokuapp.com/api/v1/contacts',
      );
      Data.contactList = response.data['data'];
      Data.contactList.sort((a, b) => a['name'].compareTo(b['name']));
      setState(() {
      });
    } catch (e, stackTrace) {
      print('Error: $e');
      print('Stack Trace: $stackTrace');
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
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text('     Recent',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                            ),),
                        ],
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    Container(
                      height: 78,
                      padding: const EdgeInsets.fromLTRB(18.0, 5.0, 17.0, 5.0),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search,
                          ),
                          filled: true,
                          fillColor: const Color.fromRGBO(190, 190, 190, 1),
                          hintText: 'Search Contact',
                          hintStyle: TextStyle(fontSize: 14.0, color: Colors.black),
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
                    SizedBox(height: 10,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 0; i <Data.contactRecent.length; i++)
                            Container(
                              child: Row(
                                  children: [
                                    Container(width: 20,),
                                    Icon(Icons.account_circle_rounded, size:50,),
                                    Container(width: 20,),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[
                                          new GestureDetector(
                                            onTap: ()async{
                                              //fungsi edit
                                              txtController.NameController2.text = Data.contactRecent[i]['name'];
                                              txtController.PhoneController.text = Data.contactRecent[i]['phone'];
                                              txtController.EmailController2.text = Data.contactRecent[i]['email'];
                                              txtController.CompanyController.text = Data.contactRecent[i]['company'];
                                              txtController.JobController.text = Data.contactRecent[i]['job'];
                                              await Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                return DetailRecent(Data.contactRecent[i]['id']);
                                              }));
                                            },
                                            child: Text(
                                              Data.contactRecent[i]['name'],
                                              style: TextStyle(
                                                  fontSize: 16, fontWeight: FontWeight.w400),
                                            ),),
                                          SizedBox(height: 10,),
                                          Text(
                                            Data.contactRecent[i]['phone'],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
                                          ),
                                          SizedBox(height: 10,),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    PopupMenuButton(
                                      color: Color.fromRGBO(196, 196, 196, 1),
                                      icon: Icon(Icons.more_horiz,size:27),
                                      itemBuilder: (context) => [
                                        PopupMenuItem(
                                          value: 'fav',
                                          child: Row(
                                            children: <Widget>[
                                              Text('Add to Favorite'),
                                              Spacer(),
                                              Icon(
                                                Icons.star,
                                                color: Colors.black,
                                              )
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem(
                                          value: 'edit',
                                          child: Row(
                                            children: <Widget>[
                                              Text('Edit'),
                                              Spacer(),
                                              Icon(
                                                Icons.edit,
                                                color: Colors.black,
                                              )
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem(
                                          value: 'delete',
                                          child: Row(
                                            children: <Widget>[
                                              Text('Delete'),
                                              Spacer(),
                                              Icon(
                                                Icons.delete,
                                                color: Colors.black,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                      onSelected: (value) async {
                                        // if value fav show dialog
                                        if (value == 'fav') {
                                          // fungsi favorite
                                          Data.contactFavorite.add(Data.contactList[i]);
                                          await Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return Favorite();
                                          }));
                                        }
                                        else if (value == 'edit') {
                                          //if value edit show dialog
                                          txtController.NameController2.text = Data.contactList[i]['name'];
                                          txtController.PhoneController.text = Data.contactList[i]['phone'];
                                          txtController.EmailController2.text = Data.contactList[i]['email'];
                                          txtController.CompanyController.text = Data.contactList[i]['company'];
                                          txtController.JobController.text = Data.contactList[i]['job'];
                                          await Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return EditContacts(Data.contactList[i]['id']);
                                          }));
                                        }
                                        else if (value == 'delete') {
                                          //if value delete show dialog
                                          var dio = Dio();
                                          dio.options.headers['authorization']='Bearer ${txtController.token}';
                                          try{
                                            var options = dio.options;
                                            var response = await dio.delete(
                                                'https://phone-book-api.herokuapp.com/api/v1/contacts/${Data.contactList[i]['id']}');}
                                          catch (e, stackTrace) {
                                            print('Error: $e');
                                            print('Stack Trace: $stackTrace');
                                          }
                                          refresh();
                                        }
                                      },
                                    ),
                                    Container(width: 10,),
                                  ]
                              ),
                            ),
                        ],
                      ),
                    ),
                  ]),
            ),
            bottomNavigationBar: BottomAppBar(
                color: Color.fromRGBO(196, 196, 196, 1),
                //onTap: _onItemTapped,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Container(
                        height:60,
                        child:
                        IconButton(
                            icon: const Icon(Icons.access_time_filled),
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                return const Recent();}));
                            }
                        ),
                      ),
                      Container(
                        height:60,
                        child:
                        IconButton(
                            icon: const Icon(Icons.person_outline_sharp),
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                return const MyContact();}));
                            }
                        ),
                      ),
                      Container(
                        height:60,
                        child:
                        IconButton(
                            icon: const Icon(Icons.star_border_outlined),
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                return const Favorite();}));
                            }
                        ),
                      ),
                    ]

                )),),
        ],
      ),
    );
  }
}


