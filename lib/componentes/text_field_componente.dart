import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFieldComponente extends StatefulWidget {
  final String placeholder;
  final String title;
  final bool isPassword;
  final bool autofocus;
  final Stream<String> stream;
  final Function(String) onChanged;
  final TextInputType inputType;
  final String mask;
  final TextCapitalization textCapitalization;
  final TextEditingController controller;
  final int maxLength;

  TextFieldComponente(
      {this.placeholder,
      this.title,
      this.isPassword,
      this.stream,
      this.onChanged,
      this.inputType,
      this.mask,
      this.textCapitalization,
      this.autofocus,
      this.maxLength,
      this.controller});

  @override
  _TextFieldComponenteState createState() => _TextFieldComponenteState();
}

class _TextFieldComponenteState extends State<TextFieldComponente> {
  final _borderStyle = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 0),
      borderRadius: BorderRadius.circular(24));

  // final _borderStyle = OutlineInputBorder(
  //   borderRadius: const BorderRadius.all(
  //     const Radius.circular(24.0),
  //   ),
  // );

  @override
  void initState() {
    super.initState();
    this.showPassword = widget.isPassword;
  }

  bool showPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 16,
            ),
            Text(
              this.widget.title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        Card(
          elevation: 0,
          color: Colors.transparent,
          child: Container(
            height: 40,
            child: StreamBuilder<String>(
              stream: widget.stream,
              initialData: '',
              builder: (context, snapshot) {
                return TextField(
                  scrollPadding: EdgeInsets.all(20),
                  maxLines: 1,
                  maxLengthEnforced: true,
                  controller: this.widget.controller,
                  autofocus: this.widget.autofocus != null
                      ? this.widget.autofocus
                      : false,
                  textCapitalization: widget.textCapitalization != null
                      ? widget.textCapitalization
                      : TextCapitalization.none,
                  keyboardAppearance: Brightness.dark,
                  //inputFormatters: this._getFormatters(),
                  cursorColor: Colors.black,
                  onChanged: widget.onChanged,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: widget.inputType,
                  obscureText: showPassword != null ? showPassword : false,
                  decoration: InputDecoration(
                    // errorText: snapshot.hasError ? snapshot.error : null,
                    hasFloatingPlaceholder: false,
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.3),
                    labelText: widget.placeholder,
                    hintText: widget.placeholder,
                    labelStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.6),
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                    border: _borderStyle,
                    focusedBorder: _borderStyle,
                    enabledBorder: _borderStyle,
                    errorBorder: _borderStyle,
                    suffixIcon:
                        (widget.isPassword != null && widget.isPassword == true)
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    this.showPassword = !this.showPassword;
                                  });
                                },
                                icon: Icon(Icons.remove_red_eye),
                                color: Colors.blueGrey,
                              )
                            : SizedBox.shrink(),
                  ),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 14),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // List<TextInputFormatter> _getFormatters() {
  //   if (this.widget.mask != null) {
  //     var maskFormatter = new MaskTextInputFormatter(mask: this.widget.mask, filter: {"#": RegExp(r'[0-9]')});
  //     return [maskFormatter];
  //   }else if(this.widget.maxLength != null){
  //     var lenghtLimit  = LengthLimitingTextInputFormatter(this.widget.maxLength);
  //     return [lenghtLimit];

  //   }
  //   return [];
  // }
}
