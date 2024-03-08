import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Pages/ComingSoon.dart';
import 'package:chola_driver_flutter/Widgets/Buttonfill.dart';
import 'package:chola_driver_flutter/Widgets/CustomMenuList.dart';
import 'package:chola_driver_flutter/main.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      child: Drawer(
        elevation: 5,
        child: Container(
          color: Constants.themeColor,
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF4123D2), Color(0xFF2a3372)],
                    ),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double titleFontSize = constraints.maxWidth * 0.15;
                      double subtitleFontSize = constraints.maxWidth * 0.05;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'CHOLA',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: titleFontSize,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w900,
                                      height: 1,
                                      letterSpacing: 5,
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'Chariots',
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: subtitleFontSize,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                      letterSpacing: 3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   width: constraints.maxWidth * 0.2,
                          // ),
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                child: Image.asset('assets/close.png'),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    CustomListTile1(
                      icon: Icons.person_outline_sharp,
                      title: 'Account',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComingSoon()));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => AccountPage()));
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomListTile1(
                      icon: Icons.person,
                      title: 'Profile',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComingSoon()));
                      },
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.02,
                    // ),
                    // CustomListTile1(
                    //   icon: Icons.bookmark_outline,
                    //   title: 'Address',
                    //   onTap: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => ComingSoon()));
                    //   },
                    // ),
                    Divider(
                      color: Colors.black,
                    ),
                    CustomListTile1(
                      icon: Icons.credit_card_outlined,
                      title: 'Payments',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComingSoon()));
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomListTile1(
                      icon: Icons.card_giftcard_sharp,
                      title: 'Refer & Earn',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComingSoon()));
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomListTile1(
                      icon: Icons.add_card_rounded,
                      title: 'Gift Cards',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComingSoon()));
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomListTile1(
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComingSoon()));
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomListTile1(
                      icon: Icons.hourglass_top_outlined,
                      title: 'Venture',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComingSoon()));
                      },
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    CustomListTile1(
                      icon: Icons.description_outlined,
                      title: 'Terms & Privacy Policies',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComingSoon()));
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomListTile1(
                      icon: Icons.headset_mic_outlined,
                      title: 'Support',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComingSoon()));
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomListTile1(
                      icon: Icons.help_outline_outlined,
                      title: 'Help',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComingSoon()));
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomListTile1(
                      icon: Icons.play_circle_outline,
                      title: 'Demo',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComingSoon()));
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.13,
                  right: MediaQuery.of(context).size.width * 0.13,
                  bottom: MediaQuery.of(context).size.width * 0.07,
                ),
                child: AgreeButton(
                  buttonText: "Logout",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text(
                            'Do you really want to Logout?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize:
                                  MediaQuery.of(context).size.shortestSide *
                                      0.05,
                            ),
                          ),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: AgreeButton(
                                    buttonText: "No",
                                    onPressed: () {
                                      Navigator.pop(
                                        context,
                                      );
                                    },
                                    fontSize: MediaQuery.of(context)
                                            .size
                                            .shortestSide *
                                        0.06,
                                    padding: 0.3,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Flexible(
                                  child: AgreeButton(
                                    buttonText: "Yes",
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyHomePage(),
                                        ),
                                      );
                                    },
                                    fillColor: [
                                      Colors.black,
                                      Colors.black,
                                    ],
                                    fontSize: MediaQuery.of(context)
                                            .size
                                            .shortestSide *
                                        0.06,
                                    padding: 0.4,
                                  ),
                                )
                              ],
                            ),
                          ],
                        );
                      },
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MyHomePage()),
                    // );
                  },
                  padding: 0.6,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
