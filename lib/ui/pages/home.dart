import 'package:flutter/material.dart';
import 'package:khalticlone/res/typography.dart';

class HomePage extends StatelessWidget {
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