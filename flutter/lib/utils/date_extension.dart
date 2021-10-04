extension MoreFeatureDate on DateTime {
  bool isBetween(DateTime left, DateTime right) => !(isBefore(left) || isAfter(right));
}
