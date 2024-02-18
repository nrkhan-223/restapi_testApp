import 'package:flutter/material.dart';
import 'package:restapi_test/apis/user_api.dart';
import 'package:velocity_x/velocity_x.dart';
import '../model/model_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Users> users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        backgroundColor: Colors.blue,
        title: "rest api call".text.makeCentered(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final String fullName =
                '${user.name.title} ${user.name.first} ${user.name.last}';
            final email = user.email;

            final dob = user.dob.age;
            final image = user.picture.thumbnail;
            final color = user.gender == 'male' ? Colors.green : Colors.purple;
            return ListTile(
              trailing: dob.text.white.size(15).make(),
              tileColor: color,
              leading:
                  Image.network(image).box.rounded.clip(Clip.antiAlias).make(),
              title: fullName.text.white.make(),
              subtitle: email.text.white.make(),
            );
          }),
    );
  }

  Future<void> getUser() async {
    final response = await UserApi.getUsers();
    setState(() {
      users = response;
    });
  }
}
