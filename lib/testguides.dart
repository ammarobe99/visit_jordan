import 'package:flutter/material.dart';
import 'package:visit_jordan/homepage.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
        
      }, icon: Icon(Icons.exit_to_app))]),
      body: ListView (
        children:[ Container(
         
          margin: EdgeInsets.only(top: 100,left: 10,right: 10),
          child: ListTile(
                  leading:  CircleAvatar(
                    // radius: 40,
                    foregroundImage: NetworkImage(
                        "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745"),
                  ),
                  
                  title: Text("mahmoud taani"),
                  subtitle: Text("aqaba,petra \n for contact: 07XXXXXXXX",style: TextStyle(color: Colors.white),),
                  trailing: 
                    Icon(Icons.call),
                     
                  ),
        ),
        Container(
       
        margin: EdgeInsets.only(top: 30,left: 10,right: 10),
        child: ListTile(
                leading:  CircleAvatar(
                  // radius: 40,
                  foregroundImage: NetworkImage(
                      "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745"),
                ),
                
                title: Text("obadah alkhateeb"),
                subtitle: Text("karak,amman \n for contact: 07XXXXXXXX",style: TextStyle(color: Colors.white),),
                trailing: 
                  Icon(Icons.call),
                   
                ),
      ),Container(
       
        margin: EdgeInsets.only(top: 30,left: 10,right: 10),
        child: ListTile(
                leading:  CircleAvatar(
                  // radius: 40,
                  foregroundImage: NetworkImage(
                      "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745"),
                ),
                
                title: Text("suhaib alquraan"),
                subtitle: Text("um qais ,ajloun ,jerash \n for contact: 07XXXXXXXX",style: TextStyle(color: Colors.white),),
                trailing: 
                Column(children: [
                  Icon(Icons.call),
                 
                ],)
                  
                   
                ),
      ),
        ]
      ),
            
    );
  }
}