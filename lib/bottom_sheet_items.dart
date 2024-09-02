
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetItems extends StatelessWidget {
  const BottomSheetItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey,
                borderRadius: BorderRadius.circular(10)
              ),
              height: 80,
              width: 80,
            ),
          ),
        ),
        SizedBox(width: 8,),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16)
                  ),
                  height: 30,
                ),
                SizedBox(height: 6,),
                Padding(
                  padding: const EdgeInsets.only(right: 44),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(14)
                    ),
                    height: 25,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
