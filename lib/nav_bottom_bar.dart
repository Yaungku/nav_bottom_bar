import 'package:flutter/material.dart';
import 'package:nav_bottom_bar/nav_icon.dart';
export 'package:nav_bottom_bar/nav_icon.dart';

//Big Button Position
enum ButtonPosition { start, center, end }

class NavBottomBar extends StatefulWidget {
  //Children class to classify widgets
  final List<NavIcon> children;
  //init index(required)
  final int currentIndex;
  //Big Button Position
  final ButtonPosition? buttonPosition;
  //Background color of Big Container
  final Color? backgroundColor;
  //To Show Big Button(Default true)
  final bool showBigButton;
  //Big Button Ontap
  final Function()? btnOntap;
  //Big Button Icon Color
  final Color? bigIconColor;
  //Big Icon
  final IconData? bigIcon;
  //height of big container(default 80)
  final double? bottomBarHeight;
  //width of big container(default size.width * 0.9)
  final double? bottomBarWidth;
  //Radius of Radius
  final double? bottomRadius;

  NavBottomBar({
    Key? key,
    required this.children,
    required this.currentIndex,
    this.bigIcon,
    this.buttonPosition = ButtonPosition.center,
    this.backgroundColor,
    this.bottomBarHeight = 80,
    this.bottomBarWidth,
    this.bottomRadius = 35,
    this.showBigButton = true,
    this.btnOntap,
    this.bigIconColor,
  }) : super(key: key);

  @override
  _NavBottomBarState createState() => _NavBottomBarState();
}

class _NavBottomBarState extends State<NavBottomBar> {
  //to Arrage Space for Big Icon
  List<Widget> _getChildren() {
    List<Widget> _children = [];
    int middle = (widget.children.length / 2).ceil();
    int _index = 0;
    for (NavIcon el in widget.children) {
      int i = widget.children.indexOf(el);
      NavIcon _icon = NavIcon(
          icon: el.icon,
          onTap: () {
            el.onTap!();
          },
          isActive: widget.currentIndex == i,
          color: el.color);
      _children.add(_icon);
      _index++;
      if (_index == middle &&
          widget.buttonPosition == ButtonPosition.center &&
          widget.showBigButton) {
        _children.add(_getShowButton());
      }
    }
    if (widget.buttonPosition == ButtonPosition.end && widget.showBigButton) {
      _children.add(_getShowButton());
    }
    if (widget.buttonPosition == ButtonPosition.start && widget.showBigButton) {
      _children.insert(0, _getShowButton());
    }
    return _children;
  }

  //Big Button
  Widget _getShowButton() {
    return FloatingActionButton(
      heroTag: null,
      child: Icon(
        widget.bigIcon,
        size: 32,
      ),
      elevation: 0.0,
      backgroundColor: widget.bigIconColor ?? Colors.blue,
      onPressed: widget.btnOntap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: widget.bottomBarHeight,
          width: widget.bottomBarWidth ?? (_size.width * 0.9),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(widget.bottomRadius!)),
            color: widget.backgroundColor ?? Colors.black54,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(4, 4),
                  blurRadius: 10.0),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _getChildren(),
          ),
        ),
      ),
    );
  }
}
