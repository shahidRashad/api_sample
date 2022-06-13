import 'package:api_sample/api_request.dart';
import 'package:api_sample/fruit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyHome extends StatefulWidget {
  //const MyHome({Key? key}) : super(key: key);

  //final String? title;
  late Future<List<Fruit>> products;

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.products = fetchProducts();
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF4CAF50),
          title: Text("Sample"),
        ),
        body: Center(
          child: FutureBuilder<List<Fruit>>(
            future: widget.products,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? FruitList(items: snapshot.data!)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}


class FruitList extends StatelessWidget {
final List<Fruit> items;

FruitList({Key? key, required this.items});
@override
Widget build(BuildContext context) {
	return ListView.builder(
	itemCount: items.length,
	itemBuilder: (context, index) {
		return Container(
        padding: EdgeInsets.all(2),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(this.items[index].title, style: TextStyle(fontSize: 13),),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Id: ${this.items[index].id.toString()}"),
                      SizedBox(width: 50,),
                      Text("User Id: ${this.items[index].UserId.toString()}"),
                    ],
                  )
                ]),
          ),
        ));
	},
	);
}
}
