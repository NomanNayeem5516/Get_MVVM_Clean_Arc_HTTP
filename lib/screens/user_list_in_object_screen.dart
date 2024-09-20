import 'package:flutter/material.dart';
import 'package:get_api_http_clean_aec/models/user_list_in_object.dart';
import 'package:get_api_http_clean_aec/network_manager/rest_client.dart';
import 'package:get_api_http_clean_aec/screens/user_list_in_arrey_screen.dart';

import '../models/user_list_in_array.dart';

class UserListInObjectScreen extends StatefulWidget {
  const UserListInObjectScreen({super.key});

  @override
  State<UserListInObjectScreen> createState() => _UserListInObjectScreenState();
}

class _UserListInObjectScreenState extends State<UserListInObjectScreen> {
  bool loading = true;
  UserListInObjectModel userListInObjectModel=UserListInObjectModel();

  userList() {
    RestClient.getUserListInObject().then((value) {
      setState(() {
        userListInObjectModel = value as UserListInObjectModel;
        loading = false;
      });
    }).onError((error,stackTrace){
      print('error=>${error.toString()}');
    });
  }

  @override
  void initState() {
    userList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const UserListInArreyScreen()));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('UserListInObjectScreen'),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: userListInObjectModel.data?.length ?? 0,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(userListInObjectModel.data?[index].firstName ??""),
                  subtitle:Text(userListInObjectModel.data?[index].email ??"") ,
                );
              },
      ),

    );
  }
}
