import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../Temp/custom_app_bar.dart';
import '../../UserModel/userModel.dart';

class ProfileCard extends StatelessWidget {
  ProfileCard({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(user.name, false),
      body: SingleChildScrollView(
        child: SizedBox(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                // onVerticalDragEnd: (details) => getUser(),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ImageView(
                  //       imageUrls: user.imageUrls[0],
                  //       name: user.name,
                  //     ),
                  //   ),
                  // );
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(user.imageUrls[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      user.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      user.age.toString(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Theme.of(context).hintColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      user.location,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "About me:",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  user.bio,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Interest:",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      // childAspectRatio: 3 / 1.5,
                      mainAxisExtent: 40,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: 15,
                          width: MediaQuery.of(context).size.width * 0.25,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black.withOpacity(0.5),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              user.interests[index],
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: user.interests.length,
                  )),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Gallery:",
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                // height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                  child: StaggeredGrid.count(
                    crossAxisCount: 6,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    children: [
                      StaggeredGridTile.count(
                          crossAxisCellCount: 3,
                          mainAxisCellCount: 3,
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => ImageView(
                              //       imageUrls: user.imageUrls[1],
                              //       name: user.name,
                              //     ),
                              //   ),
                              // );
                            },
                            child: Image.network(
                              user.imageUrls[1],
                              fit: BoxFit.cover,
                            ),
                          )),
                      StaggeredGridTile.count(
                          crossAxisCellCount: 3,
                          mainAxisCellCount: 3,
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => ImageView(
                              //       imageUrls: user.imageUrls[2],
                              //       name: user.name,
                              //     ),
                              //   ),
                              // );
                            },
                            child: Image.network(
                              user.imageUrls[2],
                              fit: BoxFit.cover,
                            ),
                          )),
                      StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 2,
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => ImageView(
                              //       imageUrls: user.imageUrls[3],
                              //       name: user.name,
                              //     ),
                              //   ),
                              // );
                            },
                            child: Image.network(
                              user.imageUrls[3],
                              fit: BoxFit.cover,
                            ),
                          )),
                      StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 2,
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => ImageView(
                              //       imageUrls: user.imageUrls[4],
                              //       name: user.name,
                              //     ),
                              //   ),
                              // );
                            },
                            child: Image.network(
                              user.imageUrls[4],
                              fit: BoxFit.cover,
                            ),
                          )),
                      StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 2,
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => ImageView(
                              //       imageUrls: user.imageUrls[4],
                              //       name: user.name,
                              //     ),
                              //   ),
                              // );
                            },
                            child: Image.network(
                              user.imageUrls[4],
                              fit: BoxFit.cover,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class SubHomeView extends StatefulWidget {
//   const SubHomeView({super.key});
//
//   @override
//   State<SubHomeView> createState() => _SubHomeViewState();
// }
//
// class _SubHomeViewState extends State<SubHomeView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: const Text("Sub Home View"),
//       ),
//       body: SizedBox(
//         width: double.infinity,
//         height: double.infinity,
//         child: ListView.builder(itemBuilder: (context, index) {
//           return Card(
//             child: ListTile(
//               leading: Text(
//                 index.toString(),
//               ),
//               title: Text("Home Item no. $index"),
//             ),
//           );
//         },
//         itemCount: 20,
//         ),
//       ),
//     );
//   }
// }
