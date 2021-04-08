import 'dart:io';

import 'package:flutter/material.dart';
import 'package:salesappmobile/Util/CameraPageState.dart';

import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Menu/VisitPlan/VisitPlanAdd/VisitPlanAdd.dart';

class VisitPlanMenu extends StatefulWidget {
  @override
  _VisitPlanMenuState createState() => _VisitPlanMenuState();
}

class _VisitPlanMenuState extends State<VisitPlanMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          "Visit Plan",
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.note_add,
                color: colorRedFigma,
                size: 35,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return VisitPlanAdd();
                }));
              })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              height: 30,
              margin: EdgeInsets.only(top: 10),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Search: ",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              )),
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: 40,
                width: size.width * 0.80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "search",
                        labelStyle: TextStyle(fontSize: 15.0),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                        )),
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ),
              Container(
                  child: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: colorRedFigma,
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return VisitPlanAdd();
                        }));
                      }))
            ],
          ),
          Container(
            height: size.height - 210,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, index) {
                return Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  height: 150,
                  width: double.maxFinite,
                  child: Card(
                      elevation: 5,
                      child: ListTile(
                        title: Container(
                          height: 30,
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            "Budi",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: Text(
                          " Jln Soekarno Hatta 999 RT001 RW007 Kec BojongLoa Kaler kelurahan Bojong",
                          maxLines: 3,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: Container(
                          height: 30,
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: colorRedFigma,
                          ),
                        ),
                        onTap: () {
                          // (imageFile!= null)? showDialog(
                          //     context: context,
                          //     builder: (context) => DialogCheckIn()) : SizedBox();
                          showDialog(
                              context: context,
                              builder: (context) => DialogCheckIn());
                        },
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DialogCheckIn extends StatefulWidget {
  @override
  _DialogCheckInState createState() => _DialogCheckInState();
}

class _DialogCheckInState extends State<DialogCheckIn> {
  File imageFile;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 16, left: 16, right: 16),
            margin: EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0))
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Check In",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Text(
                  "Sebelum melakukan Check - In pastikan anda telah bertemu dengan Prospek",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RaisedButton(
                  elevation: 0.0,
                  padding: EdgeInsets.all(12.0),
                  shape: StadiumBorder(),
                  child: Text(
                    "Check In",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  color: colorRedFigma,
                  onPressed: () async {
                    // imageFile = await Navigator.push<File>(context,
                    //     MaterialPageRoute(builder: (_) => CameraPageState()));
                    // setState(() {});
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => CameraPageState()));
                  },
                ),
                TextButton(
                  child: Text(
                    "Cancel",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: colorRedFigma, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
