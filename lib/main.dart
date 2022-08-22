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

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  _addTransaction(String title, double amount)
  {
     print(title);
     print(amount);
     var newTr = Transaction(
         id: '1',
         title: title,
         amount: amount,
         dateTime: DateTime.now(),
     );
     setState(() {
       transaction.add(newTr);
     });

}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('My Expence'),
        ),
        body:Column(
          children: [
            Card(
              elevation: 5,
              child: Column(
              children:[
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(hintText: 'Title',),
                ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                hintText: 'Amount'
              ),
            ),
            ElevatedButton(onPressed: (){
              print(titleController.text);
              print(amountController.text);
               _addTransaction(titleController.text,double.parse(amountController.text));

                 }, child: Text('Submit')
            )
              ],
            ),
        ),
            Expanded(
                child: ListView.builder(
                itemCount: transaction.length,
                itemBuilder: (BuildContext context, int index){
                  //  return Text('Amount is this ${transaction[index]}

                  return ListTile(
                    leading: Text('${transaction[index].id}'),
                    title:  Text('${transaction[index].title}'),
                    subtitle: Text('${transaction[index].dateTime}'),
                    trailing: Text('${transaction[index].amount}'),

                  );
                }
            ),
            ),
      ],
        ),
    );
  }
}