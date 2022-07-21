import 'package:flutter/material.dart';
import 'package:tugas4/detailcontacts.dart';
import 'package:tugas4/editcontacts.dart';
import 'package:tugas4/favorite.dart';
import 'package:tugas4/recent.dart';
import 'controller.dart';
import 'package:dio/dio.dart';


class MyContactPage extends StatelessWidget {
  const MyContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Contact",
      home: const MyContact(),
    );
  }
}

class MyContact extends StatefulWidget {
  const MyContact({Key? key}) : super(key: key);

  @override
  State<MyContact> createState() => _MyContactState();
}

class _MyContactState extends State<MyContact> {
  PageController controller=PageController();
  final SearchController = TextEditingController();

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
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text('     My Contacts',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                            ),),
                          Spacer(),
                          IconButton(onPressed: (){
                            Navigator.pushNamed(context, '/addcontact');
                          }, icon: Icon(Icons.person_add_alt_1))
                        ],
                      ),
                    ),
                    Container(
                      height: 78,
                      padding: const EdgeInsets.fromLTRB(18.0, 5.0, 17.0, 5.0),
                      child: TextField(
                        //onChanged: (value) => _runFilter(value),
                        controller: SearchController,
                        onChanged: (value) {
                          setState(() {});
                        },
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
                          if (SearchController.text.isNotEmpty)
                            for (int i = 0; i <Data.contactList.length; i++)
                              if((Data.contactList[i]['name'].toString().toLowerCase().contains(SearchController.text.toLowerCase())))
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
                                                  txtController.NameController2.text = Data.contactList[i]['name'];
                                                  txtController.PhoneController.text = Data.contactList[i]['phone'];
                                                  txtController.EmailController2.text = Data.contactList[i]['email'];
                                                  txtController.CompanyController.text = Data.contactList[i]['company'];
                                                  txtController.JobController.text = Data.contactList[i]['job'];
                                                  await Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                    return DetailContacts(Data.contactList[i]['id'],Data.contactList[i]['image']);
                                                  }));
                                                  Data.contactRecent.add(Data.contactList[i]);
                                                },
                                                child: Text(
                                                  Data.contactList[i]['name'],
                                                  style: TextStyle(
                                                      fontSize: 16, fontWeight: FontWeight.w400),
                                                ),),
                                              SizedBox(height: 10,),
                                              Text(
                                                Data.contactList[i]['phone'],
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
                                            // if value 1 show dialog
                                            if (value == 'fav') {
                                              // fungsi favorite
                                              Data.contactFavorite.add(Data.contactList[i]);
                                              await Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                return Favorite();
                                              }));
                                            }
                                            else if (value == 'edit') {
                                              //fungsi edit
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
                                              //fungsi delete
                                              var dio= Dio ();
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

                          if (SearchController.text.isEmpty)
                            for (int i = 0; i <Data.contactList.length; i++)
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
                                                txtController.NameController2.text = Data.contactList[i]['name'];
                                                txtController.PhoneController.text = Data.contactList[i]['phone'];
                                                txtController.EmailController2.text = Data.contactList[i]['email'];
                                                txtController.CompanyController.text = Data.contactList[i]['company'];
                                                txtController.JobController.text = Data.contactList[i]['job'];
                                                await Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                  return DetailContacts(Data.contactList[i]['id'], Data.contactList[i]['image']);
                                                }));
                                                Data.contactRecent.add(Data.contactList[i]);
                                              },
                                              child: Text(
                                                Data.contactList[i]['name'],
                                                style: TextStyle(
                                                    fontSize: 16, fontWeight: FontWeight.w400),
                                              ),),
                                            SizedBox(height: 10,),
                                            Text(
                                              Data.contactList[i]['phone'],
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
                                          // if value 1 show dialog
                                          if (value == 'fav') {
                                            // fungsi favorite
                                            Data.contactFavorite.add(Data.contactList[i]);
                                            await Navigator.push(context, MaterialPageRoute(builder: (context) {
                                              return Favorite();
                                            }));
                                          }
                                          else if (value == 'edit') {
                                            //fungsi edit
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
                                            //fungsi delete
                                            var dio= Dio ();
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
                            icon: const Icon(Icons.access_time_outlined),
                            onPressed: () async {
                              // fungsi favorite
                              await Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return Recent();
                              }));
                            }),
                      ),
                      Container(
                        height:60,
                        child:
                        IconButton(
                            icon: const Icon(Icons.person),
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
                                return Favorite();}));
                            }
                        ),
                      ),
                    ]
                )),),
        ],),
    );
  }
}
