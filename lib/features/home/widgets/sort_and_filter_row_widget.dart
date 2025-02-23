import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SortAndFilterRowWidget extends StatelessWidget {
  const SortAndFilterRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('52,082+ Items',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.sort),
                onPressed: () {
                  // Add sort functionality
                },
              ),
              IconButton(
                icon: const Icon(Icons.filter_alt),
                onPressed: () {
                  // Add filter functionality
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
