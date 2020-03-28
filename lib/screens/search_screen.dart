import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reporterr/models/news.dart';
import 'package:reporterr/screens/news_details.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  String _query="news";
  TextEditingController _controller=TextEditingController();
  Future _future;

  Future<News> _getSearchResults()async{

    setState(() {
      if(_controller.text.length>0)
        _query=_controller.text;
    });

    var url="https://newsapi.org/v2/everything?q="+_query+"&apiKey=c6e368818f2148a981690578a37bf679";
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
    // TODO: implement initState
    super.initState();
    _query="news";
    _future=_getSearchResults();
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (val){
                setState(() {
                  _query=val;
                  _future=_getSearchResults();
                });
              },
              decoration: InputDecoration.collapsed(
                hintText: "Search...",
              ),
              onChanged: (val){
                setState(() {
                  if(val.length==0){
                    _query="news";
                  }
                  else{
                    _query=val;
                    _future=_getSearchResults();
                  }
                });
              },
              controller: _controller,
              onEditingComplete: _getSearchResults,
            ),
          ),
          FutureBuilder(
            future: _future,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.data==null ){
                print("I am here");
                return Center(
                  child: Text("No results found"),
                );
              }
              if (snapshot.hasData) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.articles.length==null?0:snapshot.data.articles.length,
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
                print(snapshot.error.toString()+"ssns");
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
