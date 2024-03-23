import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SigninSocial extends StatelessWidget {
  const SigninSocial({super.key, this.image, this.content, this.onTap});
  final String? image;
  final String? content;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: InkWell(
        onTap: () => onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1,
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null) SvgPicture.asset(image!),
              if (image != null) const SizedBox(width: 10),
              Text(
                content ?? '',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
