import 'package:flutter/material.dart';

import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Menu/Customer/CustomerForm.dart';
// import 'package:salesappmobile/View/Dashboard/Menu/Customer/CustomerAdd.dart';

class ListCustomer extends StatelessWidget {
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
          "Customer List ",
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
                  return CustomerForm();
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
                          return CustomerForm();
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
                        leading: Container(
                            margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                            child: Icon(
                              Icons.circle,
                              color: colorRedFigma,
                            )),
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
                          Navigator.pop(context);
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
