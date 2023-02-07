import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  VoidCallback action;
  bool isPlay;
  IconData icon;
   CustomButton({required this.action,required this.icon,this.isPlay =false,Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        alignment: Alignment.center,
        height: isPlay?50:32,
        width: isPlay?50:32,
        decoration:  BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          shape: BoxShape.circle
        ),
        child:Icon(
          icon,
          size: isPlay?32:24,
          color: Colors.white,
        )
      ),
    );
  }
}
