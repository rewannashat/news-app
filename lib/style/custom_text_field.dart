import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintTxt;
  final String? label;
  final String? helperText;
  final IconData? suffexIcon;
  final IconData? prefexIcon;
  final Function? onSaved;
  final Function? validator;
  final Function? onChange;
  final Function? onPressedSuffexIcon;
  final Function? onPressedPrefexIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final double? fontSize;
  final double? contentPadding;
  final Color? color;
  final FontWeight? fontWeight;
  final bool? obscureText;
  final int? minLines;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final OutlineInputBorder? out ;



  CustomTextFormField({
    this.hintTxt,
    this.out,
    this.onSaved,
    this.validator,
    this.suffexIcon,
    this.onPressedSuffexIcon,
    this.onPressedPrefexIcon,
    this.keyboardType,
    this.label,
    this.controller,
    this.onChange,
    this.fontSize = 16,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w600,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.helperText = '',
    this.prefexIcon,
    this.contentPadding = 12,
    this.textAlign = TextAlign.right,
    this.textDirection = TextDirection.rtl,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor:Colors.black ,
      onSaved: (val) => onSaved!(val),
      validator: (val) => validator!(val),
      controller: controller,
      onChanged: (val) => onChange!(val),
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintTxt,
        fillColor: const Color(0xFFF0F0F0),
        filled: true,
        labelStyle:
        TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide:  BorderSide(
            color: Colors.grey,
          ),),

        focusedBorder: out,
        errorBorder:  OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
          suffixIcon:IconButton(
            icon: Icon(suffexIcon), onPressed: () => onPressedSuffexIcon!(

          ) , color: Colors.grey,),
        prefixIcon: IconButton(
            icon: Icon(prefexIcon), onPressed: () => onPressedPrefexIcon!() , color: Colors.grey,),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: contentPadding!),

      ),
      keyboardType: keyboardType,
      obscureText: obscureText!,
    );
  }
}
