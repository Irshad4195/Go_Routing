import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_routing_example/Screens/EditProfileScreen/updateProfileImageView.dart';

import '../../Temp/custom_app_bar.dart';
import '../../UserModel/userModel.dart';
import 'editIntrestForFreeTime.dart';
import 'editLookingFor.dart';
import 'editPageTextField.dart';
import 'editPreferredLanguage.dart';
import 'editYourPrefrence.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final User user = User.users[0];
  String? selectedGender;

  List<File> galleryImages = [];

  File? profileImage;
  List<String> selectedPreferredLanguages = [];
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController universityController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedPreferredLanguages = user.languages;
    selectedGender = user.lookingFor;
    jobTitleController.text = user.jobTitle;
    companyController.text = user.company;
    universityController.text = user.education;
    locationController.text = user.location;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Edit Profile", false),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // editProfileImageView(context),
            const UpdateImageView(),
            const SizedBox(height: 25),
            Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: Row(children: [
                      Text("${user.name.toUpperCase()},",
                          style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(width: 5),
                      Text(user.age.toString(),
                          style: Theme.of(context).textTheme.headlineMedium)
                    ]))),
            editProfilePageHeadingText(context, "About me:"),
            EditPageTextField(
                prefixIconVisible: false,
                isMultiline: true,
                suffixIconVisible: false,
                hintText: user.bio,
                controller: TextEditingController(text: user.bio),
                onChanged: () {
                  user.bio = jobTitleController.text;
                },
                onSubmitted: () {
                  user.bio = jobTitleController.text;
                }),
            editProfilePageHeadingText(context, "Gender:"),
            Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(user.gender,
                        style: Theme.of(context).textTheme.headlineSmall))),
            editProfilePageHeadingText(context, "Looking for:"),
            const EditLookingFor(),
            editProfilePageHeadingText(context, "Your Preference:"),
            EditPreference(onPreferenceEdited: () {
              setState(() {});
            }),
            UpdatePreference(onPreferenceUpdated: () {
              setState(() {});
            }),
            EditInterestedIn(onInterestUpdated: () {
              setState(() {});
            }),
            UpdateLanguage(onLanguageUpdated: () {
              setState(() {});
            }),
            editProfilePageHeadingText(context, "Job Title:"),
            EditPageTextField(
                prefixIconVisible: false,
                isMultiline: false,
                suffixIconVisible: true,
                hintText: user.jobTitle,
                controller: jobTitleController,
                onChanged: () {
                  user.jobTitle = jobTitleController.text;
                },
                onSubmitted: () {
                  user.jobTitle = jobTitleController.text;
                }),
            editProfilePageHeadingText(context, "Company Name:"),
            EditPageTextField(
                prefixIconVisible: false,
                isMultiline: false,
                suffixIconVisible: true,
                hintText: user.company,
                controller: companyController,
                onChanged: () {
                  user.company = companyController.text;
                },
                onSubmitted: () {
                  user.company = companyController.text;
                }),
            editProfilePageHeadingText(context, "Highest Qualification:"),
            EditPageTextField(
                prefixIconVisible: false,
                isMultiline: false,
                suffixIconVisible: true,
                hintText: user.education,
                controller: universityController,
                onChanged: () {
                  user.education = universityController.text;
                },
                onSubmitted: () {
                  user.education = universityController.text;
                }),
            editProfilePageHeadingText(context, "Living in:"),
            EditPageTextField(
                controller: locationController,
                hintText: user.location,
                suffixIconVisible: true,
                isMultiline: false,
                prefixIconVisible: true,
                onChanged: () {
                  user.location = locationController.text;
                },
                onSubmitted: () {
                  user.location = locationController.text;
                }),
          ],
        ),
      ),
    );
  }

  Padding editProfilePageHeadingText(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
