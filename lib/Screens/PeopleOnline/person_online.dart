import 'package:flutter/material.dart';
import 'package:go_routing_example/Temp/custom_app_bar.dart';
import '../../UserModel/userModel.dart';

class PeopleOnlineScreen extends StatefulWidget {
  final List<User> users;
  const PeopleOnlineScreen({super.key, required this.users});

  @override
  State<PeopleOnlineScreen> createState() => _PeopleOnlineScreenState();
}

class _PeopleOnlineScreenState extends State<PeopleOnlineScreen> {
   // List<User> users = User.users;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("People Online", false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: MediaQuery.of(context).size.height * 0.27,
          ),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.22,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(widget.users[index].imageUrls[0]),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.users[index].name},${widget.users[index].age}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          // fontSize: 16
                        ),
                      ),
                      Text(
                        widget.users[index].distanceAway.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          // fontSize: 14
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          itemCount: widget.users.length,
        ),
      ),
    );
  }
}
