// ignore: file_names
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pfa_project/modulesusers/payment/payment/components/card_type.dart';
import 'package:pfa_project/modulesusers/payment/payment/components/card_utilis.dart';
import 'package:pfa_project/modulesusers/payment/payment/components/input_formatters.dart';

class FactCard extends StatefulWidget {
  const FactCard({Key? key}) : super(key: key);

  @override
  State<FactCard> createState() => _FactCardState();
}

class _FactCardState extends State<FactCard> {
  final _focusNode = FocusNode();
  TextEditingController cardNumberController = TextEditingController();
  CardType cardType = CardType.Invalid;
  void getCardTypeFrmNum() {
    // with in first 6 digits we can identify the type so
    if (cardNumberController.text.length <= 6) {
      String cardNum = CardUtils.getCleanedNumber(cardNumberController.text);
      CardType type = CardUtils.getCardTypeFrmNumber(cardNum);
      if (type != cardType) {
        setState(() {
          cardType = type;
          print(cardType);
        });
      }
    }
  }

  @override
  void initstate() {
    cardNumberController.addListener(
      () {
        getCardTypeFrmNum();
      },
    );
    _focusNode.requestFocus();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "New card",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 1],
              colors: [
                Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
                Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Form(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.grey[100],
                        child: TextFormField(
                          focusNode: _focusNode,
                          controller: cardNumberController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(19),
                            CardNumberInputFormatter(),
                          ],
                          decoration: InputDecoration(
                            hintText: "Card number",
                            suffixIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: CardUtils.getCardIcon(cardType)),
                            prefixIcon:
                                SvgPicture.asset("assets/icons/card.svg"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          color: Colors.grey[100],
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Full name",
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child:
                                    SvgPicture.asset('assets/icons/user.svg'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            color: Colors.grey[100],
                            child: TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                              ],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "CVV",
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: SvgPicture.asset(
                                        "assets/icons/Cvv.svg"),
                                  )),
                            ),
                          )),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              child: Container(
                            color: Colors.grey[100],
                            child: TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(5),
                                CardMonthInputFormatter(),
                              ],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "MM/YY",
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: SvgPicture.asset(
                                        "assets/icons/calender.svg"),
                                  )),
                            ),
                          )),
                        ],
                      )
                    ],
                  ),
                ),
                Spacer(flex: 2),
                OutlinedButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/icons/scan.svg"),
                    label: Text(
                      "Scan",
                      style: TextStyle(color: Colors.purple),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                    ),
                    child: Text(" Payée"),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();
    for (var i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      int index = i + 1;
      if (index % 4 == 0 && inputData.length != index) {
        buffer.write("  "); // double space
      }
    }
    return TextEditingValue(
        text: buffer.toString(),
        selection: TextSelection.collapsed(offset: buffer.toString().length));
  }
}
