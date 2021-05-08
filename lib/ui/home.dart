import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/logo.png'),
            ),
            // pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.305,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                width: 5,
                height: MediaQuery.of(context).size.height,
                child: Container(
                  child: Text(
                    "Trending",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
