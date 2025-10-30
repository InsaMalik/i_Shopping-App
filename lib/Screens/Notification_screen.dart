

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/models/Notification_types.dart';
import 'package:shoppingapp/repositories/Notification_repository.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';
import 'package:shoppingapp/utilities/Notification_utilities.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationRepository _repository= NotificationRepository();
   NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final notifications = _repository.getNotifications();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> Get.back(),
         icon: Icon(Icons.chevron_left),
         ),
         title: Text(
          'Notifications',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
         ),
         actions: [
          TextButton(onPressed: (){},
           child: Text(
            "Mark All as Read",
            style: AppTextStyle.withColor(
              AppTextStyle.MediumButton,
              Theme.of(context).primaryColor,
            ),
           ),
           ),
         ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context,index)=>_buildNotificationcard(
          context,
          notifications[index],
        ),
        ),
    );
  }
  Widget _buildNotificationcard(BuildContext context,NotificationItem notification){
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: notification.isRead
        ? Theme.of(context).cardColor
        : Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark
            ? Colors.black.withOpacity(0.2)
            :Colors.grey.withOpacity(0.1),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: NotificationUtils.getIconBackgroundColor(
              context,
              notification.type),
              shape:BoxShape.circle,
          ),
          child:Icon(
            NotificationUtils.getNotificationIcon(notification.type),
            color: NotificationUtils.getIconColor(
              context,
              notification.type),
          ),
        ),
        title: Text(
          notification.title,
          style: AppTextStyle.withColor(
            AppTextStyle.bodyTextLarge,
            Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4,),
            Text(
              notification.subtitle,
              style: AppTextStyle.withColor(
              AppTextStyle.bodyTextSmall,
              isDark ?Colors.grey[600]!:Colors.grey[600]!,
          ),
            )
          ],
        ),
      ),
    );
  }
}