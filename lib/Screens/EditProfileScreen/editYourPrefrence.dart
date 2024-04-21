import 'package:flutter/material.dart';

import '../../UserModel/userModel.dart';
import '../../Widgets/listOfData.dart';

class UpdatePreference extends StatefulWidget {
  final Function onPreferenceUpdated;

  const UpdatePreference({super.key, required this.onPreferenceUpdated});

  @override
  State<UpdatePreference> createState() => _UpdatePreferenceState();
}

class _UpdatePreferenceState extends State<UpdatePreference> {
  final User user = User.users[0];
  String selectedPreference = "";

  @override
  void initState() {
    selectedPreference = user.yourPreference;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 10),
        child: Text(
          "Your Preference:",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                user.yourPreference,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            IconButton(
              onPressed: () {
                showPreference(context);
              },
              icon: const Icon(Icons.edit, color: Colors.grey),
            ),
          ],
        ),
      ),
    ]);
  }

  void showPreference(BuildContext context) {
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
                    "Select Your Preference:",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "You can select only one preference",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              content: SingleChildScrollView(
                child: Wrap(
                  spacing: 5.0,
                  runSpacing: 5.0,
                  children: List.generate(
                    ListOfData.yourPreference.length,
                    (index) => ChoiceChip(
                      label: Text(ListOfData.yourPreference[index]),
                      selected: selectedPreference
                          .contains(ListOfData.yourPreference[index]),
                      onSelected: (selected) {
                        setState(() {
                          selectedPreference = ListOfData.yourPreference[index];
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
                      user.yourPreference = selectedPreference;
                    });
                    // Call the callback to trigger UI update in the parent widget
                    widget.onPreferenceUpdated();
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

class EditPreference extends StatefulWidget {
  final Function onPreferenceEdited;
  const EditPreference({super.key, required this.onPreferenceEdited});

  @override
  State<EditPreference> createState() => _EditPreferenceState();
}

class _EditPreferenceState extends State<EditPreference> {
  final User user = User.users[0];

  String? selectedPreference;
  @override
  void initState() {
    selectedPreference = user.yourPreference;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          border: InputBorder.none,
        ),
        value: selectedPreference,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        style: Theme.of(context).textTheme.bodyMedium,
        onChanged: (String? newValue) {
          setState(() {
            selectedPreference = newValue!;
          });
          user.yourPreference = selectedPreference!;
          widget.onPreferenceEdited();
        },
        items: ListOfData.yourPreference
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child:
                Text(value, style: Theme.of(context).textTheme.headlineSmall),
          );
        }).toList(),
      ),
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
