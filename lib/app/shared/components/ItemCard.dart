import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class ItemCard extends StatelessWidget {
  final name, description, stars, forks, url;

  const ItemCard({Key key, this.name, this.description, this.stars, this.forks, this.url})
      : super(key: key);


  Future<void> _launchInBrowser() async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "$name",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 15),
                child: Text("$description",
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, color: Colors.black54)),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("$stars"),
                  SizedBox(
                    width: 20,
                  ),
                  FaIcon(FontAwesomeIcons.codeBranch),
                  SizedBox(
                    width: 5,
                  ),
                  Text("$forks")
                ],
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  print("Clicou");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.sync,
                      color: Color(0xff7159c1),
                    ),
                    Text(
                      "ATUALIZAR",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff7159c1),
                      ),
                    ),
                     Spacer(),
                     InkWell(
                       child: Icon(FontAwesomeIcons.github),
                       onTap: (){
                         _launchInBrowser();
                       },
                     )
                    //IconButton(icon: Icon(FontAwesomeIcons.github), onPressed: (){})
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
