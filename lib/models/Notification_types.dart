enum NotificationType {orders,delivery,promo,payment}

class NotificationItem{
 final String title;
 final String subtitle;
 final String time;
 final NotificationType type;
 final bool isRead;
 NotificationItem(
  {
  required this.title,
  required this.subtitle,
  required this.time,
  required this.type,
  this.isRead = false,
  }
  );
}