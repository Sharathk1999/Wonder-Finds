/* Contain all the business logic that the app
has that is going to the server.
 */

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wonder_finds/constants/error_handling.dart';
import 'package:wonder_finds/constants/global_variables.dart';
import 'package:wonder_finds/constants/utils.dart';
import 'package:wonder_finds/models/user.dart';

class AuthService {
  //sign up user
  void signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    
  }) async {
    try {
      User user = User(
        id: "",
        name: name,
        email: email,
        password: password,
        address: "",
        type: "",
        token: "",
      );
    http.Response res =await  http.post(
        Uri.parse(
          "$uri/api/signup",
        ),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type' : 'application/json; charset=UTF-8',
        }
      );
      if(context.mounted){
      httpErrorHandle(response: res, context: context, onSuccess: (){
        showSnackBar(context, "Yeah... account created ! Login with same credentials");
      });
      }
      
    } catch (e) {
     if(context.mounted) showSnackBar(context, e.toString());
     log(e.toString());
    }
  }

    void signInUser({
    required BuildContext context,
    required String email,
    required String password,
    
  }) async {
    try {
   
    http.Response res =await  http.post(
        Uri.parse(
          "$uri/api/signin",
        ),
        body: jsonEncode({
          "email" : email,
          "password":password,
        }),
        headers: <String, String>{
          'Content-Type' : 'application/json; charset=UTF-8',
        }
      );
      log(res.body);
      if(context.mounted){
      httpErrorHandle(
        response: res, 
        context: context, 
        onSuccess: (){
        
      });
      }
      
    } catch (e) {
     if(context.mounted) showSnackBar(context, e.toString());
     log(e.toString());
    }
  }
}
