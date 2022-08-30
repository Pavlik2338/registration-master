import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/models/user_model.dart';
import 'package:registration/pages/add_transaction/add_lisiner.dart';
import 'package:registration/resources/constants/colors.dart';
import 'package:registration/widgets/appbar.dart';

import '../resources/constants/path_images.dart';
import '../widgets/navigation_bar/navigation_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool faceId = true;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: purple,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTransactionPage()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: FloatingNavigationBar(
        currentIndex: 0,
      ),
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
                width: 250.w, height: 250.h, child: Image.asset(logo_mobyte)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(thisUser.email!,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
            ),
            Text(thisUser.username!,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 70.h),
              child: Container(
                padding: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 0.1),
                ),
                width: 327.w,
                height: 66.h,
                child: ListTile(
                  leading: Container(
                    width: 36.w,
                    height: 36.h,
                    color: purple,
                    child: const Icon(
                      Icons.sentiment_satisfied_alt,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text(
                    'Face ID',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  trailing: CupertinoSwitch(
                      value: faceId,
                      onChanged: (value) {
                        setState(() {
                          faceId = value;
                        });
                      }),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text("Sign out"),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
