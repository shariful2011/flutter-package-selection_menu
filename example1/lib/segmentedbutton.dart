import 'package:flutter/material.dart';

enum ButtonType {
  btnLeftRadius,
  btnNoRadius,
  btnRightRadius,
}

class SegmentedButton extends StatelessWidget {
  const SegmentedButton({
    Key key,
    this.type,
    this.text,
    this.color,
    this.hoverColor,
    this.onTap,
    this.login = false,
  }) : super(key: key);

  final ButtonType type;
  final String text;
  final Color color;
  final Color hoverColor;
  final Function onTap;
  final bool login;

  BorderRadius get _borderRadius {
    switch (type) {
      case ButtonType.btnLeftRadius:
        return BorderRadius.only(
          bottomLeft: Radius.circular(39),
          topLeft: Radius.circular(39),
        );
        break;

      case ButtonType.btnNoRadius:
        return BorderRadius.only(
          bottomLeft: Radius.zero,
          topLeft: Radius.zero,
          bottomRight: Radius.zero,
          topRight: Radius.zero,
        );
        break;

      case ButtonType.btnRightRadius:
        return BorderRadius.only(
          bottomRight: Radius.circular(39),
          topRight: Radius.circular(39),
        );
        break;

      default:
        return BorderRadius.only(
          bottomLeft: Radius.zero,
          topLeft: Radius.zero,
          bottomRight: Radius.zero,
          topRight: Radius.zero,
        );
        break;
    }
  }

  BorderRadius get _inkBorderRadius {
    switch (type) {
      case ButtonType.btnLeftRadius:
        return BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topLeft: Radius.circular(20),
        );
        break;

      case ButtonType.btnNoRadius:
        return BorderRadius.only(
          bottomLeft: Radius.zero,
          topLeft: Radius.zero,
          bottomRight: Radius.zero,
          topRight: Radius.zero,
        );
        break;

      case ButtonType.btnRightRadius:
        return BorderRadius.only(
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(20),
        );
        break;

      default:
        return BorderRadius.only(
          bottomLeft: Radius.zero,
          topLeft: Radius.zero,
          bottomRight: Radius.zero,
          topRight: Radius.zero,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: !login ? 35 : 30,
          width: !login ? 150 : 70,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: color,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: _inkBorderRadius,
              onTap: onTap,
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: !login ? FontWeight.normal : FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: !login ? 2 : 0,
        ),
      ],
    );
  }
}
