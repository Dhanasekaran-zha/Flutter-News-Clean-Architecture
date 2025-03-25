import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_clean_architecture/src/pages/daily_news/presentation/screens/daily_news_screen.dart';
import 'package:news_clean_architecture/src/pages/transaction/presentation/screens/TransactionCard.dart';
import 'package:news_clean_architecture/src/widgets/themed_app_bar.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _DashboardState();
}

class _DashboardState extends State<Transaction> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  String _selectedType = "Raised Fund"; // Default value
  DateTime? _selectedDate;
  List<Map<String, dynamic>> transactions = [
    {
      "_id": "67cd17a854b6fd7c507d83db",
      "userId": "67cb23f5d426b8438e5aaf11",
      "source": "Ramkumar",
      "amount": 5000,
      "type": "Received Fund",
      "date": "2025-03-09T00:00:00.000Z",
      "__v": 0
    },
    {
      "_id": "67cd17a854b6fd7c507d83dc",
      "userId": "67cb23f5d426b8438e5aaf12",
      "source": "Test",
      "amount": 5000,
      "type": "Raised Fund",
      "date": "2025-03-09T00:00:00.000Z",
      "__v": 0
    },
  ];

  void _showAddTransactionSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Center(
                    child: Text(
                      "Add Transaction",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 15),

                  // Client Name
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: "Client Name"),
                  ),
                  SizedBox(height: 10),

                  // Amount
                  TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Amount"),
                  ),
                  SizedBox(height: 10),

                  // Type (Dropdown)
                  DropdownButtonFormField<String>(
                    value: _selectedType,
                    decoration: InputDecoration(labelText: "Type"),
                    items: ["Raised Fund", "Received Fund"].map((type) {
                      return DropdownMenuItem(value: type, child: Text(type));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedType = value!;
                      });
                    },
                  ),
                  SizedBox(height: 10),

                  // Date Picker
                  GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );

                      if (pickedDate != null) {
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      }
                    },
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: _selectedDate == null
                              ? "Select Date"
                              : "Date: ${DateFormat('MMM dd, yyyy').format(_selectedDate!)}",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Submit Button
                  ElevatedButton(
                    onPressed: () {
                      _submitTransaction(context, setState);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text("Submit"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _submitTransaction(BuildContext context, Function setState) {
    if (_nameController.text.isEmpty ||
        _amountController.text.isEmpty ||
        _selectedDate == null) {
      _showAlertDialog( "Please fill all fields");
      return;
    }

    // Print Submitted Data
    print("Client Name: ${_nameController.text}");
    print("Amount: ${_amountController.text}");
    print("Type: $_selectedType");
    print("Date: ${DateFormat('MMM dd, yyyy').format(_selectedDate!)}");

    // Close Bottom Sheet
    Navigator.pop(context);
    // Clear the fields
    setState(() {
      _nameController.clear();
      _amountController.clear();
      _selectedType = "Raised Fund"; // Reset to default
      _selectedDate = null;
    });
  }


  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Warning"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Transactions")),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return TransactionCard(
            source: transactions[index]["source"],
            transactionId: transactions[index]["_id"],
            amount: transactions[index]["amount"].toString(),
            type: transactions[index]["type"],
            date: transactions[index]["date"],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTransactionSheet,
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, size: 30, color: Colors.white),
      ),
    );
  }
}
