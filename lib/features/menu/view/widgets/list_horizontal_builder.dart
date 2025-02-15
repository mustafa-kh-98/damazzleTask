import 'package:flutter/material.dart';

import 'more_card.dart';

class ListHorizontalBuilder<T> extends StatelessWidget {
  final Widget Function(BuildContext context, int index, T item) itemBuilder;
  final String moreTitle;
  final List<T> data;

  const ListHorizontalBuilder({
    super.key,
    required this.itemBuilder,
    required this.data,
    required this.moreTitle,
  });

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) return const SizedBox();

    return Column(
      children: [
        MoreCard(title: moreTitle),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: List.generate(
                data.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 8,
                  ),
                  child: itemBuilder(context, index, data[index]),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
