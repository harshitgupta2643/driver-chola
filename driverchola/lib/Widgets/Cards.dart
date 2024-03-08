import 'package:chola_driver_flutter/Pages/AddDocument.dart';
import 'package:chola_driver_flutter/Pages/ComingSoon.dart';
import 'package:flutter/material.dart';

class CardRow1 extends StatelessWidget {
  final List<Color>? colors;

  const CardRow1({Key? key, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String cardText = 'Ride';
    String descriptionText = 'Plan your ride';
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 1.0,
          ),
          itemCount: colors?.length ?? 0,
          itemBuilder: (context, index) {
            if (index == 0) {
              cardText = 'CHOLA Vehicles';
            } else if (index == 1) {
              cardText = 'CHOLA Rentals';
            } else if (index == 2) {
              cardText = 'CHOLA Shift Vehicles';
            } else if (index == 3) {
              cardText = 'OWN Vehicles';
            } else if (index == 4) {
              cardText = 'CONTRACT Vehicles';
            }

            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.02,
                vertical: size.height * 0.02,
              ),
              child: Material(
                color: colors?[index],
                elevation: 8.0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderRadius: BorderRadius.circular(30),
                child: InkWell(
                  splashColor: Colors.black26,
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ComingSoon(),
                        ),
                      );
                    } else if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ComingSoon(),
                        ),
                      );
                    } else if (index == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ComingSoon(),
                        ),
                      );
                    } else if (index == 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddDocument(),
                        ),
                      );
                    } else if (index == 4) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ComingSoon(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ComingSoon(),
                        ),
                      );
                    }
                  },
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: (index != 4)
                                ? EdgeInsets.only(
                                    top: size.height * 0.005,
                                    bottom: size.height * 0.005,
                                    left: size.width * 0.01,
                                    right: size.width * 0.01,
                                  )
                                : EdgeInsets.only(
                                    top: size.height * 0.005,
                                    bottom: size.height * 0.005,
                                  ),
                            child: ClipRRect(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                              ), // Border radius for the image
                              child: Image.asset(
                                'assets/card_i_${index}.png',
                                fit: BoxFit.fitWidth,
                                height: size.height * 0.14,
                                width: size.width,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    cardText,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Colors.white,
                                      // fontSize: size.shortestSide * 0.05,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: CircleAvatar(
                                    radius: size.width * 0.025,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.arrow_forward_sharp,
                                      color: colors?[index],
                                      size: size.height * 0.025,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
