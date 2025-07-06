import 'package:flutter/material.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key}); // 1. Add key as super parameter

  @override
  CreateEventScreenState createState() => CreateEventScreenState(); // 2. Make State class public
}

class CreateEventScreenState extends State<CreateEventScreen> { // 2. Make State class public
  final _formKey = GlobalKey<FormState>();
  String title = '', location = '', description = '';
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Event")), // 3. Use const
      body: Padding(
        padding: const EdgeInsets.all(16.0), // 3. Use const
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'), // 3. Use const
                onChanged: (val) => title = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Location'), // 3. Use const
                onChanged: (val) => location = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'), // 3. Use const
                onChanged: (val) => description = val,
              ),
              const SizedBox(height: 20), // 3. Use const
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Save Event"), // 3. Use const
              )
            ],
          ),
        ),
      ),
    );
  }
}