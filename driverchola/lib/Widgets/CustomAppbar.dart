// import 'package:chola_driver_flutter/Widgets/BackButton.dart';
// import 'package:flutter/material.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final double preferredHeight;
//   final VoidCallback? onPressed;
//   final String title;

//   const CustomAppBar(
//       {Key? key,
//       required this.preferredHeight,
//       this.onPressed,
//       required this.title})
//       : super(key: key);

//   @override
//   Size get preferredSize => Size.fromHeight(preferredHeight);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.3),
//             spreadRadius: 3,
//             blurRadius: 5,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: AppBar(
//         elevation: 5,
//         title: Text(
//           title,
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: MediaQuery.of(context).size.shortestSide * 0.065,
//             fontFamily: 'Poppins',
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         leading: BackButton1(
//           onPressed: onPressed,
//         ),
//         // leadingWidth: MediaQuery.of(context).size.width * 0.15,
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             color: Color(0xFF839DFE),
//             // color: Colors.transparent,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:chola_driver_flutter/Widgets/BackButton.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onPressed;
  final double preferredHeight;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onPressed,
    required this.preferredHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredHeight,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: AppBar(
          primary: false,
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.shortestSide * 0.065,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: BackButton1(
            onPressed: onPressed,
          ),
          leadingWidth: MediaQuery.of(context).size.width * 0.14,
          centerTitle: true,
          backgroundColor: Color(0xFF839DFE),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
