

import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reporterr/models/news.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetails extends StatefulWidget {

  final Articles articles;


  NewsDetails(this.articles);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {

  _launchURL(String url)async{
    var urlToGo=url;
    if(await canLaunch(urlToGo)){
      await launch(urlToGo,forceWebView: true,);
    }
    else{
      throw 'Could not launch $urlToGo';
    }
  }


  @override
  Widget build(BuildContext context) {
    String dateFormate = DateFormat("dd-MM-yyyy").format(DateTime.parse(widget.articles.publishedAt));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.articles.title),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            widget.articles.urlToImage==null?
                Image.asset('assets/images/news.jpg'):
                Image.network(
                  widget.articles.urlToImage,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.articles.author==null?
                          "NA":widget.articles.author,
                      style: TextStyle(
                        fontSize: 16.0
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.articles.publishedAt==null?
                        "":dateFormate,
                    style: TextStyle(
                      fontSize: 16.0
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.articles.description==null?
                    "NA":widget.articles.description,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.articles.content==null?'Content:NA':widget.articles.content,
                maxLines: 60,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20.0
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Text(
                      widget.articles.url==null?"NA":"Click to read the full article",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.blue
                      ),
                    ),
                    onTap: ()=>_launchURL(widget.articles.url)
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  iconSize: 32.0,
                  onPressed: (){
                      Share.share(widget.articles.url);
                  },
                )
              ],
            )
          ],
        ),
      ) ,
    );
  }
}
