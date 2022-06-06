
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

bool securetext=true;
bool value=false;
bool isSwitched=false;

class Signin extends StatefulWidget {
  const Signin({ Key? key }) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

final emailController=TextEditingController();
final passwordController=TextEditingController();

class _SigninState extends State<Signin> {
    final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user=_googleSignIn.currentUser;
    return Material(
      child: Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.fromLTRB(27, 100, 0, 0),
          child: Text("SIGN IN",
          style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black),
            ),
          ),
            const Padding(padding: EdgeInsets.fromLTRB(27, 10, 0, 0),
            child: Text(
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

            const Padding(
              padding: EdgeInsets.fromLTRB(27, 25, 0, 0),
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

              Padding(padding: const EdgeInsets.fromLTRB(27, 60, 0, 0),
              child: ElevatedButton(
                child: const Text(
                "SIGN IN",
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
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text, 
                    password: passwordController.text
                    );
                    setState(() {
                      Navigator.pushNamed(context, "/home",arguments: { 'x' : 2});
                    });

                },
              ),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(27, 45, 0, 0),
              child: ElevatedButton(
                child: const Text(
                "SIGN IN WITH GOOGLE",
                style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                ),
              ),
                style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                ),  
                fixedSize: const Size(300, 55), primary: Colors.blue[800]),
                onPressed: () async{
                  await _googleSignIn.signIn(
                  );
                  setState(() {
                    if(user!=null)
                    {
                      Navigator.pushNamed(context, "/home",arguments: { 'x' : 3});
                    }
                  });
                },
                ),
              ),
            Padding(padding: const EdgeInsets.fromLTRB(65, 10, 0, 0),
             child: Row(
              children: [
                const Text("I already have an account ?",
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 13.8,
                color: Colors.black),
            ),
            TextButton(
            child: const Text("Sign Up",style: TextStyle(color: Color.fromARGB(255, 233, 103, 3))),
            style: TextButton.styleFrom(fixedSize: const Size.fromHeight(5)),
            onPressed: () {
              Navigator.pushNamed(context, "/signup");
            },
            ),
              ],
            )   ,
            ),
            
          ],

        )
      )
    );
  }
}


