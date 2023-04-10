import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management/favorite/myfavorite.dart';
import 'package:flutter_provider_state_management/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    print('Favorite App');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite App'),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const MyFavorite();
              },));

              },
            child: Icon(Icons.favorite),
          ),
          SizedBox(width: 15,)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Consumer<FavoriteProvider>(
                  builder: (context, val, child) {
                    return ListTile(
                      onTap: () {
                        if (val.selectedItem.contains(index)) {
                          val.removeItem(index);
                        } else {
                          val.addItem(index);
                        }
                      },
                      leading: Text('Item $index'),
                      trailing: Icon(val.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
