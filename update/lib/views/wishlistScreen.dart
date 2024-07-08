import 'package:flutter/material.dart';
import 'package:morfo/provider/tambahTroll_provider.dart';
import 'package:morfo/provider/wishlist_provider.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final trollProvider = Provider.of<TrollProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Wishlist',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: ListView.separated(
        itemCount: wishlistProvider.wishlist.length,
        itemBuilder: (context, index) {
          Troll troll = wishlistProvider.wishlist[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                troll.gambar,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              troll.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              troll.harga,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.green),
                  onPressed: () {
                    trollProvider.addTroll(troll);
                    wishlistProvider.removeWishlist(troll.name);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    wishlistProvider.removeWishlist(troll.name);
                  },
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
          thickness: 1,
          indent: 20,
        ),
      ),
    );
  }
}
