import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/main_page_models.dart';

class SecondPage extends StatefulWidget {
  final String id;
  const SecondPage({
    super.key,
    required this.id,
  });

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  UserInfoModel userInfoModel = UserInfoModel();

  @override
  void initState() {
    getAllUSers(widget.id);
    super.initState();
  }

  getAllUSers(String id) async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/posts/$id');
    var response = await http.get(url);

    print("user info statusCode == ${response.statusCode}");
    print("user info response == ${response.body}");

    if (response.statusCode == 200) {
      userInfoModel = UserInfoModel.fromJson(json.decode(response.body));
      setState(() {});
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("${userInfoModel.id ?? "unknown id"}"),
          Text("${userInfoModel.userId ?? "unknown userId"}"),
          Text(userInfoModel.body ?? "testBody"),
          Text(userInfoModel.title ?? "testTitle"),
        ],
      ),
    );
  }
}
