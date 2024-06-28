import 'package:demo_app/screens/newsScreen/bloc/NewsScreen_bloc.dart';
import 'package:demo_app/screens/newsScreen/bloc/NewsScreen_event.dart';
import 'package:demo_app/screens/newsScreen/ui/NewsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>
                  BlocProvider(
                create: (context) => NewsscreenBloc()..add(FetchnewsEvent()),
                child: Newsscreen (),
              )));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            minimumSize: Size(150, 50),
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text('Get News'),
        ),
      ),
    );
  }

}