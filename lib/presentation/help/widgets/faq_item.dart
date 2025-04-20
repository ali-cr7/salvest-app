import 'package:flutter/material.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;
  final bool initiallyExpanded;

  const FAQItem({
    Key? key,
    required this.question,
    required this.answer,
    this.initiallyExpanded = false,
  }) : super(key: key);

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Stack(
        children: [
          Container(
            height: _isExpanded ? 172 : null,
            decoration: ShapeDecoration(
              gradient: AppColors.purple2Gradient.withOpacity(0.62),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: const Color(0x755B5B5B)),
                borderRadius: BorderRadius.circular(7),
              ),
            ),

            child: ListTile(
              leading: Image(image: AssetImage(AppAssets.questionMark)),
              title: Text(
                widget.question,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: Icon(
                _isExpanded ? Icons.expand_less : Icons.expand_more,
              ),
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ),
          if (_isExpanded && widget.answer.isNotEmpty)
            Positioned(
              top: 69,
              left: 40,

              child: Container(
                width: 310,
                height: 91,
                decoration: ShapeDecoration(
                  color: Colors.white.withValues(alpha: 194),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.answer,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
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
