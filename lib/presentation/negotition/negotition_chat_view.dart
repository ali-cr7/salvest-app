import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/utility/app_colors.dart';

class NegotitionChatView extends StatelessWidget {
  const NegotitionChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: const Text(
          'Ali/Expert Team',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          // Message from expert (left bubble)
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(12),
              constraints: const BoxConstraints(maxWidth: 267),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x4C000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
                color: Color(0xAD9A8AEC),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(19),
                  topRight: Radius.circular(19),
                  bottomRight: Radius.circular(19),
                ),
              ),
              child: const Text(
                "Hello, I'm Ali from Expert Team. How can I help you",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Message from user (right bubble)
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(12),
              constraints: const BoxConstraints(maxWidth: 266),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x265B5B5B),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
                color: Color(0x265B5B5B),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(19),
                  topRight: Radius.circular(19),
                  bottomLeft: Radius.circular(19),
                ),
              ),
              child: const Text(
                "Hello Ali ..., I would Like to negotiate about yours offer..",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Offer message with buttons
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(12),
              constraints: const BoxConstraints(maxWidth: 267),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x4C000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
                color: Color(0xAD9A8AEC),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(19),
                  topRight: Radius.circular(19),
                  bottomRight: Radius.circular(19),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Our expert team reached an offer about your home that requires that half of the amount be paid over three months and after the end of the remaining half investment in addition to 5% of the investments",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Accept Button
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0x5946E050).withOpacity(0.35),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Accept',
                          style: TextStyle(
                            color: Color(0xFF036D0F),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Spacer(),
                      // Reject Button
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0x3FD9D9D9).withOpacity(0.25),
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'reject',
                          style: TextStyle(
                            color: Color(0xBFF1272A),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          // Input Field
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Color(0x4F786CB9),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'message.....',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.black38,
                          fontSize: 13,
                          fontFamily: 'Inter',
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Color(0xFF786CB9)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
