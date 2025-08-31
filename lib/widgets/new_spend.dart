import 'package:flutter/material.dart';
import 'package:flutter_spendybuddy/models/spend.dart';

class NewSpend extends StatefulWidget {
  const NewSpend({super.key, required this.onAddSpend});

  final void Function(Spend spend) onAddSpend;

  @override
  State<NewSpend> createState() {
    return _NewSpendState();
  }
}

class _NewSpendState extends State<NewSpend> {
  final _spendTitleController = TextEditingController();
  final _spendAmountController = TextEditingController();
  DateTime? _selectedDate;
  SpendCategory _selectedCategory = SpendCategory.values[0];

  void _saveSpend() {
    final enteredAmount = double.tryParse(_spendAmountController.text);
    final invalidAmount = enteredAmount == null || enteredAmount < 0;
    final emptyField =
        _spendTitleController.text.trim().isEmpty || _selectedDate == null;
    if (invalidAmount || emptyField) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input!"),
          content: const Text("Please enter valid amount and date."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Okay"),
            ),
          ],
        ),
      );
      return;
    }
    widget.onAddSpend(
      Spend(
        title: _spendTitleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  void _pickDate() async {
    final present = DateTime.now();
    final pickFirstDate = DateTime(
      present.year - 5,
      present.month,
      present.day,
    );
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: present,
      firstDate: pickFirstDate,
      lastDate: present,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _spendTitleController.dispose();
    _spendAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(24, 24, 24, keyboardSpace + 24),
        child: Column(
          children: [
            TextField(
              controller: _spendTitleController,
              maxLength: 64,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text("Title"),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _spendAmountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixText: "৳",
                      label: Text("Amount Spent"),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'No Date Selected!'
                            : dateFormatter.format(_selectedDate!),
                      ),
                      IconButton(
                        onPressed: _pickDate,
                        icon: const Icon(
                          Icons.calendar_month_rounded,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                DropdownButton(
                  value: _selectedCategory,
                  items: SpendCategory.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: _saveSpend,
                  child: Text("Save"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
