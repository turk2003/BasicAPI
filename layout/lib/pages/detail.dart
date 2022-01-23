import 'package:flutter/material.dart';

class detail_page extends StatefulWidget {
  final v1,v2,v3,v4 ;
  detail_page(this.v1,this.v2,this.v3,this.v4);  
  @override
  _detail_pageState createState() => _detail_pageState();
}

class _detail_pageState extends State<detail_page> {
  var _v1,_v2,_v3,_v4;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('เล่นกล้ามเเขน'),),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Text(_v1,style: TextStyle(fontSize: 30),),
            Text(_v2,style: TextStyle(fontSize: 20)),
            Image.network(_v3),
            Text(_v4)
                   ],
        ),
      ),
      
    );
  }
}