import 'dart:ui';

import 'package:flutter/material.dart';

class NewsDetails extends StatefulWidget {
  final String source_Name;
  final String content;
  final String date;
  final String imageUrl;
  final String title;
  NewsDetails(
      {required this.source_Name,
      required this.content,
      required this.date,
      required this.imageUrl,
      required this.title});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.imageUrl), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 1,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.white.withOpacity(0),
                        Colors.white.withOpacity(0.1),
                        Color.fromARGB(255, 193, 186, 186).withOpacity(0.1),
                        Color.fromARGB(221, 127, 126, 126),
                        Colors.black87,
                        Colors.black87,
                        Colors.black87,
                      ])),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_back_rounded,size: 40,
                    
                        color: Color.fromARGB(255, 239, 235, 235)),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Expanded(child: Container()),
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Color.fromARGB(255, 239, 235, 235)),
                  ),
                  SizedBox(
                    height: 120,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.source_Name,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 199, 192, 192)),
                      ),
                      Text(
                        widget.date,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 202, 200, 200)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.content,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color.fromARGB(255, 145, 141, 141)),
                  ),
                ],
              ),
            )
          ],
        ), // Foreground widget here
      ),
    );
  }
}
