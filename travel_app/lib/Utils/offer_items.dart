import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/hotels_provider.dart';

class OfferItemBuilder extends StatefulWidget {
  const OfferItemBuilder({
    super.key,
    required this.controller,
  });
  final controller;
  @override
  State<OfferItemBuilder> createState() => _OfferItemBuilderState();
}

class _OfferItemBuilderState extends State<OfferItemBuilder> {
  int selected_idx = 0;
  void selector(int idx) {
    setState(() {
      selected_idx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    final offers = Provider.of<HotelsProvider>(context).offers;
    return SizedBox(
      height: 135,
      child: Scrollbar(
        child: ListView(
          controller: widget.controller,
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          scrollDirection: Axis.horizontal,
          children: [
            ...offers.map((e) {
              int idx = offers.indexOf(e);
              return OfferItems(
                selected: (selected_idx == idx) ?  true: false,
                offer: e,
                selector: selector,
                idx : idx,
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class OfferItems extends StatelessWidget {
  const OfferItems({
    super.key,
    required this.selected,
    required this.offer,
    required this.selector,
    required this.idx,
  });
  final bool selected;
  final offer;
  final Function selector;
  final int idx;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: InkWell(
        onTap: () {
          if (kDebugMode) {
            print("${offer['title']} selected");
          }
          selector(idx);
        },
        child: Container(
          width: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: (selected == true) ? Colors.grey.shade700 : Colors.grey.shade400,
            ),
            boxShadow: [
              if(selected)
                BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(10, 10),
                    spreadRadius: 5,
                    blurRadius: 10
                ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: AssetImage(offer['icon']),
                height: 40,
                width: 40,
                color: (selected == true) ? Colors.black :Colors.grey,
              ),
              Text(offer['title'],style: TextStyle(
                color: (selected == true) ? Colors.black :Colors.grey,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}