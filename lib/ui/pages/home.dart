import 'package:flutter/material.dart';
import 'package:khalticlone/res/typography.dart';
import 'package:khalticlone/ui/widgets/bottom_expandable_app_bar/bottom_expandable_app_bar.dart';
import 'package:khalticlone/ui/widgets/bottom_expandable_app_bar/controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  BottomBarController controller;

  @override
    void initState() {
      super.initState();
      controller = BottomBarController(vsync: this, dragLength: 550, snap: true);
    }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            title: Text("Khalti"),
            bottom: PreferredSize(
              child: _buildHeader(),
              preferredSize: const Size.fromHeight(90),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: (){},
              )
            ],
          ),
          _buildHeading("Utility Payments"),
          _buildDivider(),
          _buildHeading("Bookings"),
          _buildDivider(height: 8.0),
          SliverList(
            delegate: SliverChildBuilderDelegate((_,index){
              return ListTile(
                title: Text("Item $index"),
              );
            }),
          )
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onVerticalDragUpdate: controller.onDrag,
        onVerticalDragEnd: controller.onDragEnd,
        child: _buildBottomBar(context),
      ),
    );
  }

  BottomExpandableAppBar _buildBottomBar(BuildContext context) {
    return BottomExpandableAppBar(
      attachSide: Side.Top,
      controller: controller,
      expandedHeight: MediaQuery.of(context).size.height - 75,
      horizontalMargin: 16,
      appBarHeight: 50,
      bottomOffset: 0,
      expandedBackColor: Colors.white,
      expandedBody: Center(
        child: Text("Profile"),
      ),
      bottomAppBarColor: Colors.grey.shade200,
      bottomAppBarBody: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: _buildBottomMenuItem(
              icon: Icon(Icons.home),
              label: "Home",
              onTap: (){}
            ),
          ),
          Expanded(
            child: _buildBottomMenuItem(
              icon: Icon(Icons.card_giftcard),
              label: "Bazaar",
              onTap: (){}
            ),
          ),
          Expanded(
            child: _buildBottomMenuItem(
              icon: Icon(Icons.list),
              label: "Transactions",
              onTap: (){}
            ),
          ),
          Expanded(
            child: _buildBottomMenuItem(
              icon: Icon(Icons.more_horiz),
              label: "More",
              onTap: () => controller.open()
            ),
          ),
        ],
      ),
    );
  }

  MaterialButton _buildBottomMenuItem({Widget icon, String label, Function onTap}) {
    return MaterialButton(
      height: 30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon,
          Text(label, style: TextStyle(
            fontSize: 10
          ),)
        ],
      ),
      onPressed: onTap,
    );
  }

  Widget _buildHeading(String title) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverToBoxAdapter(
        child: Container(
          child: Text(title, style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
        ),
      ),
    );
  }

  Widget _buildDivider({Color color, double height = 4.0}) {
    if(color == null ) color = Colors.deepPurple.shade100;
    return SliverToBoxAdapter(
      child: Container(
        height: height,
        color: color,
      ),
    );
  }

  Container _buildHeader() {
    return Container(
      height: 100.0,
      width: double.infinity,
      color: Colors.deepPurple.shade200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          _buildHeaderItem(icon: Icons.account_balance_wallet, label: "Load Fund"),
          Spacer(),
          _buildHeaderItem(icon: Icons.mobile_screen_share, label: "Send/Request"),
          Spacer(),
          _buildHeaderItem(icon: Icons.code,label: "Scan & Pay"),
          Spacer(),
          _buildHeaderItem(icon: Icons.collections,label: "Bank Transfer"),
          Spacer(),
        ],
      ),
    );
  }

  Column _buildHeaderItem({IconData icon, String label}) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
              ),
              child: Icon(icon,size: 30,),
            ),
            const SizedBox(height: 5.0),
            Text(label, style: smallText,),
          ],
        );
  }
}