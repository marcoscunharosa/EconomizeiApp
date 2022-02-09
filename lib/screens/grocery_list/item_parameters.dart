import '../../models/unit_type.dart';
import '../../models/product_shop.dart';
import 'package:flutter/material.dart';

class ItemParameters extends StatefulWidget {
  ProductShop product;

  ItemParameters({required this.product});

  @override
  State<ItemParameters> createState() => _ItemParametersState();
}

class _ItemParametersState extends State<ItemParameters> {
  final _value = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 30,
            child: TextFormField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              initialValue: widget.product.amount.toString(),
              style: const TextStyle(
                fontSize: 12,
                overflow: TextOverflow.ellipsis,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                  borderSide: const BorderSide(
                    color: Color(0xFF989898),
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2.0),
                borderSide: const BorderSide(
                  color: Color(0xFF989898),
                  width: 1.0,
                ),
              ),
              child: Container(
                height: 30,
                padding: const EdgeInsets.all(5),
                child: DropdownButton<String>(
                  underline: const SizedBox(),
                  value: widget.product.unit.title,
                  elevation: 16,
                  iconSize: 2,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      if (newValue == UnitType.grama.title) {
                        widget.product.unit = UnitType.grama;
                      } else if (newValue == UnitType.kilograma.title) {
                        widget.product.unit = UnitType.kilograma;
                      } else if (newValue == UnitType.unidade.title) {
                        widget.product.unit = UnitType.unidade;
                      }
                    });
                  },
                  items: UnitType.values
                      .map<DropdownMenuItem<String>>((UnitType value) {
                    return DropdownMenuItem<String>(
                      value: value.title.toString(),
                      child: Text(value.title.toString()),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Container(
            width: 60,
            height: 30,
            child: TextFormField(
              controller: _value,
              onChanged: (String value) {
                setState(() {
                  widget.product.setValue(double.parse(_value.text));
                });
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                overflow: TextOverflow.ellipsis,
              ),
              decoration: InputDecoration(
                //prefixText: "R\$",
                labelText: "R\$",
                hintText: widget.product.value.toStringAsFixed(2),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: EdgeInsets.all(0),
                alignLabelWithHint: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                  borderSide: const BorderSide(
                    color: Color(0xFF989898),
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
