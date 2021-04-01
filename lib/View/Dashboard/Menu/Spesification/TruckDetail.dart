import 'package:flutter/material.dart';
import 'package:salesappmobile/Util/Util.dart';

class TruckDetail extends StatelessWidget {
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
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (_, index) {
              return Column(
                children: [
                  Container(
                    child: Text(
                      'Izuzu MuX Diesel 2.3',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: size.width,
                    padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                    // color: colorRedFigma,
                    child: Image(
                      image: AssetImage("Images/izuzu.jpg"),
                    ),
                  ),
                  ListTile(
                    title: Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      height: 30,
                      width: size.width,
                      child: Title(
                        color: Colors.black,
                        child: Text(
                          'OTR (Jakarta) : Rp. 498.000.000,-',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      height: 30,
                      width: size.width,
                      child: Title(
                        color: Colors.black,
                        child: Text(
                          'Engine',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    subtitle: Text(
                          "20000CC",
                          maxLines: 3,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
                        ),
                  ),
                  ListTile(
                    title: Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      height: 30,
                      width: size.width,
                      child: Title(
                        color: Colors.black,
                        child: Text(
                          'Transmision',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    subtitle: Text(
                          "Automatic/ Manual",
                          maxLines: 3,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
                        ),
                  ),
                  ListTile(
                    title: Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      height: 30,
                      width: size.width,
                      child: Title(
                        color: Colors.black,
                        child: Text(
                          'Power',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    subtitle: Text(
                          "1000HP",
                          maxLines: 3,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
                        ),
                  ),
                  ListTile(
                    title: Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      height: 30,
                      width: size.width,
                      child: Title(
                        color: Colors.black,
                        child: Text(
                          'Torque',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    subtitle: Text(
                          "400NM",
                          maxLines: 3,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
                        ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
