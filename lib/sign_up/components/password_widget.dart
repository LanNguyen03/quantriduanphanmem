import 'package:flutter/material.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget(
      {super.key, this.hintText, this.obscureText = false, this.onTap, this.password});
  final String? hintText;
  final bool? obscureText;
  final Function()? onTap;
  final TextEditingController? password ;

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
          child: TextFormField(
            controller: password,
            obscureText: obscureText ?? false,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText ?? '',
                suffixIcon: GestureDetector(
                  onTap: () => onTap!(),
                  child: Icon(
                      obscureText! ? Icons.visibility : Icons.visibility_off),
                )),
          ),
        ),
      ),
    );
  }
}
