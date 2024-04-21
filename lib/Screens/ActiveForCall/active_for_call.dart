import 'package:flutter/material.dart';

import '../../Temp/custom_app_bar.dart';
import '../../UserModel/userModel.dart';

class ActiveCallScreen extends StatelessWidget {
  final List<User> users;
  const ActiveCallScreen({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Active For Call", false),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: ListTile(
              title: Text('${users[index].name}, ${users[index].age}'),
              subtitle: Text(
                  '${users[index].languages.first} - ${users[index].languages.last}'),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(users[index].imageUrls[0]),
              ),
            ),
          );
        },
        itemCount: users.length,
      ),
    );
    // bottomNavigationBar: bottomNavigationBar(context),
    //);
  }
}
