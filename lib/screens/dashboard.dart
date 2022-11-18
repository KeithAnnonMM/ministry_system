import 'package:flutter/material.dart';
import 'package:ministry_system/responsive/res.dart';
import 'package:ministry_system/widgets/reusable_dash_button.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Responsive res = Responsive(context: context);
    return Scaffold(
        body: Column(
      children: [
        Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: res.getWidth(255),
              color: const Color(0xFF12113C),
              child: Padding(
                padding: EdgeInsets.fromLTRB(res.getWidth(20), res.getWidth(40),
                    res.getWidth(20), res.getWidth(15)),
                child: Column(
                  children: [
                    Image(
                      image: const AssetImage('assets/gavo_new.png'),
                      height: res.getHeight(120),
                      width: res.getWidth(120),
                    ),
                    SizedBox(height: res.getHeight(40)),
                    dashButton(
                      text: 'Dashboard',
                      icon: Icons.dashboard,
                      color: Colors.blue,
                      res: res,
                      isSelected: false,
                      isDash: true,
                    ),
                    SizedBox(height: res.getHeight(40)),
                    dashButton(
                      text: 'Overview',
                      icon: Icons.pie_chart_sharp,
                      color: Colors.grey,
                      res: res,
                      isSelected: true,
                      isDash: false,
                    ),
                    SizedBox(height: res.getHeight(15)),
                    dashButton(
                      text: 'Documents',
                      icon: Icons.document_scanner,
                      color: Colors.grey,
                      res: res,
                      isSelected: false,
                      isDash: false,
                    ),
                    SizedBox(height: res.getHeight(15)),
                    dashButton(
                      text: 'Downloads',
                      icon: Icons.download,
                      color: Colors.grey,
                      res: res,
                      isSelected: false,
                      isDash: false,
                    ),
                    SizedBox(height: res.getHeight(15)),
                    dashButton(
                      text: 'Categories',
                      icon: Icons.category,
                      color: Colors.grey,
                      res: res,
                      isSelected: false,
                      isDash: false,
                    ),
                    SizedBox(height: res.getHeight(15)),
                    dashButton(
                      text: 'Trash',
                      icon: Icons.delete,
                      color: Colors.grey,
                      res: res,
                      isSelected: false,
                      isDash: false,
                    ),
                    SizedBox(height: res.getHeight(40)),
                    Divider(height: res.getHeight(5)),
                    dashButton(
                      text: 'Settings',
                      icon: Icons.settings,
                      color: Colors.grey,
                      res: res,
                      isSelected: false,
                      isDash: false,
                    ),
                    SizedBox(height: res.getHeight(15)),
                    dashButton(
                      text: 'Reviews',
                      icon: Icons.reviews,
                      color: Colors.grey,
                      res: res,
                      isSelected: false,
                      isDash: false,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.grey,
            ))
          ],
        )
      ],
    ));
  }
}
