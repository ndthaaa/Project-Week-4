import 'package:flutter/material.dart';
import 'package:tugas4/detailcontacts.dart';
import 'package:tugas4/detailfavorites.dart';
import 'package:tugas4/mycontact.dart';
import 'package:tugas4/recent.dart';
import 'controller.dart';


class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  PageController controller=PageController();

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
                          Text('     Favorites',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                            ),),
                          Spacer(),
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
                          for (int i = 0; i <Data.contactFavorite.length; i++)
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
                                              txtController.NameController2.text = Data.contactFavorite[i]['name'];
                                              txtController.PhoneController.text = Data.contactFavorite[i]['phone'];
                                              txtController.EmailController2.text = Data.contactFavorite[i]['email'];
                                              txtController.CompanyController.text = Data.contactFavorite[i]['company'];
                                              txtController.JobController.text = Data.contactFavorite[i]['job'];
                                              await Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                return DetailFavorites(Data.contactFavorite[i]['id']);
                                              }));
                                            },
                                            child: Text(
                                              Data.contactFavorite[i]['name'],
                                              style: TextStyle(
                                                  fontSize: 16, fontWeight: FontWeight.w400),
                                            ),),
                                          SizedBox(height: 10,),
                                          Text(
                                            Data.contactFavorite[i]['phone'],
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
                                    Icon(Icons.star,size: 25,),
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
                            icon: const Icon(Icons.star,),
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                return Favorite();}));
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


