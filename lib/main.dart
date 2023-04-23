import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'financial_services.dart';
import 'splash_screen.dart';
void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "practice-app",
      home: SplashScreen(),
    );
  }
}

class WestCoustCoupons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      // body of whole page
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.ltr,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Explore",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              Text(
                "latest deals and discounts",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              // scrolling images
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      height: 250,
                      width: 370,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/mcdonaldsmenu.webp",
                            fit: BoxFit.cover,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      height: 250,
                      width: 370,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/mcdonalds.png",
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: Text(
                    "Categories",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // feilds with their icons
              Container(
                height: 400,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AccessoriesPage(),),);
                        },
                          child: Categories(text: "Accessories", next: CommunityMaterialIcons.white_balance_sunny)),
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => EntertainmentPage(),),);
                          },
                          child: Categories(text: "Entertainment and Arts", next: CommunityMaterialIcons.headphones)),
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FinancialServicesPage(),),);
                          },
                          child: Categories(text: "Finance and Services", next: CommunityMaterialIcons.currency_usd)),
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HairAndBeautyPage(),),);
                          },
                          child: Categories(text: "Hair and Beauty", next: CommunityMaterialIcons.scissors_cutting)),
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ElectronicsPage(),),);
                          },
                          child: Categories(text: "Electronics", next: CommunityMaterialIcons.youtube_tv)),
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeServicesPage(),),);
                          },
                          child: Categories(text: "Home Services", next: CommunityMaterialIcons.home_analytics)),
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AmazonPage(),),);
                          },
                          child: Categories(text: "Amazon", next: CommunityMaterialIcons.cart)),
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeAndGardenPage(),),);
                          },
                          child: Categories(text: "Home and Garden", next: CommunityMaterialIcons.tree)),
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MotoringPage(),),);
                          },
                          child: Categories(text: "Motoring  ", next: CommunityMaterialIcons.car)),
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => BabyAndTodlerPage(),),);
                          },
                          child: Categories(text: "Baby and Todler  ", next: CommunityMaterialIcons.flower)),
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FitnessAndHealthPage(),),);
                          },
                          child: Categories(text: "Fitness and Health  ", next: CommunityMaterialIcons.human_handsup)),
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

// class for feilds and icons
class Categories extends StatelessWidget {
  late String text;
  late IconData next;
  Categories({required this.text, required this.next}){}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(next),
            ),
            Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
