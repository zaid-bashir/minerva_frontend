// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustumDrawer extends StatefulWidget {
  const CustumDrawer({ Key key }) : super(key: key);

  @override
  State<CustumDrawer> createState() => _CustumDrawerState();
}

class _CustumDrawerState extends State<CustumDrawer> {
  final double _drawerIconSize = 24;

  final double _drawerFontSize = 17;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [
                0.0,
                1.0
              ],
                  colors: [
                Theme.of(context).primaryColor.withOpacity(0.2),
                Theme.of(context).accentColor.withOpacity(0.5),
              ])),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.0, 1.0],
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor,
                    ],
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const Center(
                    child: Text(
                      "Minerva Flutter Test",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  }
}