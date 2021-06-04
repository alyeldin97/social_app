import 'package:flutter/material.dart';
import 'package:new_social_app/layout/layout_screen.dart';

Widget defaultFormField(
    {Function onSubmit,bool isPassword,Function onChanged ,TextEditingController controller, String title, Icon icon,Function validate,TextInputType type,Function onTap,IconButton suffix}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal:15.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffix,
        disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
        labelText: title,
        labelStyle: TextStyle(color: Colors.teal),
        icon: icon,
      ),
      validator: validate,
      keyboardType:type,
      onTap: onTap,
      onChanged: onChanged,
    ),
  );
}

void navigateAndFinish(BuildContext context, Widget screen) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>screen));
}


void navigateTo(BuildContext context,Widget screen){
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>screen));
}