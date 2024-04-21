import 'package:flutter/material.dart';

import '../../UserModel/userModel.dart';
import '../../Widgets/listOfData.dart';

class EditInterestedIn extends StatefulWidget {
  final Function onInterestUpdated;

  const EditInterestedIn({super.key, required this.onInterestUpdated});

  @override
  State<EditInterestedIn> createState() => _EditInterestedInState();
}

class _EditInterestedInState extends State<EditInterestedIn> {
  final User user = User.users[0];
  List<String> selectedInterestForFreeTime = [];
  int selectedInterestTextCount = 0;

  @override
  void initState() {
    selectedInterestForFreeTime = user.interestForFreeTime;
    selectedInterestTextCount = selectedInterestForFreeTime.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 10),
          child: Text(
            "Interested in:",
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
                      user.interestForFreeTime.join(", "),
                      style: Theme.of(context).textTheme.headlineSmall,
                      //overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  showInterest(context);
                },
                icon: const Icon(Icons.edit, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void showInterest(BuildContext context) {
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
                    "Select your Interests:",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "You can select up to 5 Interests",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        "$selectedInterestTextCount / 5",
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
                    ListOfData.interestForFreeTime.length,
                    (index) => ChoiceChip(
                      label: Text(ListOfData.interestForFreeTime[index]),
                      selected: selectedInterestForFreeTime
                          .contains(ListOfData.interestForFreeTime[index]),
                      onSelected: (selected) {
                        setState(() {
                          if (selected &&
                              selectedInterestForFreeTime.length < 5) {
                            selectedInterestForFreeTime
                                .add(ListOfData.interestForFreeTime[index]);
                          } else {
                            selectedInterestForFreeTime
                                .remove(ListOfData.interestForFreeTime[index]);
                          }
                          selectedInterestTextCount =
                              selectedInterestForFreeTime.length;
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
                      user.interestForFreeTime =
                          List<String>.from(selectedInterestForFreeTime);
                    });
                    // Call the callback to trigger UI update in the parent widget
                    widget.onInterestUpdated();
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
