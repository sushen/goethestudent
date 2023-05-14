import 'package:flutter/material.dart';

TextField reusableTextField(String text,IconData icon,bool isPasswordType,TextEditingController controller){
  return TextField(
      controller: controller,
      obscureText: isPasswordType,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white.withOpacity(0.9)),
      decoration: InputDecoration(
          prefixIcon:Icon(
            icon,color: Colors.white70,
          ),
          labelText:text,
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
          filled: true,
          fillColor: Colors.white.withOpacity(0.3),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(width: 0,style: BorderStyle.none)
          )
      ),
      keyboardType: isPasswordType?TextInputType.visiblePassword:TextInputType.emailAddress
  );
}

Container SignInSignUpButton(
    BuildContext context,bool isLogIn,Function onTap){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: (){
        onTap();
      },
      child: Text(
        isLogIn?"LOG IN":"SIGN UP",
        style: const TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 16),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states){
          if(states.contains(MaterialState.pressed)){
            return Colors.black26;
          }
          return Colors.white;
        }),
      ),
    ),
  );
}