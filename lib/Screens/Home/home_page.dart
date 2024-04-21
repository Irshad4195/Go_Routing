import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Bloc/swipe/swipe_bloc.dart';
import '../../Temp/swipeDirectionDetector.dart';
import '../../Temp/toggleSwitch.dart';
import '../../Temp/userCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: const [
          ToggleSwitch(),
          SizedBox(
            width: 10,
          )
        ],
        leading: IconButton(
            icon: const Icon(Icons.notifications),
            iconSize: 30,
            onPressed: () {
              context.goNamed("notification");
            }),
      ),
      // customAppBar("Home Page", true),
      body: BlocBuilder<SwipeBloc, SwipeState>(
          builder: (context, SwipeState state) {
        if (state is SwipeInitialState || state is SwipeUpState) {
          return SwipeDirectionDetector(
            children: UserCard(
              user: state.user,
            ),
            onSwipe: () {
              context.read<SwipeBloc>().add(
                    const SwipeUpEvent(),
                  );
            },
            onDoubleTap: () {
              context.read<SwipeBloc>().add(
                    const SwipeLikeEvent(),
                  );
            },
          );
        }
        if (state is SwipeLikeState) {
          return SwipeDirectionDetector(
            children: UserCard(
              user: state.user,
            ),
            onSwipe: () {
              context.read<SwipeBloc>().add(
                    const SwipeUpEvent(),
                  );
            },
            onDoubleTap: () {
              context.read<SwipeBloc>().add(
                    const SwipeLikeEvent(),
                  );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});
//
//   @override
//   State<HomeView> createState() => _HomeViewState();
// }
//
// class _HomeViewState extends State<HomeView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.redAccent,
//         title: const Text("Home"),
//       ),
//       body: SizedBox(
//         width: double.infinity,
//         height: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(
//               Icons.home,
//               color: Colors.red,
//               size: 100,
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             const Text(
//               "Home",
//               style: TextStyle(fontSize: 30),
//             ),
//             const SizedBox(
//               height: 12,
//             ),
//             MaterialButton(
//               color: Colors.redAccent,
//               onPressed: () {
//                 context.goNamed("subHome");
//               },
//               child: const Text(
//                 "Navigate To Sub Home View",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
