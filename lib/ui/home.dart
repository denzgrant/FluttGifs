import 'package:flutt_gifs/services/apiTrending.dart';
import 'package:flutt_gifs/models/trendingInfo.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<TrendingGifsModel> _trendingGifsModel;
  @override
  void initState() {
    _trendingGifsModel = TrendingInfo().getTrendingGifs();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Image.asset(
                  'assets/logo.png',
                  scale: 0.8,
                ),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.white, size: 30),
            ),
            expandedHeight: 300.0,
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 50,
              color: Colors.grey,
              width: MediaQuery.of(context).size.width,
              child: Text("Search Goes here"),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
            ),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                child: FutureBuilder<TrendingGifsModel>(
                  future: _trendingGifsModel,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.data.length,
                          itemBuilder: (context, index) {
                            var gifs = snapshot.data.data[index];
                            return Container(
                              height: 400,
                              width: 300,
                              child: Row(
                                children: [
                                  Image.network(gifs.url),
                                ],
                              ),
                            );
                          });
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              );
            }),
          ),
          // SliverGrid.count(
          //   crossAxisCount: 2,
          //   children: [
          //     Container(color: Colors.red, height: 150.0),
          //     Container(color: Colors.purple, height: 150.0),
          //     Container(color: Colors.green, height: 150.0),
          //     Container(color: Colors.orange, height: 150.0),
          //     Container(color: Colors.yellow, height: 150.0),
          //     Container(color: Colors.pink, height: 150.0),
          //     Container(color: Colors.cyan, height: 150.0),
          //     Container(color: Colors.indigo, height: 150.0),
          //     Container(color: Colors.blue, height: 150.0),
          //   ],
          // ),
        ],
      ),
    );
  }
}
