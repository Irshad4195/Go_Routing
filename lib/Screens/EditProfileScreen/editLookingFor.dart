import 'package:flutter/material.dart';

import '../../UserModel/userModel.dart';
import '../../Widgets/listOfData.dart';

class EditLookingFor extends StatefulWidget {
  const EditLookingFor({super.key});

  @override
  State<EditLookingFor> createState() => _EditLookingForState();
}

class _EditLookingForState extends State<EditLookingFor> {
  final User user = User.users[0];

  String? selectedGender;
  @override
  void initState() {
    selectedGender = user.lookingFor;
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
        value: selectedGender,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        style: Theme.of(context).textTheme.bodyMedium,
        onChanged: (String? newValue) {
          setState(() {
            selectedGender = newValue!;
          });
        },
        items: ListOfData.gender.map<DropdownMenuItem<String>>((String value) {
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
