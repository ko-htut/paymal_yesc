import 'package:admin/controllers/MenuController.dart';
import 'package:admin/data/myprefs.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: headerColor,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: Icon(Icons.menu,color: Color(0xffe9ecee) ,),
              onPressed: context.read<MenuController>().controlMenu,
            ),
          // if (!Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Text(
                "MOEE Management Portal",
                style: TextStyle(color: Color(0xffe9ecee),fontSize: 26,fontWeight: FontWeight.bold),
              ),
            ),
          if (!Responsive.isMobile(context))
            Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
          Padding(
            padding: const EdgeInsets.only(right: 32),
            child: LogoutField(),
          ),

          // ProfileCard()
        ],
      ),
    );
  }
}


class LogoutField extends StatelessWidget {
  const LogoutField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        MyPrefs.setBool('loggedIn', false).then((value) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/logout.svg',
            color: Color(0xffe9ecee),
            height: 20,
          ),
          SizedBox(height: 4,),
          Text('Logout',style: TextStyle(color: Color(0xffe9ecee),fontSize: 14),)
        ],
      ),
    );
  }
}
