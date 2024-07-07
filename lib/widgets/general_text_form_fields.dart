import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notification/configuration.dart' as config;

class TextFormFieldGeneral extends StatelessWidget {
  final TextEditingController controller;
  final Color? backgroundColor;
  final double? mediaHeight;
  final IconData? icon;
  final double mediaWidth;
  final bool enabled;
  final String? labelText;
  final bool isRequired;
  final Function? validator;
  final Widget? alternativeIcon;
  final TextInputType inputType;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final Function? onChanged;
  final bool isUnderline;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  const TextFormFieldGeneral(
      {super.key,
      required this.mediaWidth,
      required this.controller,
      this.mediaHeight,
      required this.enabled,
      this.icon,
      this.labelText,
      this.validator,
      this.alternativeIcon,
      this.textAlign = TextAlign.start,
      this.inputType = TextInputType.name,
      this.textStyle,
      this.inputFormatters,
      this.onChanged,
      this.backgroundColor,
      this.maxLines = 1,
      this.isUnderline = false,
      this.isRequired = true});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaHeight,
      margin: EdgeInsets.symmetric(horizontal: mediaWidth),
      child: Center(
        child: TextFormField(
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            enabled: enabled,
            textAlign: textAlign,
            validator: validator != null
                ? (value) {
                    return validator!(value);
                  }
                : (value) {
                    if (value!.trim().isEmpty) {
                      if (isRequired) {
                        return 'This field cannot be empty';
                      } else {
                        return null;
                      }
                    } else if (value.trim().length < 3) {
                      return 'You must enter at least 3 characters';
                    }
                    return null;
                  },
            keyboardType: inputType,
            maxLines: maxLines,
            minLines: 1,
            inputFormatters: inputFormatters,
            onChanged: onChanged == null
                ? null
                : (String? value) {
                    onChanged!(value);
                  },
            style: textStyle ??
                const TextStyle(
                    fontSize: 18, color: config.contrastBackgroundColor),
            decoration: config.textFormFieldUnderlineDecoration(
                icon, '', labelText ?? '', enabled,
                alternativeIcon: alternativeIcon)),
      ),
    );
  }
}

class TextFormFieldEmail extends StatelessWidget {
  final TextEditingController controller;
  final double? mediaHeight;
  final double mediaWidth;
  final bool enabled;
  final String labelText;
  final bool isRequired;
  const TextFormFieldEmail(
      {super.key,
      required this.mediaWidth,
      required this.controller,
      this.mediaHeight,
      required this.enabled,
      this.isRequired = true,
      this.labelText = 'EMAIL'});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaHeight,
      margin: EdgeInsets.symmetric(horizontal: mediaWidth),
      child: TextFormField(
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        enabled: enabled,
        validator: (value) {
          if (value!.isEmpty) {
            if (isRequired) {
              return 'This field cannot be empty';
            } else {
              return null;
            }
          } else if (value.length < 5) {
            return 'Invalid email address';
          } else if (!EmailValidator.validate(value.trim())) {
            return 'Invalid email address';
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
            fontSize: 18, color: config.contrastBackgroundColor),
        decoration: config.textFormFieldUnderlineDecoration(
            null, '', labelText, enabled),
      ),
    );
  }
}

class EmailValidator {
  static bool validate(String email) {
    // Expresión regular para validar el formato del correo electrónico
    final RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }
}

class TextFormFieldPassword extends StatefulWidget {
  final TextEditingController controller;
  final double? mediaHeight;
  final double mediaWidth;
  final String labelText;
  final bool enabled;
  final Function validator;
  final bool showRequire;
  const TextFormFieldPassword(
      {super.key,
      required this.mediaWidth,
      required this.controller,
      this.mediaHeight,
      required this.enabled,
      required this.validator,
      this.showRequire = false,
      required this.labelText});

  @override
  State<TextFormFieldPassword> createState() => _TextFormFieldPasswordState();
}

class _TextFormFieldPasswordState extends State<TextFormFieldPassword> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.mediaHeight,
      margin: EdgeInsets.symmetric(horizontal: widget.mediaWidth),
      child: TextFormField(
        controller: widget.controller,
        enabled: widget.enabled,
        validator: (value) {
          return widget.validator(value);
        },
        obscureText: obscureText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: const TextStyle(
            fontSize: 18, color: config.contrastBackgroundColor),
        decoration: config.textFormFieldUnderlineDecoration(
            null,
            '',
            widget.showRequire ? '${widget.labelText}*' : widget.labelText,
            widget.enabled,
            suffixWidget: GestureDetector(
              onTap: () {
                obscureText = !obscureText;
                setState(() {});
              },
              child: Icon(
                obscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: config.contrastBackgroundColor,
              ),
            )),
      ),
    );
  }
}

class TextFormFieldDateOfBirth extends StatelessWidget {
  final TextEditingController controller;
  final double mediaWidth;
  final bool enabled;
  final Function? onSelected;
  const TextFormFieldDateOfBirth(
      {super.key,
      required this.mediaWidth,
      required this.controller,
      required this.enabled,
      this.onSelected});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: mediaWidth),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        enabled: enabled,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Este campo no puede estar vacío';
          }
          return null;
        },
        keyboardType: TextInputType.none,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: const TextStyle(
            fontSize: 18, color: config.contrastBackgroundColor),
        decoration: config.textFormFieldUnderlineDecoration(
            null, '', 'DATE OF BIRTH', enabled),
        onTap: () async {
          if (kIsWeb) {
            DateTime? selectedDateTime = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900, 3, 5),
              lastDate: DateTime.now(),
            );
            controller.text = selectedDateTime.toString().substring(0, 10);
            if (controller.text.isNotEmpty) {
              onSelected!();
            }
          } else {
            controller.text = '${DateTime.now()}'.substring(0, 10);
            await showCupertinoModalPopup(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext dialogContext) {
                  return Container(
                    height: size.height * 0.26,
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    color:
                        CupertinoColors.systemBackground.resolveFrom(context),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    controller.clear();
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.red),
                                  )),
                              Expanded(child: Container()),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    if (onSelected != null) onSelected!();
                                  },
                                  child: const Text(
                                    'Confirm',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.blue),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.125,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              onDateTimeChanged: (dateTime) {
                                controller.text =
                                    dateTime.toString().substring(0, 10);
                              },
                              minimumDate: null,
                              maximumDate: DateTime.now(),
                              initialDateTime: DateTime.now()
                                  .subtract(const Duration(days: 1)),
                              dateOrder: DatePickerDateOrder.dmy,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });

            // DatePicker.showDatePicker(context,
            //     showTitleActions: true,
            //     locale: LocaleType.es,
            //     minTime: DateTime(1900, 3, 5),
            //     maxTime: DateTime.now(), onChanged: (date) {
            //       print('change $date');
            //     }, onConfirm: (date) {
            //       print('confirm $date');
            //       controller.text = date.toString().substring(0, 10);
            //     }, currentTime: DateTime.now());
          }
        },
      ),
    );
  }
}
