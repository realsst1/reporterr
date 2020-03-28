import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reporterr/screens/category_news_screen.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      primary: false,
      padding: EdgeInsets.all(8.0),
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      children: <Widget>[
        InkWell(
          child: Card(
            color: Color.fromRGBO(240, 157, 125,100.0),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/television.png',
                      fit: BoxFit.cover, width: 60.0, height: 60.0),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text("General",style: GoogleFonts.roboto(
                        fontSize: 20.0, fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context)=>CategoryNewsScreen("general")
            ));
          },
        ),
        InkWell(
          child: Card(
            color: Color.fromRGBO(116, 171, 252,100.0),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/growth.png',
                    fit: BoxFit.cover,
                    width: 60.0,
                    height: 60.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      "Business",
                      style: GoogleFonts.roboto(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context)=>CategoryNewsScreen("business")
            ));
          },
        ),
        InkWell(
          child: Card(
            color: Color.fromRGBO(222, 232, 255,100.0),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/sport.png',
                      fit: BoxFit.cover, width: 60.0, height: 60.0),
                  Padding(
                    padding: const EdgeInsets.only(top:16.0),
                    child: Text("Sports",
                      style: GoogleFonts.roboto(
                          fontSize: 20.0, fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context)=>CategoryNewsScreen("sports")
            ));
          },
        ),
        InkWell(
          child: Card(
            color: Color.fromRGBO(255, 222, 222,100.0) ,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/theater.png',
                      fit: BoxFit.cover, width: 60.0, height: 60.0),
                  Padding(
                    padding: const EdgeInsets.only(top:16.0),
                    child: Text("Entertainment",
                      style: GoogleFonts.roboto(
                          fontSize: 20.0, fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context)=>CategoryNewsScreen("entertainment")
            ));
          },
        ),
        InkWell(
          child: Card(
            color: Color.fromRGBO(156, 138, 255,100.0),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/idea.png',
                      fit: BoxFit.cover, width: 60.0, height: 60.0),
                  Padding(
                    padding: const EdgeInsets.only(top:16.0),
                    child: Text("Technology",
                      style: GoogleFonts.roboto(
                          fontSize: 20.0, fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context)=>CategoryNewsScreen("technology")
            ));
          },
        ),
        InkWell(
          child: Card(
            color: Color.fromRGBO(235, 255, 138,100.0),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/health.png',
                      fit: BoxFit.cover, width: 60.0, height: 60.0),
                  Padding(
                    padding: const EdgeInsets.only(top:16.0),
                    child: Text("Healthcare",
                      style: GoogleFonts.roboto(
                          fontSize: 20.0, fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context)=>CategoryNewsScreen("healthcare")
            ));
          },
        ),
        InkWell(
          child: Card(
            color: Color.fromRGBO(138, 255, 181,100.0),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/lab.png',
                      fit: BoxFit.cover, width: 60.0, height: 60.0),
                  Padding(
                    padding: const EdgeInsets.only(top:16.0),
                    child: Text("Science",
                      style: GoogleFonts.roboto(
                          fontSize: 20.0, fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context)=>CategoryNewsScreen("science")
            ));
          },
        )
      ],
    );
  }
}
