
import 'dart:io';
import 'package:demo/api/pdf_api.dart';
import 'package:demo/api/pdf_invoice_api.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/pdfHelper/mobilPdf.dart';
import 'package:demo/pojo/data/rsponse_myOrders.dart';
import 'package:demo/widgit/wedgits.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../constans.dart';

class ReceiptScreen extends StatefulWidget {
  static String id = "ReceiptScreen";
  DataOrder dataOrder;
  ReceiptScreen(this.dataOrder);
  @override
  _ReceiptScreenState createState() => _ReceiptScreenState(this.dataOrder);
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  DataOrder dataOrder;
  var detailsOrder;
  _ReceiptScreenState(this.dataOrder);
  @override
  void initState() {
     detailsOrder = StringBuffer();
    dataOrder.items.forEach((element) {
      detailsOrder.write(
          "\n { name Product : ${element.item.name}  ,\n Descrption Product :  ${element.item.description} , \n  Quntity :${element.qty}, \n  Price ${element.price.price}  ,\n }");
    });

    super.initState();
    print(detailsOrder);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_left_outlined,
            color: KColorecart,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFECECEC),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 4, bottom: 4),
                    child: Center(
                      child: Text(
                        "Print",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () async{

                    
                     final pdfFile = await PdfInvoiceApi.generate(dataOrder);

                    PdfApi.openFile(pdfFile);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFECECEC),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 4, bottom: 4),
                      child: Center(
                        child: Text(
                          "Download",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            //Content================================================================
            Container(
              width: MediaQuery.of(context).size.width,
              decoration:
                  BoxDecoration(border: Border.all(color: Color(0xFF707070))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Invoice No. ${dataOrder.id}",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: KColorecart,
                                fontSize: 13)),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Order Successful",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: KColorecart,
                                fontSize: 13)),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    viewDetailsCheckOut(
                        context, "Order No.", dataOrder.id.toString()),
                    SizedBox(
                      height: 10,
                    ),
                    viewDetailsCheckOut(context, "Address",
                        "${dataOrder.address},${dataOrder.area},${dataOrder.city}"),
                    SizedBox(
                      height: 10,
                    ),
                    viewDetailsCheckOut(context, "Phone", "${dataOrder.phone}"),

                    //address end =========================================================================
                    SizedBox(
                      height: 25,
                    ),
                    Text("Summary order",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: KColorecart,
                            fontSize: 13)),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: WedgiteComponts.containerBorderandunColor,
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: dataOrder.items.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5, left: 5),
                                              child: CachedNetworkImage(
                                                imageUrl: dataOrder
                                                    .items[0].item.name,
                                                placeholder: (context, url) =>
                                                    Icon(
                                                  Icons.photo_sharp,
                                                  color: Colors.black12,
                                                  size: 70,
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(
                                                  Icons.photo_sharp,
                                                  color: Colors.black12,
                                                  size: 70,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Container(
                                              child: Text(
                                                dataOrder
                                                    .items[index].item.name,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13,
                                                    color: KColorecart),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Icon(
                                          Icons.close,
                                          color: KColorecart,
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: KColorecart)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 13,
                                                  right: 13,
                                                  top: 6,
                                                  bottom: 6),
                                              child: Text(
                                                dataOrder.items[index].qty
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                    color: KColorecart),
                                              ),
                                            )),
                                        Text(
                                          dataOrder
                                              .items[index].item.price.formatted
                                              .toString(),
                                          style: TextStyle(
                                              color: KColorecart,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Container(
                                        height: 1.5,
                                        color: KColorecart,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Subtotal: ",
                                      style: TextStyle(
                                          color: KColorecart,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      dataOrder.subTotal.formatted.toString(),
                                      style: TextStyle(
                                          color: KColorecart,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 5, bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Delivery: ",
                                      style: TextStyle(
                                          color: KColorecart,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "5.000 KWD",
                                      style: TextStyle(
                                          color: KColorecart,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 2,
                                      decoration: BoxDecoration(
                                        color: KColorecart,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 5, bottom: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Total: ",
                                        style: TextStyle(
                                            color: KColorecart,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        dataOrder.subTotal.formatted.toString(),
                                        style: TextStyle(
                                            color: KColorecart,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13),
                                      )
                                    ],
                                  ))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column viewDetailsCheckOut(BuildContext context, String title, String desc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                fontWeight: FontWeight.w500, color: KColorecart, fontSize: 13)),
        SizedBox(
          height: 5,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 35,
          decoration: BoxDecoration(border: Border.all(color: KColorecart)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(desc,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: KColorecart,
                      fontSize: 13)),
            ),
          ),
        )
      ],
    );
  }

  Future<PdfFont> getFont(TextStyle style) async {
    //Get the external storage directory
    Directory directory = await getApplicationSupportDirectory();
    //Create an empty file to write the font data
    File file = File('${directory.path}/${style.fontFamily}.ttf');
    List<int>fontBytes;
    //Check if entity with the path exists
    if (file.existsSync()) {
      fontBytes = await file.readAsBytes();
    }
    if (fontBytes != null && fontBytes.isNotEmpty) {
      //Return the google font
      return PdfTrueTypeFont(fontBytes, 12);
    } else {
      //Return the default font
      return PdfStandardFont(PdfFontFamily.helvetica, 12);
    }
  }

  Future<void> _CreatPdf() async {






    PdfDocument document = PdfDocument();
    //Add a page
    PdfPage page = document.pages.add();
    //Set the font
    PdfFont font = await getFont(GoogleFonts.lato());
    //Draw a text
    page.graphics.drawString("Order ID :${dataOrder.id} \n Phone: ${dataOrder.phone}", font,
        brush: PdfBrushes.black, bounds: Rect.fromLTWH(0, 0, 200, 30));
    page.graphics.drawString("Address ${dataOrder.address},${dataOrder.area},${dataOrder.city}", font,
        brush: PdfBrushes.black, bounds: Rect.fromLTWH(0, 60, 200, 30));

    page.graphics.drawString("Details Order : $detailsOrder", font,
        brush: PdfBrushes.black, bounds: Rect.fromLTWH(0,120, 200, 30));


    // pages.graphics.drawString("Details Order \n:${detailsOrder} \n",
    //     PdfStandardFont(PdfFontFamily.symbol, 30));
    //Save the document
    List<int> bytes = document.save();
    //Dispose the document
    document.dispose();
    saveAndLaunchFile(bytes, 'Output.pdf');


    // pages.graphics.drawString(
    //     "Order ID :${dataOrder.id} \n Phone: ${dataOrder.phone} \n ",  PdfTrueTypeFont(  , 12),
    // brush: PdfBrushes.black,
    // bounds: Rect.fromLTWH(0, 0, 100, 50));

    // pages.graphics.drawString(
    //     " Order ID : ${dataOrder.id} \n Phone: ${dataOrder.phone} \n Address : ${dataOrder.address} ${dataOrder.area}${dataOrder.city} ",
    //     PdfStandardFont( PdfFontFamily.symbol , 30 ));

    // pages.graphics.drawString("Phone: ${dataOrder.phone}",
    //     PdfStandardFont(PdfFontFamily.symbol, 30));



    // pages.graphics.drawString("Details Order \n:${dataOrder.total.price} \n",
    //     PdfStandardFont(PdfFontFamily.symbol, 30));

   
    // List<int> byts = decoment.save();
    //   decoment.dispose();
    // saveAndLaunchFile(byts, 'Output.pdf');
  }

  Future<Uint8List> _readImageData(String name) async {
    final data = await rootBundle.load('images/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
}
