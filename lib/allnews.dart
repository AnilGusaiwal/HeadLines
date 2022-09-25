import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'newsDetails.dart';
import 'newsModel.dart';
import 'newsProvider.dart';

class AllNews extends StatefulWidget {
  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  late NewsProvider newsProvider;

  Future<NewsModel> fetchNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2022-08-11&sortBy=publishedAt&apiKey=30a9cb04f1ce4bfbbe10d795c25c26e6'));

    if (response.statusCode == 200) {
      Map<String, dynamic>? values = json.decode(response.body);

      NewsModel newsModel = NewsModel.fromJson(values!);
      return newsModel;
    } else {
      throw Exception('API Access Denied use new Api');
    }
  }

  @override
  void initState() {
    NewsProvider newsProvider = Provider.of(context, listen: false);
    newsProvider.fetchCoin();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    newsProvider = Provider.of(context);

    print(newsProvider.fetchCoin());
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            backgroundColor: Colors.black87,
            title: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text('H E A D L I N E S'),
              ],
            ),
            centerTitle: true,
          ),
        ),
        body: FutureBuilder<NewsModel>(
          future: fetchNews(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If we got an error
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error} occurred',
                    style: TextStyle(fontSize: 18),
                  ),
                );

                // if we got our data
              } else if (snapshot.hasData) {
                NewsModel newsModel = snapshot.data!;
                return SafeArea(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 1,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                          Color.fromARGB(255, 72, 69, 69),
                          Color.fromARGB(255, 72, 69, 69),
                        ])),
                    child: ListView.builder(
                      itemCount: newsModel.totalResults,
                      itemBuilder: (BuildContext context, int index) {
                        return SingleNews(
                            url: newsModel.articles![index].urlToImage,
                            date: newsModel.articles![index].publishedAt!
                                .substring(0, 10),
                            title: newsModel.articles![index].title,
                            content: newsModel.articles![index].content,
                            source_Name:
                                newsModel.articles![index].source!.name);
                      },
                    ),
                  ),
                );
              }
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  Widget SingleNews(
      {String? url,
      String? title,
      String? date,
      String? source_Name,
      String? content}) {
    if (url == null) {
      url =
          "https://mms.businesswire.com/media/20220808005327/en/1537396/23/logo.jpg";
    }
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetails(
                    source_Name: source_Name!,
                    content: content!,
                    date: date!,
                    imageUrl: url!,
                    title: title!)));
      },
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Card(
          // ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.23,
            decoration: BoxDecoration(
              image:  DecorationImage(
        image: NetworkImage(url),
          fit: BoxFit.cover),
            ),
            child: 
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
                            Colors.white.withOpacity(0.1),
                            Color.fromARGB(255, 0, 0, 0).withOpacity(1),
                          ])),
                    ),
                  
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                
                      Text(
                        title!,
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 239, 235, 235)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            source_Name!,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 199, 192, 192)),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            date!,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 202, 200, 200)),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
