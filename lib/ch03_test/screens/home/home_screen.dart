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
            const Text("전포동"),
            const SizedBox(
              width: 4,
            ),
            IconButton(
              icon: Icon(CupertinoIcons.chevron_down),
              onPressed: () {},
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search)),
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.list_dash)),
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bell)),
        ],
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.5),
            child: Divider(
              thickness: 1,
              height: 1,
              color: Colors.grey,
            )),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            indent: 16,
            endIndent: 16,
            thickness: .5,
            height: .5,
            color: Colors.orange,
          );
        },
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return Container(
            padding: const EdgeInsets.all(16),
            height: 135,
            child: Row(
              children: [
                // Image
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      product.urlToImage,
                      width: 115,
                      height: 115,
                      fit: BoxFit.cover,
                    )),
                const SizedBox(width: 16),
                // Desc.
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title, style: textTheme().bodyLarge),
                      const SizedBox(height: 4),
                      Text("${product.address} • ${product.publishedAt}"),
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
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
  // String numberFormat(String price) {
  //   final formatter = NumberFormat('#,###');
  //   return formatter.format(int.parse(price));
  // }

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
