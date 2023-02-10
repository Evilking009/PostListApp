// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';
import 'package:companyapi/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class loginPage extends StatefulWidget {

  @override
  State<loginPage> createState() => _loginPageState();

  bool _passwordEye = false;
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {

    TextEditingController _usernameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();


    putData() async{

      String email = _emailController.text;
      String username = _usernameController.text;

      Response rr = await get(Uri.https('jsonplaceholder.typicode.com', '/users'));
      Response rr_posts = await get(Uri.https('jsonplaceholder.typicode.com', '/posts'));

      var data = jsonDecode(rr.body);
      var post_data = jsonDecode(rr_posts.body);

      var users = [];
      userModel userz;

      var posts = [];
      postModel postz;
      
      
      for(var i in data){

        if(i['username'].toString() == username && i['email'].toString() == email){

          userz = userModel(
          name: i['name'], 
          username: i['username'], 
          email: i['email'], 
          address: "${i['address']["street"]}, ${i['address']["suite"]}, ${i['address']["city"]}", 
          zipcode: i['address']['zipcode'],
          userId: i['id'].toString()
          );

          users.add(userz);

          for(var i in post_data){
            postz = postModel(
              title: i['title'],
              description:  i['body'],
              userId:  i['userId'].toString(),
              id: i['id'].toString()
              );

          posts.add(postz);

      }
      final SnackBar ss = SnackBar(content: Text("Login Successfully! "), backgroundColor: Colors.green);
      ScaffoldMessenger.of(context).showSnackBar(ss);

        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> HomePage(data: users, post: posts)));
        break;
        }

      } // End of Users Loop

      if(users.isEmpty){
      final SnackBar ss = SnackBar(content: Text("Invalid or not found user!"), backgroundColor: Colors.red);
      ScaffoldMessenger.of(context).showSnackBar(ss);
      }

 
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/logo.jpeg", width: 100),

                SizedBox(height: 50),

                Container(
                  color: Colors.grey.shade300,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),

                SizedBox(height: 25),

                Container(
                  color: Colors.grey.shade300,
                  child: TextFormField(
                    obscureText: widget._passwordEye,
                    controller: _usernameController,
                    keyboardType: TextInputType.visiblePassword,
                    autofocus: false,
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                      suffixIcon: IconButton(
                        icon: Icon( widget._passwordEye ? Icons.visibility : Icons.visibility_off),
                        color: widget._passwordEye ? Colors.red : Colors.grey,
                        onPressed: (){
                          setState(() => widget._passwordEye = !widget._passwordEye);
                        },),
                    ),
                  ),
                ),

                SizedBox(height: 50),

                MaterialButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 6,
                  minWidth: 350,
                  height: 50,
                  child: Text("LOGIN", style: TextStyle(color: Colors.white, fontSize: 15 ,fontWeight: FontWeight.bold)),
                  onPressed: ()=>putData(),
                  ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}



class userModel {
  String name;
  String username;
  String email;
  String address;
  String zipcode;
  String userId;

  userModel({
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.zipcode,
    required this.userId
  });
}



class postModel {
  String title;
  String description;
  String userId;
  String id;
  
  postModel({
    required this.title,
    required this.description,
    required this.userId,
    required this.id,
  });

  
}

