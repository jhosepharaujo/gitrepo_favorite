import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gitrepo_favorite/app/shared/components/ItemCard.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff7159c1), Color(0xff9B49c1)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text('Repositórios',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold)),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintStyle: TextStyle(fontStyle: FontStyle.italic),
                          border: OutlineInputBorder(),
                          hintText: "Ex: user/repository",
                          filled: true,
                          fillColor: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: ButtonTheme(
                      height: 60,
                      buttonColor: Color(0xff6bd4c1),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    children: <Widget>[
                      ItemCard(name: "flutter", description: "Flutter makes it easy and fast to build beautiful mobile apps. ", stars: "89.3k", forks: "11.9k",),
                      ItemCard(name: "flutter", description: "Flutter makes it easy and fast to build beautiful mobile apps. ", stars: "89.3k", forks: "11.9k",),
                      ItemCard(name: "flutter", description: "Flutter makes it easy and fast to build beautiful mobile apps. ", stars: "89.3k", forks: "11.9k",),
                      ItemCard(name: "flutter", description: "Flutter makes it easy and fast to build beautiful mobile apps. ", stars: "89.3k", forks: "11.9k",),
                      ItemCard(name: "flutter", description: "Flutter makes it easy and fast to build beautiful mobile apps. ", stars: "89.3k", forks: "11.9k",),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
