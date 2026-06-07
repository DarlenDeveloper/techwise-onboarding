import '../models/transaction.dart';

class MockData {
  // Summary card data
  static const double totalSales = 56000;
  static const int newUsers = 9;
  static const int activeProjects = 16;
  static const int pendingOrders = 4;

  // Weekly sales for bar chart (Mon–Sun)
  static const List<double> weeklySales = [
    32000, 48000, 27000, 56000, 41000, 63000, 38000,
  ];
  static const List<String> weekDays = [
    'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'
  ];

  // Recent activity (shown on dashboard)
  static const List<Map<String, dynamic>> recentActivity = [
    {
      'title': 'New order #1042',
      'subtitle': 'Laptop — Electronics',
      'amount': '+\$1,200',
      'time': '9:00 AM',
      'isIncome': true,
    },
    {
      'title': 'Refund processed',
      'subtitle': 'Headphones — Return',
      'amount': '-\$85',
      'time': '10:30 AM',
      'isIncome': false,
    },
    {
      'title': 'New user signed up',
      'subtitle': 'Grace M. — Kampala',
      'amount': '',
      'time': '11:15 AM',
      'isIncome': true,
    },
    {
      'title': 'Payment received',
      'subtitle': 'Project: ERP System',
      'amount': '+\$5,000',
      'time': '1:00 PM',
      'isIncome': true,
    },
    {
      'title': 'Subscription renewed',
      'subtitle': 'Team plan — Monthly',
      'amount': '-\$49',
      'time': '2:45 PM',
      'isIncome': false,
    },
  ];

  // Full transaction list for the details screen
  static final List<Transaction> transactions = [
    Transaction(id: 'TXN001', title: 'Laptop Sale', category: 'Electronics', amount: 1200, date: DateTime(2026, 6, 7, 9, 0), isIncome: true),
    Transaction(id: 'TXN002', title: 'Headphones Refund', category: 'Returns', amount: 85, date: DateTime(2026, 6, 7, 10, 30), isIncome: false),
    Transaction(id: 'TXN003', title: 'ERP Project Payment', category: 'Services', amount: 5000, date: DateTime(2026, 6, 7, 13, 0), isIncome: true),
    Transaction(id: 'TXN004', title: 'Team Subscription', category: 'Subscriptions', amount: 49, date: DateTime(2026, 6, 6, 14, 45), isIncome: false),
    Transaction(id: 'TXN005', title: 'Office Chair Sale', category: 'Furniture', amount: 350, date: DateTime(2026, 6, 6, 16, 0), isIncome: true),
    Transaction(id: 'TXN006', title: 'Cloud Hosting', category: 'Infrastructure', amount: 120, date: DateTime(2026, 6, 5, 9, 30), isIncome: false),
    Transaction(id: 'TXN007', title: 'Mobile App Project', category: 'Services', amount: 3200, date: DateTime(2026, 6, 5, 11, 0), isIncome: true),
    Transaction(id: 'TXN008', title: 'Keyboard & Mouse', category: 'Electronics', amount: 95, date: DateTime(2026, 6, 4, 15, 20), isIncome: true),
    Transaction(id: 'TXN009', title: 'Software License', category: 'Subscriptions', amount: 299, date: DateTime(2026, 6, 4, 10, 0), isIncome: false),
    Transaction(id: 'TXN010', title: 'Web Design Contract', category: 'Services', amount: 1800, date: DateTime(2026, 6, 3, 9, 0), isIncome: true),
  ];
}
