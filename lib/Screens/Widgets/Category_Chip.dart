import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';

class CategoryChip extends StatefulWidget {
  const CategoryChip({super.key});

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  int SelectedIndex =0;
  final Categories = ["All","Man","woman","Boys","Girls"];
  @override
  Widget build(BuildContext context) {
    final isDark =Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(
         Categories.length,
            (index) => Padding(
              padding: EdgeInsetsGeometry.only(right: 12),
              child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: ChoiceChip(
              label: Text(
                Categories[index],
                style:AppTextStyle.withColor(
                 SelectedIndex == index
                 ?AppTextStyle.withWight(
                  AppTextStyle.bodyTextSmall,
                   FontWeight.w600,
                   ):
                   AppTextStyle.bodyTextSmall,
                   SelectedIndex == index ?
                   Colors.white :
                   isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ), 
              selected: SelectedIndex==index,
              onSelected: (bool selected){
                setState(() {
                  SelectedIndex= selected ? index :SelectedIndex;
                });
              },
              selectedColor: Theme.of(context).primaryColor,
              backgroundColor: isDark? Colors.grey[800]: Colors.grey[100],
              shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(12),
               ),
               elevation: SelectedIndex== index ? 4:0,
               pressElevation: 0,
               padding: EdgeInsets.symmetric(
                horizontal:16 ,
                vertical: 8,
               ),
               labelPadding: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 1,
               ),
               materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
               side: BorderSide(
                color : SelectedIndex ==index ?
                Colors.transparent:
                isDark ? Colors.grey[700]! : Colors.grey[300]!,
                width: 1,
               ),
              ),
            ),

            ),
        ),
        ),
    );
  }
}