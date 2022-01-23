import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

class Homepage extends StatefulWidget {
  //const Homepage({ Key? key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fat To Fit',),backgroundColor: Colors.pink[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder( builder: (context, snapshot) {
              var data = json.decode(snapshot.data.toString()); // [{คอมพิวเตอร์คืออะไร...},{},{},{}]
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                    return 
                     
                        MyBox(data[index]['title'], data[index]['title1'], data[index]['image'],data[index]['detail']);
                        
                     
                },
                itemCount: data.length, );
                

          },
          future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
          

        )
      ),
      
    );
  }
  Widget MyBox(String title,String title1,String image,String detail ){
    var v1,v2,v3,v4;
    v1 = title;
    v2 = title1;
    v3 = image;
    v4 = detail; 
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(30),
      //color: Colors.pink[50],
      height: 167,
      decoration: BoxDecoration(
        //color: Colors.pink[50],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: NetworkImage(image),
        fit : BoxFit.cover,
        colorFilter :ColorFilter.mode(Colors.black.withOpacity(0.40), BlendMode.darken)
         ),
        
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: TextStyle(fontSize: 25,color : Colors.pink[200] ),),
          SizedBox(height: 10,),
          Text(title1,style: TextStyle(fontSize: 15,color : Colors.pink[200],fontWeight: FontWeight.bold),),
          SizedBox(height: 15,),
          TextButton(onPressed:(){
            print('next page');
            Navigator.push(context, MaterialPageRoute(builder: (context)=>detail_page(v1,v2,v3,v4)));
          }, child: Text("ดูเลย",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),))
        ],),
    );
  }
}