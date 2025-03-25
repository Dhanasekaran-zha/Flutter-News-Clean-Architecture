import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final String source, amount, type, date, transactionId;

  const TransactionCard({
    super.key,
    required this.source,
    required this.amount,
    required this.type,
    required this.date,
    required this.transactionId,
  });

  @override
  Widget build(BuildContext context) {
    bool isReceived = type == "Received Fund";
    String formattedDate = DateFormat("MMM dd, yyyy").format(DateTime.parse(date));

    // Extract last 6 digits of Transaction ID
    String shortTransactionId = transactionId.substring(transactionId.length - 6);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue, width: 1.2), // Blue Border
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Transaction ID Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Trans ID: ****$shortTransactionId", // Only last 6 digits
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black54),
                ),
                // Type Badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: isReceived ? Colors.green[50] : Colors.blue[50],
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                    border: Border.all(
                      color: isReceived ? Colors.green : Colors.blue,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    type,
                    style: TextStyle(
                      color: isReceived ? Colors.green : Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Source Row
            Text(
              isReceived ? "From: $source" : "To: $source",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),

            // Date
            Text(
              "Date: $formattedDate",
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 10),

            // Amount
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "RS $amount",
                style: TextStyle(
                  color: isReceived ? Colors.green : Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
