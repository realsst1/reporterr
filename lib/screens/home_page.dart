import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:reporterr/models/news.dart';

import 'news_details.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<News> _getNews() async {
    var url =
        "http://newsapi.org/v2/top-headlines?country=in&apiKey=c6e368818f2148a981690578a37bf679";
    var result = await http.get(url);
    News news;
    //Iterable i=jsonDecode(result.body);
    var res = jsonDecode(result.body);
    news = News.fromJson(res);
    print(news.totalResults);
    if (result.statusCode == 200) {
      return news;
    }
    return news;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Top Headlines",
              style: GoogleFonts.roboto(fontSize: 24.0,fontWeight: FontWeight.bold),
            ),
          ),
          FutureBuilder(
            future: _getNews(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.articles.length,
                  itemBuilder: (context, index) {
                    Articles article = snapshot.data.articles[index];
                    return Card(
                      elevation: 1.0,
                      child: ListTile(
                        leading: article.urlToImage==null?Image.asset('assets/images/news.jpg',fit: BoxFit.cover,width:75.0,height: 70.0,):Image.network(article.urlToImage,
                            fit: BoxFit.cover,
                            width: 75.0,
                            height: 95.0,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(article.title,
                          maxLines: 3,
                            style: GoogleFonts.lato(
                              fontSize: 18.0
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (BuildContext context)=>NewsDetails(article)
                          ));
                        },
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text("gg");
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }
}
