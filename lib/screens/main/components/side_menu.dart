import 'package:admin/controllers/drawer_index_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indexProvider=context.watch<DrawerIndexController>();
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/paymal_logo.png"),
          ),
          DrawerListTile(
            title: "Portal",
            svgSrc: "assets/icons/menu_dashbord.svg",
            selected: indexProvider.index==0,
            press: () {
              indexProvider.index = 0;
              if(!Responsive.isDesktop(context)) {
                Navigator.pop(context);
              }
            },
          ),
          DrawerListTile(
            title: "Report",
            selected: indexProvider.index==1,
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              indexProvider.index = 1;
              if(!Responsive.isDesktop(context)) {
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.selected
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: selected?headerColor:Colors.white
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
      child: ListTile(
        onTap: press,

        horizontalTitleGap: 0.0,
        leading: SvgPicture.asset(
          svgSrc,
          color:selected?Colors.white: Colors.black,
          height: 16,
        ),
        title: Text(
          title,
          style: TextStyle(color:selected?Colors.white: Colors.black54),
        ),
      ),
    );
  }
}
