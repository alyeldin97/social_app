import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_social_app/layout/layout_screen.dart';
import 'package:new_social_app/shared/styles/icon_broken.dart';

Widget defaultFormField(
    {IconData prefix,Function onSubmit,bool isPassword,Function onChanged ,TextEditingController controller, String title, Icon icon,Function validate,TextInputType type,Function onTap,IconButton suffix}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal:15.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(prefix),
        suffixIcon: suffix,
        disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.brown)),
        labelText: title,
        labelStyle: TextStyle(color: Colors.brown),
        icon: icon,
      ),
      validator: validate,
      keyboardType:type,
      onTap: onTap,
      onChanged: onChanged,
    ),
  );
}

  void navigateAndFinish(
      context,
      widget,
      ) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
            (route) {
          return false;
        },
      );



void navigateTo(BuildContext context,Widget screen){
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>screen));
}

Widget defaultAppBar({context,title,actions}){
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: Text(title,style: TextStyle(color: Colors.brown),),
    actions: actions,
    leading: IconButton(onPressed: (){
      Navigator.pop(context);
  }, icon: Icon(IconBroken.Arrow___Left_2,color: Colors.brown,),
  ),
  );
}

void showToast({
  @required String text,
  @required Color color,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );