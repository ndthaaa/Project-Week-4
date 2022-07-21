import 'package:flutter/material.dart';
import 'package:tugas4/addcontact.dart';
import 'package:tugas4/recent.dart';
import 'package:tugas4/favorite.dart';
import 'controller.dart';

class MyContact extends StatefulWidget {
  const MyContact({Key? key}) : super(key: key);

  @override
  State<MyContact> createState() => _MyContactState();
}

class _MyContactState extends State<MyContact> {
  PageController controller = PageController();
  final TextEditingController _searchCon = TextEditingController();

  int _selectedIndex = 1;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //     // controller.animateToPage(index, duration: Duration(milliseconds: 1), curve: Curves.ease);
  //   });
  // }

  // final List<Widget> index = [Recents(), MyContacts(), Favorites()];

  // void _selectedNavBar(String _onItemTapped, int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDCDCDC),
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  'My Contacts',
                  style: TextStyle(fontSize: 19, color: Colors.black),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.push((context),
                          MaterialPageRoute(builder: (_) => AddContact()));
                    },
                    icon: Icon(
                      Icons.person_add_alt_1,
                      color: Colors.black,
                    ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _searchCon,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(fontSize: 16, color: Color(0xFFB6AFAF)),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFBEBEBE),
                prefixIcon:
                Icon(Icons.search_rounded, color: Color(0xFFB6AFAF)),
                hintText: 'Search',
                hintStyle: TextStyle(fontSize: 16, color: Color(0xFFB6AFAF)),
                border: InputBorder.none,
              ),
            ),
          ),
        ]),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i <Data.contactList.length; i++)
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Data.contactList[i]['name'],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                Data.contactList[i]['phone'],
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                          Spacer(),
                          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
                        ],
                      )),
              ],
            ),
          )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(196, 196, 196, 1),

        ///onTap: _onItemTapped,
        selectedItemColor: Color.fromRGBO(5, 70, 106, 1),
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex != 0
                ? GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => Recent(),
                        transitionDuration: const Duration(seconds: 0),
                      ));
                },
                child: Icon(Icons.access_time_outlined))
                : Icon(Icons.access_time_filled),
            label: 'Recents',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex != 1
                ? GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => MyContact(),
                        transitionDuration: const Duration(seconds: 0),
                      ));
                },
                child: Icon(Icons.person_outlined))
                : Icon(Icons.person),
            label: 'My Contacts',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex != 2
                ? GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => Favorite(),
                        transitionDuration: const Duration(seconds: 0),
                      ));
                },
                child: Icon(Icons.star_outlined))
                : Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
