import 'package:flutter/material.dart';
import 'package:my_expence/model/transaction.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: 'flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue
    ),
   home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> transaction = [
    Transaction(
        id: 'aa',
        title: 'books',
        amount: 200,
        dateTime:DateTime.now()
    )
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('My Expence'),
        ),
        body:ListView.builder(
            itemCount: transaction.length,
            itemBuilder: (BuildContext context, int index){
              //  return Text('Amount is this ${transaction[index]}
              return Column(
                children: [
                  Text("${transaction[index].id}"),
                  Text("${transaction[index].title}"),
                  Text("${transaction[index].amount}"),
                  Text("${transaction[index].dateTime}")
                ],
              );
            }
        )
    );
  }
}