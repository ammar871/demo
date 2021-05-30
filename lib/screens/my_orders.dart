import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/cemmon/helper.dart';
import 'package:demo/providers/my_orderProviders.dart';
import 'package:demo/screens/recipet_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../constans.dart';
import 'login_screen.dart';

class MyOrdersScreen extends StatefulWidget {
  static String id = "MyOrdersScreen";

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  MyOrdersProviders dataprovider;
  @override
  void initState() {
    print("ok");
    super.initState();
  }

  initData() async {
    if (dataprovider == null) {
      dataprovider = Provider.of(context);
      dataprovider.loading = true;
      dataprovider.getDataMyOrders();
    }
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
        body: Helper.IS_LOGIN != null
            ? _biludWedget()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: double.infinity,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Please login to continue",
                          style: TextStyle(fontSize: 18, color: KColorecart),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, LoginScreen.id);
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: KColoreblue),
                              borderRadius: BorderRadius.circular(4.0),
                              color: KColorecart,
                            ),
                            child: Center(
                                child: Text("Go To Login",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: Colors.white,
                                    ))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }

  // Padding itemListOrder(String status) {
  //   return  }

  Widget _biludWedget() {
    return dataprovider.loading
        ? Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
              child: SpinKitRing(
                color: KColorecart,
                size: 30,
                duration: Duration(milliseconds: 700),
                lineWidth: 5,
              ),
            ),
          )
        : ListView(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: dataprovider.listAll.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Order No. ${dataprovider.listAll[index].id}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: KColorecart),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 2, left: 5),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 5, left: 5),
                                    child: Container(
                                      width: 80,
                                      height: 70,
                                      child: dataprovider
                                                  .listAll[index]
                                                  .items[0]
                                                  .item
                                                  .images[0]
                                                  .url ==
                                              null
                                          ? Container()
                                          : CachedNetworkImage(
                                              imageUrl: dataprovider
                                                  .listAll[index]
                                                  .items[0]
                                                  .item
                                                  .images[0]
                                                  .url,
                                              placeholder: (context, url) =>
                                                  Icon(
                                                Icons.photo_sharp,
                                                color: Colors.black12,
                                                size: 70,
                                              ),
                                              errorWidget:
                                                  (context, url, error) => Icon(
                                                Icons.photo_sharp,
                                                color: Colors.black12,
                                                size: 70,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Name",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                  color: KColorecart),
                                            ),
                                            SizedBox(height: 20),
                                            Container(
                                              width: 120,
                                              child: Text(
                                                dataprovider.listAll[index]
                                                    .items[0].item.name,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13,
                                                    color: KColorecart),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 35),
                                          child: Icon(
                                            Icons.close,
                                            color: KColorecart,
                                            size: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "Qty",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                  color: KColorecart),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                                decoration: BoxDecoration(
                                                  color: KColorecart,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          top: 5,
                                                          bottom: 5),
                                                  child: Text(
                                                    dataprovider.listAll[index]
                                                        .total.price
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12,
                                                        color: Colors.white),
                                                  ),
                                                )),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 32),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Price",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                    color: KColorecart),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                dataprovider.listAll[index]
                                                    .items[0].total.price
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                    color: KColorecart),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(context, new MaterialPageRoute(builder:
                                  (context) => new ReceiptScreen( dataprovider.listAll[index])));

                                      },
                                      child: Text(
                                        "view details",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: KColoredetails),
                                      ),
                                    ),
                                    Text(
                                      dataprovider.listAll[index].items[0].item
                                          .description
                                          .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: KColoreText),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 8),
                              child: Container(
                                height: 1.5,
                                color: KColorecart,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 23,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: KColoreblue),
                                    borderRadius: BorderRadius.circular(4.0),
                                    color: KColorecart,
                                  ),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 2, right: 2, top: 2, bottom: 2),
                                    child: Text("status",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12)),
                                  )),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          );
  }
}

// class _loadDataOrders extends StatelessWidget {
//   const _loadDataOrders({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView(
//           children: [
//             Container(
//               decoration: WedgiteComponts.containerBorderandunColor,
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: 2,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemBuilder: (BuildContext context, int index) {
//                   return InkWell(
//                       onTap: () {
//                         Navigator.pushNamed(context, ReceiptScreen.id);
//                       },
//                       child: itemListOrder("Status"));
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Text(
//               "Previous Orders",
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15,
//                   color: KColorecart),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               decoration: WedgiteComponts.containerBorderandunColor,
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: 2,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemBuilder: (BuildContext context, int index) {
//                   return itemListOrder("Order Again");
//                 },
//               ),
//             )
//           ],
//         ),
//       );
//   }
// }
