import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

void main( ) {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primarySwatch: Colors.teal)
      ,home:const HomePage(),
      routes: {
        '/new-contact':(context) => const newContactView(),
      },
    );
  }
}

class Contact{
  final String id;
  final String name;

    Contact({
  required this.name}):id = const Uuid().v4();

}

class ContactBook extends ValueNotifier<List<Contact>>{
  ContactBook._sharedInstance():super([]);
  static final ContactBook _shared =ContactBook._sharedInstance();
  factory ContactBook()=> _shared;
   
  int get length =>  value.length;

  void add({required Contact contact}){
    value.add(contact);
    notifyListeners();
  }
  void remove({required Contact contact}){
    if(value.contains(contact)){
      value.remove(contact);
      notifyListeners();
    }
   
  }

  Contact? contact({required int atIndex}){
   return value.length > atIndex ? value[atIndex]:null;
  }
}
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contactBook =ContactBook();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page')),
        body:ValueListenableBuilder(
          valueListenable: ContactBook(),
          builder: (context, value, child) {
            final contacts = value as List<Contact>;
            return ListView.builder(
              itemCount: contacts.length,
          itemBuilder: (context,index){
            final contact= contacts[index]; 
            return Dismissible(
              onDismissed: (direction) {
                ContactBook().remove(contact:contact);
              },
              key: ValueKey(contact.id),
              child: Material(
                color: Colors.white,
                elevation: 6.0,
                child: ListTile(
                      title: Text(contact.name),
                ),
              ),
            );
          });
          },
             
        ),
        floatingActionButton: FloatingActionButton(onPressed: () async{
await Navigator.of(context).pushNamed('/new-contact');
        },child: Icon(Icons.add),),
    );
  }
}
 
 class newContactView extends StatefulWidget {
  const newContactView({Key? key}) : super(key: key);

  @override
  State<newContactView> createState() => _newContactView();
}

class _newContactView extends State<newContactView> {
  late final TextEditingController _controller;
  @override
  void initState() {
    _controller =TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
     _controller .dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Contact')),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _controller,decoration: const InputDecoration(
              hintText: 'Enter new contact name'
            ),
          ),
        ),TextButton(onPressed: ( ){
          final contact = Contact(name: _controller.text);
          ContactBook().add(contact: contact);
          Navigator.of(context).pop(); 
        }, child: const Text('Add contact'))
      ],),
    );
  }
}