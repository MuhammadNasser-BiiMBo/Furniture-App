import 'package:flutter/material.dart';
import 'package:furnitured/constants/colors.dart';
import 'package:furnitured/widgets/small_text.dart';
import 'package:sizer/sizer.dart';




class ExpandableTextWidget extends StatefulWidget {
  final String text;
  double lineHeight;
  ExpandableTextWidget({super.key, required this.text,this.lineHeight=1});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = 15.h;

  @override
  void initState(){
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf ="";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty ? SmallText(text: firstHalf,size: 16,color: AppColors.appGrey,height: widget.lineHeight,) : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallText(
            text: hiddenText ? ('$firstHalf...') : (firstHalf + secondHalf),
            size: 11.sp,
            color: AppColors.appGrey2,
            height: widget.lineHeight,spacing: 0,weight: FontWeight.w300,
          ),
          InkWell(
            onTap: () {
              setState(() {
                hiddenText = !hiddenText;
              });
            },
            child: IntrinsicWidth(
              child: Row(
                children: [
                  SmallText(
                    text: hiddenText?'Show more':'Show less',
                    color: AppColors.appPrimary,
                    height: widget.lineHeight,spacing: 0,size: 11.sp,weight: FontWeight.w700,
                  ),
                  Icon(
                    hiddenText?
                    Icons.arrow_drop_down:Icons.arrow_drop_up,
                    color: AppColors.appPrimary,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}