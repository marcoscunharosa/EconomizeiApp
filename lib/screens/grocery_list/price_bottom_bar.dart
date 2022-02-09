import 'package:flutter/material.dart';

class PriceBottomBar extends StatefulWidget {
  double price;
  PriceBottomBar({Key? key, required this.price}) : super(key: key);

  @override
  _PriceBottomBarState createState() => _PriceBottomBarState();
}

class _PriceBottomBarState extends State<PriceBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65,
      color: const Color(0xFF32CD32),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 97,
                  child: const Text(
                    "Preço\nestimado:",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 35),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text(
                      "R\$ ${widget.price.toStringAsFixed(2)}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF32CD32),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
