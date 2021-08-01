import 'package:flutter/material.dart';

class NavIcon extends StatelessWidget {
  //this is the color of icon(default color will be white)
  final Color? color;
  //Icon
  final IconData icon;
  //Add on tap function
  final Function()? onTap;
  //Active will add animated color under icon
  final bool? isActive;
  //Active Color
  final Color? activecolor;
  //Animation
  final Curve? curve;

  const NavIcon({
    Key? key,
    this.color = Colors.white,
    required this.icon,
    this.onTap,
    this.isActive = false,
    this.activecolor = Colors.blue,
    this.curve = Curves.bounceIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            this.icon,
            size: this.isActive == true ? 32 : 30,
            color: this.color!.withOpacity(this.isActive == true ? 1 : 0.5),
          ),
          onPressed: this.onTap,
        ),
        AnimatedContainer(
          width: this.isActive == true ? 10.0 : 0.0,
          height: this.isActive == true ? 5.0 : 0.0,
          decoration: BoxDecoration(
            color:
                this.isActive == true ? this.activecolor! : Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
          ),
          duration: const Duration(milliseconds: 500),
          curve: Curves.bounceIn,
        )
      ],
    );
  }
}
