import 'package:flutter/material.dart';

class UiHelper1 {
  static customText(String text,
      {FontWeight fontWeight = FontWeight.normal,
      Color color = Colors.black,
      double fontSize = 14}) {
    return Text(
      text,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }

  static customContainer(
    double height,
    double width,
    Color color,
    double radius,
    Widget child,
  ) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }

  static Widget customImageContainer(
      void Function() onPressed, String imageUrl) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  static submitButton(
    Function onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed as void Function()?,
      style: ButtonStyle(
        minimumSize:
            MaterialStateProperty.all(const Size(double.maxFinite, 50)),
        elevation: MaterialStateProperty.all(5),
        backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
      ),
      child: const Text(
        "Submit",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  static customSnackbar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red,
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        // bottom: MediaQuery.of(context).size.height -
        //     MediaQuery.of(context).size.height * 0.15,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
    ));
  }

  static customTextButton(
      {required String text,
      void Function()? onPressed,
      Color color = Colors.deepPurple,
      double fontSize = 16}) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize, color: color),
        ));
  }
}
