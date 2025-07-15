import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberPicker extends StatefulWidget {
  final String label;
  final int value;
  final Function(int) onChanged;
  final String? suffix;
  final double? width;
  final MainAxisAlignment numberAlignment;

  const NumberPicker({
    required this.label,
    required this.value,
    required this.onChanged,
    this.suffix,
    this.width,
    this.numberAlignment = MainAxisAlignment.spaceBetween,
    super.key,
  });

  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value.toString());
    _focusNode = FocusNode();
  }

  @override
  void didUpdateWidget(covariant NumberPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Only update controller if the user is not typing
    if (!_focusNode.hasFocus && widget.value.toString() != _controller.text) {
      _controller.text = widget.value.toString();
    }
  }

  void _handleTextChange(String value) {
    final parsed = int.tryParse(value);
    if (parsed != null) {
      widget.onChanged(parsed);
    }
  }

  void _increment() {
    final newValue = widget.value + 1;
    _controller.text = newValue.toString();
    widget.onChanged(newValue);
  }

  void _decrement() {
    final newValue = widget.value - 1;
    _controller.text = newValue.toString();
    widget.onChanged(newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            width: widget.width ?? 105.w,
            height: 30.63.h,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: widget.numberAlignment,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      keyboardType: TextInputType.numberWithOptions(
                        signed: true,
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      onChanged: _handleTextChange,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 7.0.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: _increment,
                        child: Transform.rotate(
                          angle: 90 * (3.1415926535 / 180),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 10.sp,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: _decrement,
                        child: Transform.rotate(
                          angle: -90 * (3.1415926535 / 180),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 10.sp,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (widget.suffix != null) ...[
            SizedBox(width: 4.w),
            Text(
              widget.suffix!,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black.withOpacity(0.8),
              ),
            ),
          ],
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
