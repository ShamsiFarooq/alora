import 'package:alora/screens/history/components/history_cards.dart';
import 'package:alora/style/constant.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color5,
        title: const Text('History'),
        centerTitle: true,
      ),
      backgroundColor: color1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                height15,
                const HistoryCard(),
                height15,
                const HistoryCard(),
                height15,
                const HistoryCard(),
                height15,
                const HistoryCard(),
                height15,
                const HistoryCard(),
                height15,
                const HistoryCard(),
                height15,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
