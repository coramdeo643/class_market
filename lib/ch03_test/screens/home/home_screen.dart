import 'package:class_market/ch01/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/product.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("New York"),
            const SizedBox(width: 8),
            IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("List of Neighborhoods is coming..."),
                    duration: Duration(seconds: 1),
                  ));
                },
                icon: Icon(CupertinoIcons.chevron_down)),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Search is coming..."),
                  duration: Duration(seconds: 1),
                ));
              },
              icon: Icon(CupertinoIcons.search)),
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Lists is coming..."),
                  duration: Duration(seconds: 1),
                ));
              },
              icon: Icon(CupertinoIcons.list_dash)),
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Notice is coming..."),
                  duration: Duration(seconds: 1),
                ));
              },
              icon: Icon(CupertinoIcons.bell))
        ],
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(.5),
            child: Divider(
              thickness: 1,
              height: 1,
              color: Colors.grey,
            )),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            final product = productList[index];
            return Container(
              padding: const EdgeInsets.all(16),
              height: 128,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      product.urlToImage,
                      width: 128,
                      height: 128,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title, style: textTheme().bodyLarge),
                      const SizedBox(height: 4),
                      Text("${product.address} / ${product.publishedAt}"),
                      const SizedBox(height: 4),
                      Text("\$ ${product.price}"),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Visibility(
                            visible: product.commentsCount > 0,
                            child: _buildIcons(product.commentsCount,
                                CupertinoIcons.chat_bubble_2),
                          ),
                          const SizedBox(width: 8),
                          Visibility(
                            visible: product.heartCount > 0,
                            child: _buildIcons(
                                product.heartCount, CupertinoIcons.heart),
                          ),
                        ],
                      )
                    ],
                  ))
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              indent: 24,
              endIndent: 24,
            );
          },
          itemCount: productList.length),
    );
  }

  Widget _buildIcons(int count, IconData iconData) {
    return Row(
      children: [
        Icon(iconData, size: 14.0),
        const SizedBox(width: 4.0),
        Text('$count'),
      ],
    );
  }
}
