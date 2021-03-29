import 'package:flutter/material.dart';
import 'package:salesappmobile/Util/Util.dart';

class VisitPlanAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: colorRedFigma,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Add Visit Plan",
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 30,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text(
                        dateFormat(),
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: ButtonTheme(
                        height: 10,
                        child: TextButton(
                          child: Text(
                            "Choose Date",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    color: colorRedFigma,
                                    fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 40,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text(
                        timeFormat(),
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: ButtonTheme(
                        height: 10,
                        child: TextButton(
                          child: Text(
                            "Choose Time",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    color: colorRedFigma,
                                    fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 1,
              ),
              Row(
                children: [
                  Container(
                      height: 30,
                      margin: EdgeInsets.only(top: 10),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Prospect: ",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      )),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: ButtonTheme(
                      height: 10,
                      child: TextButton(
                        child: Text(
                          "Choose Prospect",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: colorRedFigma),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Choose Your Prospect",
                        labelStyle: TextStyle(fontSize: 20.0),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                        )),
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ),
              Container(
                  height: 30,
                  margin: EdgeInsets.only(top: 10),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Address: ",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  )),
              Container(
                height: size.height * 0.14,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelStyle: TextStyle(fontSize: 20.0),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                        )),
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ),
              Container(
                  height: 30,
                  margin: EdgeInsets.only(top: 10),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Meeting Point: ",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  )),
              Container(
                height: size.height * 0.14,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelStyle: TextStyle(fontSize: 20.0),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                        )),
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: RaisedButton(
              elevation: 0.0,
              padding: EdgeInsets.all(12.0),
              shape: StadiumBorder(),
              child: Text(
                "Add",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              color: colorRedFigma,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
