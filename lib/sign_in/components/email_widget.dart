import 'package:flutter/material.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget({super.key,this.hintText,this.email});
  final String? hintText;
  final TextEditingController? email;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText?? '',
              ),
            ),
          ),
        ),
      );
  }
}