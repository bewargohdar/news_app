import 'package:flutter/material.dart';

class CategoryButtons extends StatefulWidget {
  final int selectButtonIndex;
  final Function(int) onButtonPressed;

  const CategoryButtons({
    Key? key,
    required this.selectButtonIndex,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  _CategoryButtonsState createState() => _CategoryButtonsState();
}

class _CategoryButtonsState extends State<CategoryButtons> {
  @override
  Widget build(BuildContext context) {
    var selectButtonIndex = 0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(
                    color: selectButtonIndex == 0 ? Colors.red : Colors.grey,
                    width: 2),
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    selectButtonIndex = 0;
                  });
                },
                child: Text(
                  'General',
                  style: TextStyle(
                      color: selectButtonIndex == 0 ? Colors.red : Colors.grey,
                      fontWeight: FontWeight.bold),
                )),
          ),
          Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(
                    color: selectButtonIndex == 1 ? Colors.red : Colors.grey,
                    width: 2),
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    selectButtonIndex = 1;
                  });
                },
                child: Text(
                  'Health',
                  style: TextStyle(
                      color: selectButtonIndex == 1 ? Colors.red : Colors.grey,
                      fontWeight: FontWeight.bold),
                )),
          ),
          Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(
                    color: selectButtonIndex == 2 ? Colors.red : Colors.grey,
                    width: 2),
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    selectButtonIndex = 2;
                  });
                },
                child: Text(
                  'Finance',
                  style: TextStyle(
                      color: selectButtonIndex == 2 ? Colors.red : Colors.grey,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
    );
  }
}
