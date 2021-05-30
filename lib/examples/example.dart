import 'package:demo/constans.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';

/*
TODO: The following data are using for testing only, so that when you go live
      don't forget to replace the following test credentials with the live
      credentials provided by MyFatoorah Company.
*/

// API Url
final String mAPIUrl = "https://apitest.myfatoorah.com";

// You can get the API Token Key from here:
// https://myfatoorah.readme.io/docs/test-token
final String mAPIKey =
    "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL";

class MyFatora extends StatefulWidget {
  static String id = "MyFatora";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyFatora> {
  String _response = '';
  String _loading = "Loading...";

  List<PaymentMethods> paymentMethods = [];
  List<bool> isSelected = [];
  int selectedPaymentMethodIndex = -1;

  String amount = "0.100";
  String cardNumber = "5453010000095489";
  String expiryMonth = "5";
  String expiryYear = "21";
  String securityCode = "100";
  String cardHolderName = "Mahmoud Ibrahim";
  bool visibilityObs = false;
  @override
  void initState() {
    super.initState();

    if (mAPIKey.isEmpty) {
      setState(() {
        _response =
            "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL";
      });
      return;
    }

    MFSDK.init(mAPIUrl, mAPIKey);

    // (Optional) un comment the following lines if you want to set up properties of AppBar.

//    MFSDK.setUpAppBar(
//      title: "MyFatoorah Payment",
//      titleColor: Colors.white,  // Color(0xFFFFFFFF)
//      backgroundColor: Colors.black, // Color(0xFF000000)
//      isShowAppBar: true); // For Android platform only

    // (Optional) un comment this line, if you want to hide the AppBar.
    // Note, if the platform is iOS, this line will not affected
    initiatePayment();
//    MFSDK.setUpAppBar(isShowAppBar: false);
  }

  /*
    Send Payment
   */
  void sendPayment() {
    var request = MFSendPaymentRequest(
        invoiceValue: double.parse(amount),
        customerName: "Customer name",
        notificationOption: MFNotificationOption.LINK);

    /*var invoiceItem =
        new InvoiceItem(itemName: "item1", quantity: 1, unitPrice: 0.100);
    var listItems = new List<InvoiceItem>();
    listItems.add(invoiceItem);
    request.invoiceItems = listItems;*/

    MFSDK.sendPayment(
        context,
        MFAPILanguage.EN,
        request,
            (MFResult<MFSendPaymentResponse> result) => {
          if (result.isSuccess())
            {
              setState(() {
                print(result.response.toJson());
                _response = result.response.toJson().toString();
              })
            }
          else
            {
              setState(() {
                print(result.error.toJson());
                _response = result.error.message;
              })
            }
        });

    setState(() {
      _response = _loading;
    });
  }

  /*
    Initiate Payment
   */
  void initiatePayment() {
    var request = new MFInitiatePaymentRequest(
        double.parse(amount), MFCurrencyISO.KUWAIT_KWD);

    MFSDK.initiatePayment(
        request,
        MFAPILanguage.EN,
            (MFResult<MFInitiatePaymentResponse> result) => {
          if (result.isSuccess())
            {
              setState(() {
                print(result.response.toJson());
                _response = ""; //result.response.toJson().toString();
                paymentMethods.addAll(result.response.paymentMethods);
                for (int i = 0; i < paymentMethods.length; i++)
                  isSelected.add(false);
              })
            }
          else
            {
              setState(() {
                print(result.error.toJson());
                _response = result.error.message;
              })
            }
        });

    setState(() {
      _response = _loading;
    });
  }

  /*
    Execute Regular Payment
   */
  void executeRegularPayment(int paymentMethodId) {
    var request =
    new MFExecutePaymentRequest(paymentMethodId, double.parse(amount));

    MFSDK.executePayment(
        context,
        request,
        MFAPILanguage.EN,
            (String invoiceId, MFResult<MFPaymentStatusResponse> result) => {
          if (result.isSuccess())
            {
              setState(() {
                print(invoiceId);
                print(result.response.toJson());
                _response = result.response.toJson().toString();
              })
            }
          else
            {
              setState(() {
                print(invoiceId);
                print(result.error.toJson());
                _response = result.error.message;
              })
            }
        });

    setState(() {
      _response = _loading;
    });
  }

  /*
    Execute Direct Payment
   */
  void executeDirectPayment(int paymentMethodId) {
    var request =
    new MFExecutePaymentRequest(paymentMethodId, double.parse(amount));

//    var mfCardInfo = new MFCardInfo(cardToken: "Put your token here");

    var mfCardInfo = new MFCardInfo(
        cardNumber: cardNumber,
        expiryMonth: expiryMonth,
        expiryYear: expiryYear,
        securityCode: securityCode,
        cardHolderName: cardHolderName,
        bypass3DS: true,
        saveToken: false);

    MFSDK.executeDirectPayment(
        context,
        request,
        mfCardInfo,
        MFAPILanguage.EN,
            (String invoiceId, MFResult<MFDirectPaymentResponse> result) => {
          if (result.isSuccess())
            {
              setState(() {
                print(invoiceId);
                print(result.response.toJson());
                _response = result.response.toJson().toString();
              })
            }
          else
            {
              setState(() {
                print(invoiceId);
                print(result.error.toJson());
                _response = result.error.message;
              })
            }
        });

    setState(() {
      _response = _loading;
    });
  }

  /*
    Execute Direct Payment with Recurring
   */
  void executeDirectPaymentWithRecurring() {
    // The value 20 is the paymentMethodId of Visa/Master payment method.
    // You should call the "initiatePayment" API to can get this id and the ids of all other payment methods
    int paymentMethod = 20;

    var request =
    new MFExecutePaymentRequest(paymentMethod, double.parse(amount));

    var mfCardInfo = new MFCardInfo(
        cardNumber: cardNumber,
        expiryMonth: expiryMonth,
        expiryYear: expiryYear,
        securityCode: securityCode,
        bypass3DS: true,
        saveToken: true);

    MFSDK.executeRecurringDirectPayment(
        context,
        request,
        mfCardInfo,
        MFRecurringType.monthly,
        MFAPILanguage.EN,
            (String invoiceId, MFResult<MFDirectPaymentResponse> result) => {
          if (result.isSuccess())
            {
              setState(() {
                print(invoiceId);
                print(result.response.toJson());
                _response = result.response.toJson().toString();
              })
            }
          else
            {
              setState(() {
                print(invoiceId);
                print(result.error.toJson());
                _response = result.error.message;
              })
            }
        });

    setState(() {
      _response = _loading;
    });
  }

  /*
    Payment Enquiry
   */
  void getPaymentStatus() {
    var request = MFPaymentStatusRequest(invoiceId: "12345");

    MFSDK.getPaymentStatus(
        MFAPILanguage.EN,
        request,
            (MFResult<MFPaymentStatusResponse> result) => {
          if (result.isSuccess())
            {
              setState(() {
                print(result.response.toJson());
                _response = result.response.toJson().toString();
              })
            }
          else
            {
              setState(() {
                print(result.error.toJson());
                _response = result.error.message;
              })
            }
        });

    setState(() {
      _response = _loading;
    });
  }

  /*
    Cancel Token
   */
  void cancelToken() {
    MFSDK.cancelToken(
        "Put your token here",
        MFAPILanguage.EN,
            (MFResult<bool> result) => {
          if (result.isSuccess())
            {
              setState(() {
                print(result.response.toString());
                _response = result.response.toString();
              })
            }
          else
            {
              setState(() {
                print(result.error.toJson());
                _response = result.error.message;
              })
            }
        });

    setState(() {
      _response = _loading;
    });
  }

  void cancelRecurringPayment() {
    MFSDK.cancelRecurringPayment(
        "Put RecurringId here",
        MFAPILanguage.EN,
            (MFResult<bool> result) => {
          if (result.isSuccess())
            {
              setState(() {
                print(result.response.toString());
                _response = result.response.toString();
              })
            }
          else
            {
              setState(() {
                print(result.error.toJson());
                _response = result.error.message;
              })
            }
        });

    setState(() {
      _response = _loading;
    });
  }

  void setPaymentMethodSelected(int index, bool value) {
    for (int i = 0; i < isSelected.length; i++) {
      if (i == index) {
        isSelected[i] = value;
        if (value) {
          selectedPaymentMethodIndex = index;
          visibilityObs = paymentMethods[index].isDirectPayment;
        } else {
          selectedPaymentMethodIndex = -1;
          visibilityObs = false;
        }
      } else
        isSelected[i] = false;
    }
  }

  void pay() {
    if (selectedPaymentMethodIndex == -1) {


      showToste("Please select payment method first");

    } else {
      if (amount.isEmpty) {
        showToste("set Amount");


      } else if (paymentMethods[selectedPaymentMethodIndex].isDirectPayment) {
        if (cardNumber.isEmpty ||
            expiryMonth.isEmpty ||
            expiryYear.isEmpty ||
            securityCode.isEmpty)

        showToste("Fill all the card fields");

      else
          executeDirectPayment(
              paymentMethods[selectedPaymentMethodIndex].paymentMethodId);
      } else
        executeRegularPayment(
            paymentMethods[selectedPaymentMethodIndex].paymentMethodId);
    }
  }

  void showToste(String title) {
       Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 15.0);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(children: [
          TextField(
            keyboardType: TextInputType.number,
            controller: TextEditingController(text: amount),
            decoration: InputDecoration(labelText: "Payment Amount"),
            onChanged: (value) {
              amount = value;
            },
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
          ),
          Text("Select payment method"),
          Padding(
            padding: EdgeInsets.all(5.0),
          ),
          Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 0.0),
                  itemCount: paymentMethods.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Column(
                      children: <Widget>[
                        Image.network(paymentMethods[index].imageUrl,
                            width: 40.0, height: 40.0),
                        Checkbox(
                            value: isSelected[index],
                            onChanged: (bool value) {
                              setState(() {
                                setPaymentMethodSelected(index, value);
                              });
                            })
                      ],
                    );
                  })),
          visibilityObs
              ? Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Card Number"),
                    controller: TextEditingController(text: cardNumber),
                    onChanged: (value) {
                      cardNumber = value;
                    },
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Expiry Month"),
                    controller: TextEditingController(text: expiryMonth),
                    onChanged: (value) {
                      expiryMonth = value;
                    },
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Expiry Year"),
                    controller: TextEditingController(text: expiryYear),
                    onChanged: (value) {
                      expiryYear = value;
                    },
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Security Code"),
                    controller: TextEditingController(text: securityCode),
                    onChanged: (value) {
                      securityCode = value;
                    },
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration:
                    InputDecoration(labelText: "Card Holder Name"),
                    controller: TextEditingController(text: cardHolderName),
                    onChanged: (value) {
                      cardHolderName = value;
                    },
                  ),
                ],
              ))
              : Container(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              RaisedButton(
                color: Colors.lightBlue,
                textColor: Colors.white,
                child: Text('Pay'),
                onPressed: pay,
              ),
              RaisedButton(
                color: Colors.lightBlue,
                textColor: Colors.white,
                child: Text('Send Payment'),
                onPressed: sendPayment,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
            ],
          ),
          Container(
            child: Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Text(_response),
              ),
            ),
          ),
        ]),
      ),
    );

  }
}
