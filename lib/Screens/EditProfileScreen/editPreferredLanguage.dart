import 'package:flutter/material.dart';

import '../../UserModel/userModel.dart';
import '../../Widgets/listOfData.dart';

class UpdateLanguage extends StatefulWidget {
  final Function onLanguageUpdated;

  const UpdateLanguage({super.key, required this.onLanguageUpdated});

  @override
  State<UpdateLanguage> createState() => _UpdateLanguageState();
}

class _UpdateLanguageState extends State<UpdateLanguage> {
  final User user = User.users[0];
  List<String> selectedPreferredLanguages = [];
  int selectedLanguageCount = 0;

  @override
  void initState() {
    selectedPreferredLanguages = user.languages;
    selectedLanguageCount = selectedPreferredLanguages.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 10),
        child: Text(
          "Preferred Language:",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    user.languages.join(", "),
                    style: Theme.of(context).textTheme.headlineSmall,
                    //overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                showLanguages(context);
              },
              icon: const Icon(Icons.edit, color: Colors.grey),
            ),
          ],
        ),
      ),
    ]);
  }

  void showLanguages(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              backgroundColor: Colors.grey[350],
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Languages:",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "You can select up to 5 Languages",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        "$selectedLanguageCount / 5",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ],
              ),
              content: SingleChildScrollView(
                child: Wrap(
                  spacing: 5.0,
                  runSpacing: 5.0,
                  children: List.generate(
                    ListOfData.languages.length,
                    (index) => ChoiceChip(
                      label: Text(ListOfData.languages[index]),
                      selected: selectedPreferredLanguages
                          .contains(ListOfData.languages[index]),
                      onSelected: (selected) {
                        setState(() {
                          if (selected &&
                              selectedPreferredLanguages.length < 5) {
                            selectedPreferredLanguages
                                .add(ListOfData.languages[index]);
                          } else {
                            selectedPreferredLanguages
                                .remove(ListOfData.languages[index]);
                          }
                          selectedLanguageCount =
                              selectedPreferredLanguages.length;
                        });
                      },
                      showCheckmark: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      user.languages = selectedPreferredLanguages;
                    });
                    // Call the callback to trigger UI update in the parent widget
                    widget.onLanguageUpdated();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                ),
              ],
              actionsPadding: const EdgeInsets.all(5),
            );
          },
        );
      },
    );
  }
}

// Container(
// height: calculateHeight(selectedPreferredLanguages.length+2),
// color: Colors.white,
// width: MediaQuery
//     .of(context)
//     .size
//     .width,
// child: GridView.builder(
// gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 3,
// crossAxisSpacing: 5,
// mainAxisSpacing: 5,
// mainAxisExtent: 40,
// ),
// itemBuilder: (context, index) {
// if (index < user.languages.length) {
// return Padding(
// padding: const EdgeInsets.all(5),
// child: Container(
// height: 15,
// width: MediaQuery
//     .of(context)
//     .size
//     .width * 0.25,
// decoration: BoxDecoration(
// border: Border.all(
// color: Colors.black.withOpacity(0.8),
// ),
// borderRadius: BorderRadius.circular(5),
// ),
// child: Center(
// child: Text(
// user.languages[index],
// style: Theme
//     .of(context)
//     .textTheme
//     .headlineSmall,
// ),
// ),
// ),
// );
// } else {
// if(index==5){
// return Padding(
// padding: const EdgeInsets.all(5),
// child: InkWell(
// splashColor: Colors.transparent,
// highlightColor: Colors.transparent,
// onTap: () {
// showList(context);
// },
// child: Container(
// height: 15,
// width: MediaQuery
//     .of(context)
//     .size
//     .width * 0.25,
// decoration: BoxDecoration(
// border: Border.all(
// color: Colors.black.withOpacity(0.5),
// ),
// borderRadius: BorderRadius.circular(5),
// ),
// child: Center(
// child: Icon(
// Icons.remove,
// color: Colors.black.withOpacity(0.5),
// ),
// ),
// ),
// ),
// );
// }
// else{
// return Padding(
// padding: const EdgeInsets.all(5),
// child: InkWell(
// splashColor: Colors.transparent,
// highlightColor: Colors.transparent,
// onTap: () {
// showList(context);
// },
// child: Container(
// height: 15,
// width: MediaQuery
//     .of(context)
//     .size
//     .width * 0.25,
// decoration: BoxDecoration(
// border: Border.all(
// color: Colors.black.withOpacity(0.5),
// ),
// borderRadius: BorderRadius.circular(5),
// ),
// child: Center(
// child: Icon(
// Icons.add,
// color: Colors.black.withOpacity(0.5),
// ),
// ),
// ),
// ),
// );
// }
// }
// },
// itemCount: user.languages.length + 1, // Add 1 for the add icon
// ),
// ),

// void showList(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Column(
//           children: [
//             Text(
//               "Preferred Languages",
//               style: Theme
//                   .of(context)
//                   .textTheme
//                   .headlineMedium,
//             ),
//             Text(
//               "You can select up to 5 languages",
//               style: Theme
//                   .of(context)
//                   .textTheme
//                   .headlineSmall,
//             ),
//           ],
//         ),
//
//         content: StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return Container(
//               height: 300,
//               width: 300,
//               child: GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   crossAxisSpacing: 5,
//                   mainAxisSpacing: 5,
//                   mainAxisExtent: 40,
//                 ),
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(5),
//                     child: InkWell(
//                       splashColor: Colors.transparent,
//                       highlightColor: Colors.transparent,
//                       onTap: () {
//                         setState(() {
//                           if (selectedPreferredLanguages.length == 5 &&
//                               !selectedPreferredLanguages
//                                   .contains(ListOfData.languages[index])) {
//                             return;
//                           }
//                           if (selectedPreferredLanguages.length == 1 &&
//                               selectedPreferredLanguages.contains(ListOfData.languages[index])) {
//                             return;
//                           }
//                           if (selectedPreferredLanguages
//                               .contains(ListOfData.languages[index])) {
//                             selectedPreferredLanguages
//                                 .remove(ListOfData.languages[index]);
//                             return;
//                           }
//                           selectedPreferredLanguages
//                               .add(ListOfData.languages[index]);
//                         });
//                       },
//                       child: Container(
//                         height: 30,
//                         width: MediaQuery
//                             .of(context)
//                             .size
//                             .width * 0.25,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.black.withOpacity(0.5),
//                           ),
//                           color: selectedPreferredLanguages
//                               .contains(ListOfData.languages[index])
//                               ? Colors.deepPurpleAccent.withOpacity(0.4)
//                               : Colors.deepPurpleAccent.withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Center(
//                           child: Text(
//                             ListOfData.languages[index],
//                             style: Theme
//                                 .of(context)
//                                 .textTheme
//                                 .headlineSmall,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 itemCount: ListOfData.languages.length, // Add 1 for the add icon
//               ),
//             );
//           },
//         ),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 user.languages = selectedPreferredLanguages;
//               });
//               Navigator.of(context).pop();
//             },
//             child: const Text('Save'),
//           ),
//         ],
//         actionsPadding: const EdgeInsets.all(5),
//       );
//     },
//   );
// }

// double calculateHeight(int itemCount) {
//   int rowCount = (itemCount / 4).ceil(); // Assuming 4 items per row
//   double height = rowCount *
//       45.0; // 40 (mainAxisExtent) + 5 (mainAxisSpacing)
//   return height;
// }
