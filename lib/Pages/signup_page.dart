
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

bool securetext=true;
final emailController=TextEditingController();
final passwordController=TextEditingController();
class Signup extends StatefulWidget {
  const Signup({ Key? key }) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.fromLTRB(27, 100, 0, 0),
          child: Text("SIGN UP",
          style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black),
            ),
          ),

            const Padding(padding: EdgeInsets.fromLTRB(27, 12, 0, 0),
            child:
              Text(
              "Complete this step for best adjustment",
              textAlign: TextAlign.center,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 14,
                color: Color.fromARGB(255, 97, 95, 95)),
            ),   
            ),

          const Padding(padding: EdgeInsets.fromLTRB(27, 55, 0, 0),
          child: Text(
              "Your Email",
              textAlign: TextAlign.center,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 15,
                color: Color.fromARGB(255, 97, 95, 95)),
            ),
          ),
              
            Padding(padding: const EdgeInsets.fromLTRB(27, 10, 0, 0),
                          child: SizedBox(
              width: 300,
              child: TextField(
            decoration: InputDecoration(
              
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              ),
              hintText: "Enter Email ID",
              labelStyle: const TextStyle(
               fontSize: 15 
              ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
             ),
             controller: emailController,
            ),
            )
            ),  

            const Padding(padding: EdgeInsets.fromLTRB(27, 25, 0, 0),
            child: Text(
              "Password",
              textAlign: TextAlign.center,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 15,
                color: Color.fromARGB(255, 97, 95, 95)),
            ),
            
            ),

            Padding(padding: const EdgeInsets.fromLTRB(27, 10, 0, 0),
            child: SizedBox(
              width: 300,
              child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              ),
              hintText: "Enter Password",
              labelStyle: const TextStyle(
               fontSize: 15 
              ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
             ),
             controller: passwordController,
             obscureText: true,
            ),
            ),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(27, 25, 0, 0),
            child: Text(
              "Mobile",
              textAlign: TextAlign.center,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 15,
                color: Color.fromARGB(255, 97, 95, 95)),
            ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(27, 10, 0, 0),
            child: SizedBox(
              width: 300,
              child: TextField(
            decoration: InputDecoration(
              
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              ),
              hintText: "Enter Mobile Number",
              labelStyle: const TextStyle(
               fontSize: 15 
              ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
             ),
            ),
            )
            ),
            Padding(padding: const EdgeInsets.fromLTRB(27, 50, 0, 0),
            child: ElevatedButton(
                child: const Text(
                "SIGN UP",
                style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                ),
              ),
                style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                ),  
                fixedSize: const Size(300, 55), primary: const Color.fromARGB(255, 233, 103, 3)),
                onPressed: () async {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text.trim(), 
                    password: passwordController.text.trim(),
                    );
                    setState(() {
                      Navigator.pushNamed(context, "/signin");
                    });
                },
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(65, 25, 0, 0),
            child: Row(
              children: [
                const Center(),
                const Text("I already have an account ?",
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 13.8,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            ),
              TextButton(
                child: const Text("Sign In",style: TextStyle(color: Color.fromARGB(255, 233, 103, 3))),
                  style: TextButton.styleFrom(fixedSize: const Size.fromHeight(5)),
                    onPressed: () {
                      Navigator.pushNamed(context, "/signin");
                    },
                  ),
                ],
              ) ,
            ),
          ],
        )
      )
    );
  }
}