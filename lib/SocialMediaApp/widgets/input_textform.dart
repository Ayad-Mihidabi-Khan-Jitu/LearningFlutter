import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class InputTextForm extends StatefulWidget {
  final bool isPwValidator;
  final String textHint;
  final IconData icon;
  final TextEditingController inputFormTextController;
  final bool passwordField;
  final Function? validator;
  final String? errorText;

  InputTextForm({
    this.isPwValidator = false,
    required this.inputFormTextController,
    required this.icon,
    required this.textHint,
    this.validator,
    this.errorText,
    this.passwordField = false,
  });

  @override
  State<InputTextForm> createState() => _InputTextFormState();
}

class _InputTextFormState extends State<InputTextForm> {
  bool success = false;
  bool showpass = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(children: [
        !widget.isPwValidator
            ? TextFormField(
                controller: widget.inputFormTextController,
                validator: (val) {
                  bool isFormCorrect;
                  //login er pass empty check kore
                  if (widget.passwordField)
                    isFormCorrect = !widget.validator!(val!.trim());
                  //obscure false mane eta pass field na tokhon validator ultabe na
                  else
                    isFormCorrect = widget.validator!(val!.trim());
                  if (!isFormCorrect) {
                    return widget.errorText;
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: widget.textHint,
                  prefixIcon: Icon(
                    widget.icon,
                    size: 30,
                  ),
                  suffixIcon: widget.passwordField
                      ? IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            !showpass
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              showpass = !showpass;
                            });
                          },
                        )
                      : null,
                ),
                obscureText: widget.passwordField? !showpass : showpass,
              )
            : TextFormField(
                controller: widget.inputFormTextController,
                validator: (_) {
                  if (success) return null;
                  //return null;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: widget.textHint,
                  prefixIcon: Icon(
                    widget.icon,
                    size: 30,
                  ),
                ),
              ),
        SizedBox(height: 5),
        widget.isPwValidator
            ? FlutterPwValidator(
                controller: widget.inputFormTextController,
                minLength: 8,
                uppercaseCharCount: 1,
                numericCharCount: 1,
                specialCharCount: 1,
                width: 400,
                height: 110,
                onSuccess: () {
                  setState(() {
                    success = true;
                  });
                  //print("MATCHED");
                  //ScaffoldMessenger.of(context).showSnackBar(
                  //const SnackBar(content: Text("Password is matched")));
                },
                onFail: () {
                  setState(() {
                    success = false;
                  });
                  //print("NOT MATCHED");
                },
              )
            : SizedBox.shrink(),
      ]),
    );
  }
}
