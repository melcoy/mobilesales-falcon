import 'package:flutter/material.dart';
import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Menu/VisitPlan/VisitPlanCheckIn/SalesInput/VPSalesInput.dart';

class VPListSalesInput extends StatefulWidget {
  @override
  _VisitPlanMenuState createState() => _VisitPlanMenuState();
}

class _VisitPlanMenuState extends State<VPListSalesInput> {
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
          "List of Sales",
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
                  return VPSalesInput();
                }));
              })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: size.height - 100,
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
                            "Izuzu CDD Box",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Car Type: CDD Box",
                              maxLines: 3,
                              softWrap: true,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Qty: 100",
                              maxLines: 3,
                              softWrap: true,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
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
