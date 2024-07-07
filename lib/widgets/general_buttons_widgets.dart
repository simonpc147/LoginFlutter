import 'package:flutter/material.dart';
import 'package:notification/configuration.dart' as config;

class CustomButtonGeneral extends StatelessWidget {
  const CustomButtonGeneral({
    super.key,
    required this.mediaWidth,
    this.mediaHeight,
    required this.txtBtn,
    required this.clickBtn,
    required this.buttonColor,
    this.textStyle,
    this.textAlign = TextAlign.center,
    this.radius = 30,
  });

  final double mediaWidth;
  final double? mediaHeight;
  final String txtBtn;
  final Function clickBtn;
  final Color buttonColor;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        clickBtn();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 15, bottom: 15),
        //height: 40,
        height: mediaHeight == null ? 45 : mediaHeight! * 0.08,
        width: mediaWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: buttonColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 4.0,
                spreadRadius: 1.0,
              )
            ]),
        child: Center(
          child: SizedBox(
            width: mediaWidth,
            child: Text(
              txtBtn,
              textAlign: textAlign,
              style: textStyle ??
                  const TextStyle(
                      color: config.buttonTextColor,
                      fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonWithGeneral extends StatelessWidget {
  const CustomButtonWithGeneral({
    super.key,
    required this.mediaWidth,
    this.mediaHeight,
    required this.txtBtn,
    required this.clickBtn,
    required this.buttonColor,
    required this.icon,
    this.textStyle,
    this.textAlign = TextAlign.center,
    this.radius = 30,
  });

  final double mediaWidth;
  final Widget icon;
  final double? mediaHeight;
  final String txtBtn;
  final Function clickBtn;
  final Color buttonColor;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        clickBtn();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 15, bottom: 15),
        //height: 40,
        height: mediaHeight == null ? 45 : mediaHeight! * 0.08,
        width: mediaWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: buttonColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 4.0,
                spreadRadius: 1.0,
              )
            ]),
        child: Center(
          child: SizedBox(
            width: mediaWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 2.5,
                ),
                Text(
                  txtBtn,
                  textAlign: textAlign,
                  style: textStyle ??
                      const TextStyle(
                          color: config.buttonTextColor,
                          fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GoBackButton extends StatelessWidget {
  const GoBackButton({super.key, required this.onTap});

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.keyboard_double_arrow_left_rounded,
            size: 22,
            color: config.secondaryColor.withOpacity(0.5),
          ),
          const SizedBox(
            width: 2.5,
          ),
          Text(
            'GO BACK',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: config.secondaryColor.withOpacity(0.5)),
          )
        ],
      ),
    );
  }
}

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, required this.onTap});

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SKIP',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: config.secondaryColor.withOpacity(0.5)),
          ),
          const SizedBox(
            width: 2.5,
          ),
          Icon(
            Icons.keyboard_double_arrow_right_rounded,
            size: 22,
            color: config.secondaryColor.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}

class CircularCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CircularCheckbox(
      {super.key, required this.value, required this.onChanged});

  @override
  CircularCheckboxState createState() => CircularCheckboxState();
}

class CircularCheckboxState extends State<CircularCheckbox> {
  bool _isChecked = false;

  @override
  void initState() {
    _isChecked = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
          widget.onChanged(_isChecked);
        });
      },
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          color: _isChecked ? config.primaryColor : null,
          shape: BoxShape.circle,
          border: Border.all(
            color: _isChecked ? config.primaryColor : Colors.grey,
            width: 2.0,
          ),
        ),
        child: _isChecked
            ? const Icon(
                Icons.check,
                size: 16.0,
                color: config.primaryContrastColor,
              )
            : null,
      ),
    );
  }
}
