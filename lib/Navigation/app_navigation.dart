import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_routing_example/UserModel/userModel.dart';

import '../Screens/ActiveForCall/active_for_call.dart';
import '../Screens/EditProfileScreen/edit_profile.dart';
import '../Screens/Home/home_page.dart';
import '../Screens/Home/profile_page.dart';
import '../Screens/Message/message.dart';
import '../Screens/Notification/notification.dart';
import '../Screens/PeopleOnline/person_online.dart';
import '../Screens/Wrapper/bottom_navigation_bar.dart';

class AppNavigation {
  static String initial = "/home";

  // Private navigators
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorPeopleOnline =
      GlobalKey<NavigatorState>(debugLabel: 'shellPeopleOnline');
  static final _shellNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _shellNavigatorActiveForCall =
      GlobalKey<NavigatorState>(debugLabel: 'shellCall');
  static final _shellNavigatorMessage =
      GlobalKey<NavigatorState>(debugLabel: 'shellMessage');
  static final _shellNavigatorEditProfile =
      GlobalKey<NavigatorState>(debugLabel: 'shellEditProfile');
  static final _shellNavigatorNotification =
      GlobalKey<NavigatorState>(debugLabel: 'shellNotification');

  // GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute(
        navigatorContainerBuilder: (context, navigationShell, children) =>
            BottomNavigationBarView(
          navigationShell: navigationShell,
        ),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _shellNavigatorActiveForCall,
            routes: <RouteBase>[
              GoRoute(
                path: "/activeForCall",
                name: "activeForCall",
                builder: (BuildContext context, GoRouterState state) {
                  return ActiveCallScreen(
                    users: User.users,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorNotification,
            routes: <RouteBase>[
              GoRoute(
                path: "/notification",
                name: "notification",
                builder: (BuildContext context, GoRouterState state) {
                  return NotificationScreen(
                    users: User.users,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorPeopleOnline,
            routes: <RouteBase>[
              GoRoute(
                path: "/peopleOnline",
                name: "peopleOnlineDefault",
                builder: (BuildContext context, GoRouterState state) {
                  return PeopleOnlineScreen(
                    users: User.users,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: "/home",
                name: "Home",
                builder: (BuildContext context, GoRouterState state) =>
                    const HomePage(),
                routes: [
                  //
                  GoRoute(
                    path: "profile",
                    name: "profile",
                    pageBuilder: (context, state) {
                      // final User params = state.pathParameters as User;
                      return CustomTransitionPage<void>(
                        key: state.pageKey,
                        child: ProfileCard(user: User.users[1]),
                        transitionsBuilder: (context, animation,
                                secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorMessage,
            routes: <RouteBase>[
              GoRoute(
                path: "/message",
                name: "message",
                builder: (BuildContext context, GoRouterState state) {
                  return MessageScreen(
                    users: User.users,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorEditProfile,
            routes: <RouteBase>[
              GoRoute(
                path: "/editProfile",
                name: "editProfile",
                builder: (BuildContext context, GoRouterState state) {
                  return const EditProfileScreen();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

// class AppNavigation {
//   static String initial = "/home";
//
//   // Private navigators
//   static final _rootNavigatorKey = GlobalKey<NavigatorState>();
//   static final _shellNavigatorHome =
//       GlobalKey<NavigatorState>(debugLabel: 'shellHome');
//   // static final _shellNavigatorSettings =
//   //     GlobalKey<NavigatorState>(debugLabel: 'shellSettings');
//   static final _shellNavigatorPeopleOnline =
//       GlobalKey<NavigatorState>(debugLabel: 'shellPeopleOnline');
//   static final _shellNavigatorActiveForCall =
//       GlobalKey<NavigatorState>(debugLabel: 'shellCall');
//   static final _shellNavigatorMessage =
//       GlobalKey<NavigatorState>(debugLabel: 'shellMessage');
//   static final _shellNavigatorEditProfile =
//       GlobalKey<NavigatorState>(debugLabel: 'shellEditProfile');
//
//   // GoRouter configuration
//   static final GoRouter router = GoRouter(
//     initialLocation: initial,
//     debugLogDiagnostics: true,
//     navigatorKey: _rootNavigatorKey,
//     routes: [
//       /// Bottom Navigation Bar
//       StatefulShellRoute.indexedStack(
//         builder: (context, state, navigationShell) {
//           return BottomNavigationBarView(
//             navigationShell: navigationShell,
//           );
//         },
//         branches: <StatefulShellBranch>[
//           StatefulShellBranch(
//             navigatorKey: _shellNavigatorActiveForCall,
//             routes: <RouteBase>[
//               GoRoute(
//                 path: "/activeForCall",
//                 name: "activeForCall",
//                 builder: (BuildContext context, GoRouterState state) {
//                   return ActiveCallScreen(
//                     users: User.users,
//                   );
//                 },
//               ),
//             ],
//           ),
//           StatefulShellBranch(
//             navigatorKey: _shellNavigatorPeopleOnline,
//             routes: <RouteBase>[
//               GoRoute(
//                 path: "/peopleOnline",
//                 name: "peopleOnlineDefault",
//                 builder: (BuildContext context, GoRouterState state) {
//                   return PeopleOnlineScreen(
//                     users: User.users,
//                   );
//                 },
//               ),
//             ],
//           ),
//
//           StatefulShellBranch(
//             navigatorKey: _shellNavigatorHome,
//             routes: <RouteBase>[
//               GoRoute(
//                 path: "/home",
//                 name: "Home",
//                 builder: (BuildContext context, GoRouterState state) =>
//                     const HomePage(),
//                 routes: [
//                   //
//                   GoRoute(
//                     path: "profile",
//                     name: "profile",
//                     pageBuilder: (context, state) {
//                       // final User params = state.pathParameters as User;
//                       return CustomTransitionPage<void>(
//                         key: state.pageKey,
//                         child: ProfileCard(user: User.users[1]),
//                         transitionsBuilder: (context, animation,
//                                 secondaryAnimation, child) =>
//                             FadeTransition(opacity: animation, child: child),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//
//           /// Branch Home
//           // StatefulShellBranch(
//           //   navigatorKey: _shellNavigatorHome,
//           //   routes: <RouteBase>[
//           //     GoRoute(
//           //       path: "/home",
//           //       name: "Home",
//           //       builder: (BuildContext context, GoRouterState state) =>
//           //           const HomePage(),
//           //       routes: [
//           //         GoRoute(
//           //           path: "profile",
//           //           name: "profile",
//           //           pageBuilder: (context, state) => CustomTransitionPage<void>(
//           //             key: state.pageKey,
//           //             child: ProfileCard(
//           //               user: User.users[0],
//           //             ),
//           //             transitionsBuilder:
//           //                 (context, animation, secondaryAnimation, child) =>
//           //                     FadeTransition(opacity: animation, child: child),
//           //           ),
//           //         ),
//           //       ],
//           //     ),
//           //   ],
//           // ),
//           StatefulShellBranch(
//             navigatorKey: _shellNavigatorMessage,
//             routes: <RouteBase>[
//               GoRoute(
//                 path: "/message",
//                 name: "message",
//                 builder: (BuildContext context, GoRouterState state) {
//                   return MessageScreen(
//                     users: User.users,
//                   );
//                 },
//               ),
//             ],
//           ),
//
//           StatefulShellBranch(
//             navigatorKey: _shellNavigatorEditProfile,
//             routes: <RouteBase>[
//               GoRoute(
//                 path: "/editProfile",
//                 name: "editProfile",
//                 builder: (BuildContext context, GoRouterState state) {
//                   return const EditProfileScreen();
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//
//       /// Player Page
//       GoRoute(
//         parentNavigatorKey: _rootNavigatorKey,
//         path: '/player',
//         name: "Player",
//         builder: (context, state) => PlayerView(
//           key: state.pageKey,
//         ),
//       ),
//     ],
//   );
// }
