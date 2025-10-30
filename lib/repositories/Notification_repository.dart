

import 'package:shoppingapp/models/Notification_types.dart';

class NotificationRepository {
  List<NotificationItem> getNotifications(){
    return  [
      NotificationItem(
        title: 'Order Confirmed', 
        subtitle: 'Your order #123456789 has been confirmed.',
         time: '5 minutes ago',
         type: NotificationType.orders,
         isRead: true,
      ),
       NotificationItem(
        title: 'Special offer!', 
        subtitle: 'Get 20% off on your next purchase.',
         time: '55 minutes ago',
         type: NotificationType.promo,
         isRead: true,
      ),
       NotificationItem(
        title: 'Out for delivery', 
        subtitle: 'Your order #123456789 is out for delivery.',
         time: '5 hours ago',
         type: NotificationType.delivery,
         isRead: true,
      ),
      NotificationItem(
        title: 'Payment successful', 
        subtitle: 'Your payment for order #678539 has been successful.',
         time: '10 hours ago',
         type: NotificationType.payment,
         isRead: true,
      ),
    ];
  }
}