import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
   CustomIconButton({super.key, required this.icon,this.color});

  final IconData icon;
  final Color? color;

  var height=60.0;
  var width=60.0;

   CustomIconButton.large({super.key, required this.icon,this.color,required Size size}){

    height=size.height;
    width=size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width:width,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black26, width: 5),

          color:color?? Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(5, 5),
                blurRadius: 20,
                spreadRadius: 10),
            BoxShadow(
                color: Theme.of(context).colorScheme.background,
                offset: const Offset(-5, -5),
                blurRadius: 15,
                spreadRadius: 5)
          ]),
      child: Icon(icon,color: Theme.of(context).colorScheme.onPrimaryContainer,),
    );
  }
}
