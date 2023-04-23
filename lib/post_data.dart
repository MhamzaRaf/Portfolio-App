import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api_model.dart';
import 'financial_services.dart';

//
// class FinancialServicesPostPage extends StatefulWidget {
//   late var coupenId;
//   FinancialServicesPostPage({required this.coupenId});
//   @override
//   State<FinancialServicesPostPage> createState() => _FinancialServicesPostPageState();
// }
//
// class _FinancialServicesPostPageState extends State<FinancialServicesPostPage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FinancialServicesPostDetails(id: 'coupenId'),
//     );
//   }
// }
// class ElectronicsPostPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FinancialServicesPostDetails(id: '487'),
//     );
//   }
//
//
// }

class FinancialServicesPostDetails extends StatefulWidget {
  final String id;
  final String storeName;
  final String image;
  FinancialServicesPostDetails(
      {required this.id, required this.storeName, required this.image});

  @override
  State<FinancialServicesPostDetails> createState() =>
      _FinancialServicesPostDetailsState();
}

class _FinancialServicesPostDetailsState
    extends State<FinancialServicesPostDetails> {
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
    return MaterialApp(
      home: Material(
        child: FutureBuilder(
          future: fetchApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                final financialServices = snapshot.data!
                    .where((item) => item.storeImage!.iD == widget.id);

                return Scaffold(
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
                                    builder: (context) =>
                                        FinancialServicesPage()));
                          }
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        )),
                    title: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                            width: 50,
                            height: 50,
                            child: Image(image: NetworkImage(widget.image))),
                        Expanded(
                          child: Container(
                            child: Text(
                              widget.storeName,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  body: ListView.builder(
                      itemCount: financialServices.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                financialServices
                                    .elementAt(index)
                                    .couponName
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                financialServices
                                    .elementAt(index)
                                    .couponDetail
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    financialServices
                                        .elementAt(index)
                                        .expiryDate
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    financialServices
                                        .elementAt(index)
                                        .couponType
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 400,
                              height: 350,
                              padding: EdgeInsets.all(15),
                              child: Image(
                                  fit: BoxFit.contain,
                                  image: NetworkImage(financialServices
                                      .elementAt(index)
                                      .storeImage!
                                      .guid
                                      .toString())),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                financialServices
                                    .elementAt(index)
                                    .storeDetail
                                    .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black54),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on_outlined),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      financialServices
                                          .elementAt(index)
                                          .storeAddress
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.phone_android_sharp),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      financialServices
                                          .elementAt(index)
                                          .storePhoneNumber
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.credit_card),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      financialServices
                                          .elementAt(index)
                                          .storeUrl
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(

                                  onPressed: () {},
                                  child: Text(
                                    'More Info',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                );
              } else {
                return Text(
                  'Found 0 Coupons',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                );
              }
            } else {
              return Text('NA', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),);
            }
          },
        ),
      ),
    );
  }
}
