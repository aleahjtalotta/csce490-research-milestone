import 'package:flutter/material.dart';

void main() {
  runApp(const SplitItApp());
}

class SplitItApp extends StatelessWidget {
  const SplitItApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SplitIt',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB39DDB)),
      ),
      home: const SplitItHome(),
    );
  }
}

class SplitItHome extends StatefulWidget {
  const SplitItHome({super.key});

  @override
  State<SplitItHome> createState() => _SplitItHomeState();
}

class _SplitItHomeState extends State<SplitItHome> {
  final billController = TextEditingController();
  final peopleController = TextEditingController();

  int selectedTip = 15;
  double amountPerPerson = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FC),
      appBar: AppBar(
        title: const Text(
          'SplitIt',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFE9DDF8),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Split your bill with ease!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),

              const Text('Bill Amount', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),

              const TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  prefixText: '\$',
                  hintText: 'Enter bill amount',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 25),
              const Text('Tip Percentage', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),

              Row(
                children: [
                  for (final tip in [15, 18, 20])
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              selectedTip = tip;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: selectedTip == tip
                                ? const Color(0xFFE9DDF8)
                                : null,
                          ),
                          child: Text('$tip%'),
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 25),

              const Text('Number of People', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),

              TextField(
                controller: peopleController,

                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter number of people',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 30),
              FilledButton(onPressed: () {}, child: const Text('Calculate')),
              const SizedBox(height: 30),
              const Card(
                color: Color(0xFFE9DDF8),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text('Each Person Pays', style: TextStyle(fontSize: 18)),
                      SizedBox(height: 10),
                      Text(
                        '\$0.00',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
