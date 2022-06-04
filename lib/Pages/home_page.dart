
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final searchController=TextEditingController();

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController=TextEditingController();
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      drawer: const Drawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color:Color.fromARGB(255, 233, 103, 3)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Foodinator",
          style: TextStyle(color: Color.fromARGB(255, 233, 103, 3),
          fontSize: 37),
        ),
        actions: [ 
          Padding(padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: IconButton(
              onPressed: () {}, 
              icon: const Icon(Icons.account_circle,size: 40)
            )
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Text("Welcome Foody!",
            style: TextStyle (
                color: Colors.blue[800],
                fontSize: 28 ,),),
            ),
            SizedBox(
              width: 340,
              child: Padding(padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                child: TextField(
              decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          ),
          hintText: "Find Your Food",
          labelStyle: const TextStyle(
           fontSize: 15 
          ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
         ),
         controller: searchController,
            ),
                ),
            ),
            Expanded(
              child:  StreamBuilder(
                stream: FirebaseFirestore.instance.collection('restaurants').snapshots(), 
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) { 
                return ListView(
                children: snapshot.data!.docs.map((restaurant){
                return  Center(
                  child: ListTile(
                    leading: Padding(padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(248, 248, 248, 255),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(restaurant['r_img'],)
                          )
                        ),
                        height: 70,width: 70,
                      ),
                    ),
                    title: Padding(padding: const EdgeInsets.fromLTRB(5, 2, 22, 2),
                      child: Text(restaurant['r_name']),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 2, 22, 5),
                      child: Text(restaurant['r_desc'],style: const TextStyle(fontSize: 12),),
                    ),
                  ),
                );
              }
            ).toList(),
          );
         }
        )
        )
          ],
        ),
        );
  }
}