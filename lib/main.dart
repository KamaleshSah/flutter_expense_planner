import 'package:expenseplaner/chart.dart';
import 'package:expenseplaner/models/transaction.dart';
import 'package:expenseplaner/new_transaction.dart';
import 'package:expenseplaner/transaction_list.dart';
import 'package:expenseplaner/user_transaction.dart';
import 'package:flutter/material.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
//  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily:'QuickSand',
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   String titleInput;

   String amountInput;


   final List<Transaction> _userTransaction = [

     // Transaction(id: "t1", title: "New Shoes", amount:69.20, date:DateTime.now()),
     // Transaction(id: "t1", title: "Weekely Groceris", amount:88.20, date:DateTime.now())

   ];

   void _addNewTransaction(String txtitle,double txamount){
     final newTx =Transaction(
         title:txtitle,
         amount:txamount,
         date:DateTime.now(),
         id:DateTime.now().toString()
     );
     setState(() {
       _userTransaction.add(newTx);
     });
   }



   List<Transaction> get _recentTransactions {
     return _userTransaction.where((tx) {
       return tx.date.isAfter(
         DateTime.now().subtract(
           Duration(days: 7),
         ),
       );
     }).toList();
   }


   void startNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder:(bCtx){
      return NewTransaction(_addNewTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar:AppBar(
            title:Text("Expense Planer"),
            actions:<Widget>[
                  IconButton(onPressed:()=>startNewTransaction(context), icon:Icon(Icons.add))
            ]

          ),
        body:SingleChildScrollView(
          child: Column(
           //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment:CrossAxisAlignment.stretch,
            children: [
             Chart(_recentTransactions),
           //   UserTransaction(),
              TransactionList(_userTransaction),
            ],
          ),
        ),
       // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child:Icon(Icons.add),
          onPressed: ()=>startNewTransaction(context),),
      );
  }
}




