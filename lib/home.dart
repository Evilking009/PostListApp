// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:companyapi/about.dart';

class HomePage extends StatelessWidget {

  HomePage({this.data, this.post});

  var data;
  var post;

  String header_url = 'https://img.freepik.com/premium-photo/organic-abstract-gradient-wallpaper-background-header-illustration_692702-9502.jpg?w=2000';

  floatingGreetings(BuildContext context){

    final SnackBar ss = SnackBar(content: Text("Greetings ${data[0].name}!"), backgroundColor: Colors.redAccent);
    ScaffoldMessenger.of(context).showSnackBar(ss);

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(

      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.red,//Color(0xFFAF0917),
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: [
          Tab(text: "ALL POSTS",),
          Tab(text: "PROFILE",),
        ]),
        actions: [Icon(Icons.search), SizedBox(width: 20)]
      ),

      body: TabBarView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(color: Colors.grey, height: 20);
            },
            itemCount: post.length,
            itemBuilder: (context, index){
              return ListTile(
                leading: CircleAvatar(child: Text(post[index].id), backgroundColor: const Color(0xFFAF0917)),
                title: Text(post[index].title, style: CustomTextStyled(data[0].userId, post[index].userId)),
                subtitle: Text(post[index].description, style: CustomTextStyledDesc(data[0].userId, post[index].userId),),
              );
            }),
        ),


        Column(
          children: [
            ListTile(
              leading: Text("Name", style: TextStyle(fontWeight: FontWeight.bold),),
              trailing: Text(data[0].name),
            ),
            ListTile(
              leading: Text("Username", style: TextStyle(fontWeight: FontWeight.bold),),
              trailing: Text(data[0].username),
            ),
            ListTile(
              leading: Text("Address", style: TextStyle(fontWeight: FontWeight.bold),),
              trailing: Container(width: 200,child: Text(data[0].address, textDirection: TextDirection.rtl,)),
            ),
            ListTile(
              leading: Text("Zipcode", style: TextStyle(fontWeight: FontWeight.bold),),
              trailing: Text(data[0].zipcode),
            ),
          ],
        )
      ]),

      floatingActionButton: FloatingActionButton(onPressed: ()=>floatingGreetings(context), child: Icon(Icons.add), backgroundColor: Colors.red),

      drawer: Drawer(
        child: Column(
          children: [

            Container(
              width: MediaQuery.of(context).size.width,
              child: DrawerHeader(
                padding: EdgeInsets.all(0.0),
                child: Image.network(header_url, fit: BoxFit.fill)
                ),
            ),


            ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              trailing: Icon(Icons.arrow_right),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen())),
            )




          ],
        ),
      ),
    ));
  }
}


CustomTextStyled(var userID, var postID){
  return TextStyle(
    fontWeight: userID == postID ? FontWeight.bold : FontWeight.normal,
    color: userID == postID ? Color(0xFFE43228) : Colors.black,
  );
}

CustomTextStyledDesc(var userID, var postID){
  return TextStyle(
    color: userID == postID ? Colors.black : Colors.grey[600],
  );
}