import 'package:flutter/material.dart' as i_card;

class ICard {
  static i_card.Widget Card(context, {child}) {
    return i_card.Container(
      padding: i_card.EdgeInsets.only(left: 10, right: 10, top: 10),
      width: i_card.MediaQuery.of(context).size.width - 20,
      decoration: const i_card.BoxDecoration(
        color: i_card.Colors.white,
        borderRadius: i_card.BorderRadius.all(
          i_card.Radius.circular(10),
        ),
      ),
      child: child,
    );
  }
}
