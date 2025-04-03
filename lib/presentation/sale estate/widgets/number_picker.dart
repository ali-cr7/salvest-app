import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberPicker extends StatefulWidget {
  final String label;
  final int value;
  final Function(int) onChanged;
  final String? suffix;

  const NumberPicker({
    required this.label,
    required this.value,
    required this.onChanged,
    this.suffix,
    super.key,
  });

  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        spacing: 10,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              color: Colors.black.withValues(alpha: 80),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            width: 107,
            height: 26.63,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    '${widget.value}',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 7.0, top: 5.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => widget.onChanged(widget.value + 1),
                        child: Transform.rotate(
                          angle: 90 * (3.1415926535 / 180),
                          child: const Icon(Icons.arrow_back_ios, size: 10),
                        ),
                      ),
                      //
                      GestureDetector(
                        onTap: () => widget.onChanged(widget.value - 1),
                        child: Transform.rotate(
                          angle: -90 * (3.1415926535 / 180),
                          child: const Icon(Icons.arrow_back_ios, size: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (widget.suffix != null) ...[
            //  const SizedBox(width: 2),
            Text(widget.suffix!, style: const TextStyle(fontSize: 14)),
          ],
        ],
      ),
    );
  }
}
