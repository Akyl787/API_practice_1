import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_37_api/models/main_page_models.dart';
import 'package:practice_37_api/second_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<UserInfoModel> usersList = [];

  getAllUSers() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/posts');

    var response = await http.get(url);

    print("statusCode == ${response.statusCode}");
    print("statusCode == ${response.body}");

    if (response.statusCode == 200) {
      Iterable data = json.decode(response.body);
      usersList = List<UserInfoModel>.from(
          data.map((model) => UserInfoModel.fromJson(model)));
      setState(() {});
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          print('11111');
          getAllUSers();
        },
      ),
      appBar: AppBar(
        title: Text("API practice 1"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: usersList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(
                    id: usersList[index].id.toString(),
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Text("${usersList[index].id ?? 0}"),
                Text("${usersList[index].userId ?? 0}"),
                Text("${usersList[index].body ?? "unknown"}"),
                Text("${usersList[index].title ?? "unknown"}"),
                Divider(thickness: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}
