import 'dart:convert';
import 'package:west_coupon_code/post_data.dart';

import 'main.dart';
import 'package:flutter/material.dart';
//import 'api_function.dart';
import 'package:http/http.dart' as http;
import 'api_model.dart';

class FinancialServicesPage extends StatelessWidget {
  const FinancialServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: InkWell(
          onTap: () {},
          child: MyStatefulWidget(
              parametersForCoupons: Coupons(
            appBarTitle: 'FinancialServices',
            categoryName: 'Financial Services',
          )),
        ),
      ),
    );
  }
}

class AccessoriesPage extends StatelessWidget {
  const AccessoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(
          parametersForCoupons:
              Coupons(appBarTitle: 'Accessories', categoryName: 'Accessories')),
    );
  }
}

class EntertainmentPage extends StatelessWidget {
  const EntertainmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(
          parametersForCoupons: Coupons(
              appBarTitle: 'Entertainment and Arts',
              categoryName: 'Entertainment and Arts')),
    );
  }
}

class HairAndBeautyPage extends StatelessWidget {
  const HairAndBeautyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(
          parametersForCoupons: Coupons(
              appBarTitle: 'Hair and Beauty', categoryName: 'Hair and Beauty')),
    );
  }
}

class HomeServicesPage extends StatelessWidget {
  const HomeServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: InkWell(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context)=> ElectronicsPostPage(), ));
          },
          child: MyStatefulWidget(
              parametersForCoupons: Coupons(
                  appBarTitle: 'Home Services', categoryName: 'Home Service')),
        ),
      ),
    );
  }
}

class ElectronicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(
          parametersForCoupons:
              Coupons(appBarTitle: 'Electronics', categoryName: 'Electronics')),
    );
  }
}

class AmazonPage extends StatelessWidget {
  const AmazonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(
          parametersForCoupons:
              Coupons(appBarTitle: "Amazon", categoryName: "Amazon")),
    );
  }
}

class HomeAndGardenPage extends StatelessWidget {
  const HomeAndGardenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(
          parametersForCoupons: Coupons(
              appBarTitle: "Home and Garden", categoryName: "Home and Garden")),
    );
  }
}

class MotoringPage extends StatelessWidget {
  const MotoringPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(
          parametersForCoupons:
              Coupons(appBarTitle: "Motoring", categoryName: "Motoring")),
    );
  }
}

class BabyAndTodlerPage extends StatelessWidget {
  const BabyAndTodlerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(
          parametersForCoupons: Coupons(
              appBarTitle: "Baby and Todler",
              categoryName: 'Baby and Toddler')),
    );
  }
}

class FitnessAndHealthPage extends StatelessWidget {
  const FitnessAndHealthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(
          parametersForCoupons: Coupons(
              appBarTitle: "Fitness and Health",
              categoryName: "Fitness and Health")),
    );
  }
}

class Coupons {
  final String appBarTitle;

  final String categoryName;
  Coupons({required this.appBarTitle, required this.categoryName});
}

class MyStatefulWidget extends StatefulWidget {
  final Coupons parametersForCoupons;
  MyStatefulWidget({required this.parametersForCoupons});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<ApiModel> ApiList = [];

  Future<List<ApiModel>> fetchApi() async {
    var url = Uri.parse('https://westcoastcoupons.co.uk/fetch-coupons/');
    var response = await http.get(url);
    var jsonResponse = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in jsonResponse) {
        ApiList.add(ApiModel.fromJson(i));
      }
      return ApiList;
    } else {
      return ApiList;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
    fetchApi();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white24,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WestCoustCoupons()));
                }
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: Text(
            widget.parametersForCoupons.appBarTitle,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          foregroundColor: Colors.white,
        ),
        body: FutureBuilder(
          future: fetchApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                final financialServices = snapshot.data!.where((item) =>
                    item.categoryName ==
                    widget.parametersForCoupons.categoryName);

                return ListView.builder(
                    itemCount: financialServices.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FinancialServicesPostDetails(
                                id: financialServices
                                    .elementAt(index)
                                    .storeImage!
                                    .iD
                                    .toString(),
                                storeName: financialServices
                                    .elementAt(index)
                                    .storeName
                                    .toString(),
                                image: financialServices
                                    .elementAt(index)
                                    .storeImage!
                                    .guid
                                    .toString(),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(30, 8, 30, 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Card(
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    color: Colors.black54,
                                    width: 2,
                                  )),
                                  height: 100,
                                  width: 100,
                                  child: Image(
                                    image: NetworkImage(
                                      financialServices
                                          .elementAt(index)
                                          .storeImage!
                                          .guid
                                          .toString(),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 120,
                                    margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 8, 0, 0),
                                            child: Text(
                                              financialServices
                                                  .elementAt(index)
                                                  .storeName
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            financialServices
                                                .elementAt(index)
                                                .couponDetail
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Text(
                                                financialServices
                                                    .elementAt(index)
                                                    .expiryDate
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black54),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    20, 0, 0, 0),
                                                child: Text(financialServices
                                                    .elementAt(index)
                                                    .couponType
                                                    .toString()),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return Text(
                  'Found 0 Coupons',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                );
              }
            } else {
              return Text('NA',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold));
            }
          },
        ),
      ),
    );
  }
}
