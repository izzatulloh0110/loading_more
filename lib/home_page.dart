import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List moreLoadingList;
  ScrollController _scrollController = ScrollController();
  int _currentMax = 20;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moreLoadingList =
        List.generate(_currentMax, (index) => "Number: ${index + 1}");
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreList();
      }
    });
  }

  _getMoreList() {
    print("Get More List");
    for (int i = _currentMax; i < _currentMax + 20; i++) {
      moreLoadingList.add("Number : ${i + 1}");
    }
    _currentMax = _currentMax + 10;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        leading: Icon(Icons.notifications_outlined),
        title: Text("More loading"),
        actions: [
          MaterialButton(
            minWidth: 30,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: (Text("Search")),
            textColor: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemExtent: 65,
        itemBuilder: (context, index) {
          if (index == moreLoadingList.length) {
            return CupertinoActivityIndicator();
          }
          return ListTile(
            title: Text(moreLoadingList[index]),
          );
        },
        itemCount: moreLoadingList.length + 1,
      ),
    );
  }
}
