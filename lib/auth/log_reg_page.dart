import 'package:brandstore/auth/login_page.dart';
import 'package:brandstore/auth/registration_page.dart';
import 'package:flutter/material.dart';

class LogRegPage extends StatefulWidget {
  const LogRegPage({super.key});

  @override
  State<LogRegPage> createState() => _LoginpageState();
}

class _LoginpageState extends State<LogRegPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              height: 465,
              width: 375,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: AssetImage('assets/images/logo2.jpg'))
              ),
            ),
            //Image.asset('assets/images/logo2.jpg',height: 465,width: double.infinity,),
            ListTile(
              title: Text("Find The \n Best Collections",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
              subtitle: Text("Get your dream item easily with FashionHub and get other intersting offer"),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(child: Card(child: TextButton(onPressed:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                }, child: Text('LogIn',style: TextStyle(color: Colors.black))))),
                Expanded(child: Card(child: TextButton(onPressed:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage(),));
                },
                    child: Text('Registration',style: TextStyle(color: Colors.white),)),
                  color: Color(0XFFFF7A00),))
              ],
            )

          ],
        ),
      )
    );
  }
}
