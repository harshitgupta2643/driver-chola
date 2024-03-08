// import 'dart:async';

import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Pages/VerifyBankDetails.dart';
import 'package:chola_driver_flutter/Widgets/Buttonfill.dart';
import 'package:chola_driver_flutter/Widgets/CustomAppbar.dart';
import 'package:chola_driver_flutter/Widgets/Field.dart';
import 'package:flutter/material.dart';

class BankDetails extends StatefulWidget {
  final String bankName;
  final String bankSite;
  const BankDetails({
    super.key,
    required this.bankName,
    required this.bankSite,
  });

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController confirmAccountNumberController =
      TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void initState() {
    print(widget.bankName);
    print(widget.bankSite);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          preferredHeight: size.height * 0.08,
          title: "Bank Details",
        ),
        backgroundColor: Constants.themeColor,
        body: SizedBox(
          height: size.height - statusBarHeight,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.02,
              vertical: size.height * 0.02,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.bankName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: size.shortestSide * 0.06,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.bankSite,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: size.shortestSide * 0.03,
                          color: Color(0xff717171),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: size.width,
                        height: size.height * 0.55,
                        decoration: BoxDecoration(
                          color: Color(0xffD3DBFB),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: _formKey,
                            child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemCount: 6,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      SizedBox(height: size.height * 0.01),
                              itemBuilder: (BuildContext context, int index) {
                                switch (index) {
                                  case 0:
                                    return Align(
                                      alignment: Alignment.centerLeft,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.02,
                                            vertical: size.height * 0.01,
                                          ),
                                          child: Text(
                                            'Enter Account Details',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize:
                                                  size.shortestSide * 0.07,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );

                                  case 1:
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03,
                                      ),
                                      child: Field(
                                        labelText: "Name",
                                        hintText: "Enter Bank Holder Name",
                                        vertical: 0.03,
                                        horizontal: 0.04,
                                        borderColor: BorderSide.none,
                                        snackbarText: '* Required',
                                        fieldController: nameController,
                                      ),
                                    );

                                  case 2:
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03,
                                      ),
                                      child: Field(
                                        labelText: "Account Number",
                                        hintText: "Enter Your Account Number",
                                        vertical: 0.03,
                                        horizontal: 0.03,
                                        borderColor: BorderSide.none,
                                        snackbarText: '* Required',
                                        fieldController:
                                            accountNumberController,
                                      ),
                                    );

                                  case 3:
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03,
                                      ),
                                      child: Field(
                                        labelText: "Confirm Account Number",
                                        hintText: "Enter Your Account Number",
                                        vertical: 0.03,
                                        horizontal: 0.03,
                                        borderColor: BorderSide.none,
                                        snackbarText: '* Required',
                                        fieldController:
                                            confirmAccountNumberController,
                                      ),
                                    );

                                  case 4:
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03,
                                      ),
                                      child: Field(
                                        labelText: "IFSC/Routing Number",
                                        hintText:
                                            "Enter Your IFSC/Routing Number",
                                        vertical: 0.03,
                                        horizontal: 0.03,
                                        borderColor: BorderSide.none,
                                        snackbarText: '* Required',
                                        fieldController: ifscController,
                                      ),
                                    );

                                  case 5:
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03,
                                      ),
                                      child: Field(
                                        labelText: "Branch",
                                        hintText: "Enter Your Branch",
                                        vertical: 0.03,
                                        horizontal: 0.03,
                                        borderColor: BorderSide.none,
                                        snackbarText: '* Required',
                                        fieldController: branchController,
                                      ),
                                    );

                                  default:
                                    return SizedBox();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03,
                        vertical: size.height * 0.02,
                      ),
                      child: AgreeButton(
                        buttonText: "Confirm",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Handle saving the address here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerifyBankDetails(),
                              ),
                            );
                          }
                        },
                        padding: 0.8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
