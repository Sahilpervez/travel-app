import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/hotels_provider.dart';

class MainBarBuilder extends StatefulWidget {
  const MainBarBuilder({
    super.key,
    required ScrollController controller,
  }) : _controller = controller;

  final ScrollController _controller;

  @override
  State<MainBarBuilder> createState() => _MainBarBuilderState();
}

class _MainBarBuilderState extends State<MainBarBuilder> {
  int selected_idx = 0;

  void selector(int idx) {
    setState(() {
      selected_idx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    final options = Provider.of<HotelsProvider>(context).mainBarItems;
    return Scrollbar(
      controller: widget._controller,
      child: ListView(
        scrollDirection: Axis.horizontal,
        controller: widget._controller,
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          ...options.map((element) {
            int idx = options.indexOf(element);
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              margin: const EdgeInsets.only(right: 20, top: 0, bottom: 30),
              child: MainBarOptions(
                title: element['title']!,
                icon: element['icon']!,
                idx: idx,
                selector: selector,
                selected: (idx == selected_idx) ? true : false,
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

class MainBarOptions extends StatelessWidget {
  MainBarOptions(
      {super.key,
        required this.title,
        required this.icon,
        required this.idx,
        required this.selector,
        required this.selected});
  bool selected;
  final String title;
  final String icon;
  final int idx;
  Function selector;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: () {
        selector(idx);
      },
      child: Container(
        width: 85,
        decoration: BoxDecoration(
          color: (selected) ?
          const Color(0xff499BE7) :
          Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: (selected) ? Colors.blue : Colors.grey.shade300,
            width: 1.3,
          ),
          boxShadow: [
            if (selected)
              const BoxShadow(
                color: Color(0xff8faee7),
                blurRadius: 25,
                offset: Offset(10, 10),
              )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              icon,
              height: 32,
              color: (selected) ? Colors.white : Colors.grey.shade600,
            ),
            Text(
              title,
              style: TextStyle(
                color: (selected) ? Colors.white : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}