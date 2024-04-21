import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({
    required this.navigationShell,
    super.key,
  });
  final StatefulNavigationShell navigationShell;

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  // int selectedIndex = 0;

  // void _goBranch(int index) {
  //   widget.navigationShell.goBranch(
  //     index,
  //     initialLocation: index == widget.navigationShell.currentIndex,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: widget.navigationShell,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
            onPressed: () {
              context.goNamed("activeForCall");
            },
            icon: const Icon(Icons.call),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {
              context.goNamed("peopleOnlineDefault");
            },
            icon: const Icon(Icons.person),
            iconSize: 30,
          ),
          IconButton(
              onPressed: () {
                context.goNamed("Home");
              },
              icon: const CircleAvatar(
                backgroundImage: AssetImage("assets/Icon.png"),
              )),
          IconButton(
            onPressed: () {
              context.goNamed("message");
            },
            icon: const Icon(Icons.message),
            iconSize: 30,
          ),
          IconButton(
              onPressed: () {
                context.goNamed("editProfile");
              },
              icon: const CircleAvatar(
                backgroundImage: AssetImage("assets/8.jpg"),
              )),
        ]),
      ),

      // SlidingClippedNavBar(
      //   backgroundColor: Colors.white,
      //   onButtonPressed: (index) {
      //     setState(() {
      //       selectedIndex = index;
      //     });
      //     _goBranch(selectedIndex);
      //   },
      //   iconSize: 35,
      //   activeColor: Colors.black,
      //   selectedIndex: selectedIndex,
      //   barItems: const [
      //     BarItem(
      //       icon: Icons.call,
      //       title: 'ActiveForCall',
      //     ),
      //     BarItem(
      //       icon: Icons.person_add_alt_1_rounded,
      //       title: 'PeopleOnline',
      //     ),
      //     BarItem(
      //       icon: Icons.home,
      //       title: 'Home',
      //     ),
      //     BarItem(
      //       icon: Icons.message,
      //       title: 'Message',
      //     ),
      //     BarItem(
      //       icon: Icons.person,
      //       title: 'UserProfile',
      //     ),
      //   ],
      // ),
    );
  }
}

// BottomAppBar(
// color: Colors.white,
// child:Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// IconButton(
// onPressed: () {
// context.read<SwipeBloc>().add(ActiveForCallEvent());
// },
// icon: const Icon(Icons.call),
// iconSize: 30,
// ),
// IconButton(
// onPressed: () {
// context.read<SwipeBloc>().add(PeopleOnlineEvent());
// },
// icon: const Icon(Icons.person),
// iconSize: 30,
// ),
// IconButton(
// onPressed: () {
// context.read<SwipeBloc>().add(const SwipeUpEvent());
// },
// icon: const CircleAvatar(
// backgroundImage: AssetImage("assets/Icon.png"),
// )),
// IconButton(
// onPressed: () {
// context.read<SwipeBloc>().add(MessageEvent());
// },
// icon: const Icon(Icons.message),
// iconSize: 30,
// ),
// IconButton(
// onPressed: () {
// context.read<SwipeBloc>().add(EditProfileEvent());
// },
// icon: const CircleAvatar(
// backgroundImage: AssetImage("assets/8.jpg"),
// )),
// ]),
// );
