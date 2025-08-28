import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spendybuddy/models/spend.dart';

class NewSpend extends StatefulWidget {
  const NewSpend({super.key});

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
    return Padding(
      padding: const EdgeInsets.all(24),
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
                    prefixText: "\৳",
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
                onPressed: () {
                  print(_spendTitleController.text);
                  print(_spendAmountController.text);
                },
                child: Text("Save"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
