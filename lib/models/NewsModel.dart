import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Newsmodel extends StatelessWidget{
  final String title;
  final String description;
  final String publishedAt;
  final String imageUrl;

  Newsmodel({
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.imageUrl
});

  @override
  Widget build (BuildContext context ) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height*0.3,
                width: width*0.88,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),),
                child: Row(
                  children: [
                    Container(
                      height: height*0.25,
                      width: width*0.4,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(publishedAt,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: height*0.02,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: height*0.02,
                            ),
                            Text(title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: height*0.025,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: height*0.03,
                            ),
                            Text(description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: height*0.024,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: height*0.25,
                      width: width*0.4,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.cover
                          )
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}