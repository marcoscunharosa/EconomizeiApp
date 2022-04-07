import 'package:flutter/material.dart';
import 'package:fraction/fraction.dart';

import '../models/plate_part.dart';

class PlatePartCard extends StatelessWidget {
  final PlatePart platePart;
  final Function removePlatePart;
  const PlatePartCard(
      {Key? key, required this.platePart, required this.removePlatePart})
      : super(key: key);

  String getGlyph(double value) {
    var glyph = value.toStringAsFixed(1);
    try {
      var fractionAmount = platePart.amount.floor();
      if (fractionAmount > 0) {
        glyph = fractionAmount.toString() +
            " e " +
            Fraction.fromDouble(platePart.amount - fractionAmount)
                .toStringAsGlyph();
      } else {
        glyph = Fraction.fromDouble(platePart.amount).toStringAsGlyph();
      }
    } catch (e) {
      glyph = value.toStringAsFixed(1);
    }
    return glyph;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Card(
        elevation: 4,
        color: Color(0xFFF8F8F8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color:
                          platePart.isAlwaysOnPlate || platePart.canBeReplaced
                              ? Color(0xFFEE0F55)
                              : Color(0xFFF8F8F8),
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(12.0))),
                  margin: EdgeInsets.only(right: 15),
                  width: 33,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      platePart.isAlwaysOnPlate
                          ? Icon(
                              Icons.replay,
                              color: Colors.white,
                              size: 18,
                            )
                          : Container(),
                      platePart.canBeReplaced
                          ? Icon(
                              Icons.swap_horiz_rounded,
                              color: Colors.white,
                              size: 18,
                            )
                          : Container(),
                    ],
                  ),
                ),
                Container(
                  width: 200,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  //alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        platePart.recipe.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        platePart.amount % 1 == 0
                            ? "${platePart.amount.toInt()} ${platePart.unityString}"
                            : "${getGlyph(platePart.amount)} ${platePart.unityString}",
                        style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            overflow: TextOverflow.ellipsis),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  removePlatePart(platePart);
                },
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20),
            ),
          ],
        ),
      ),
    );
  }
}
