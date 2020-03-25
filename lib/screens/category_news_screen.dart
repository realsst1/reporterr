import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reporterr/models/news.dart';
import 'package:http/http.dart' as http;

import 'news_details.dart';

class CategoryNewsScreen extends StatefulWidget {

  final String category;

  CategoryNewsScreen(this.category);

  @override
  _CategoryNewsScreenState createState() => _CategoryNewsScreenState();
}

class _CategoryNewsScreenState extends State<CategoryNewsScreen> {

  Future<News> _getNews() async {
    var url =
       "http://newsapi.org/v2/top-headlines?country=in&category="+widget.category+"&apiKey=c6e368818f2148a981690578a37bf679";
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
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    print(widget.category);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.substring(0,1).toUpperCase()+widget.category.substring(1)),
      ),
      body: FutureBuilder(
        future: _getNews(),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            if(snapshot.data.totalResults==0){
              return Center(
                child: Container(
                  width: 400.0,
                  height: 300.0,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                          Icons.error,
                          size: 60.0,
                          color: Colors.red,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:16.0),
                        child: Text(
                          "No current news about "+widget.category+" found",
                          style: TextStyle(
                            fontSize: 18.0
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.articles.length,
              itemBuilder: (context,index){
                Articles article = snapshot.data.articles[index];
                return Card(
                  elevation: 1.0,
                  child: ListTile(
                    leading: article.urlToImage==null?Image.asset('images/news.jpg',fit: BoxFit.cover,width:75.0,height: 60.0,):Image.network(article.urlToImage,
                      fit: BoxFit.cover,
                      width: 75.0,
                      height: 60.0,
                    ),
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(article.title,
                        maxLines: 3,
                        style: GoogleFonts.lato(),
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
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
