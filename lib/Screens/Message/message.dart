import 'package:flutter/material.dart';

import '../../Temp/custom_app_bar.dart';
import '../../UserModel/userModel.dart';

class MessageScreen extends StatelessWidget {
  final List<User> users;
  const MessageScreen({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Message", false),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ChatScreen(
              //         name: users[index].name,
              //         imageUrl: users[index].imageUrls[0]),
              //   ),
              // );
            },
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: ListTile(
                title: Text('${users[index].name}, ${users[index].age}'),
                subtitle: Text(users[index].chat),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(users[index].imageUrls[0]),
                ),
              ),
            ),
          );
        },
        itemCount: users.length,
      ),
    );
  }
}
