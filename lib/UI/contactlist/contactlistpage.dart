import 'package:flutter/material.dart';
import '../../data/contact.dart'; 
import 'package:faker/faker.dart' as faker;

class ContactsListPage extends StatefulWidget {
  const ContactsListPage({super.key});

  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  late final List<Contact> _contacts;

  @override
  void initState() {
    super.initState();
    _contacts = List.generate(100, (index) {
      return Contact(
        name: '${faker.Faker().person.firstName()} ${faker.Faker().person.lastName()}',
        email: faker.Faker().internet.freeEmail(),
        phoneNumber: faker.Faker().phoneNumber.us(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),

      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (context, index) {

         return ListTile(
            title: contactsTile(contacts: _contacts),
            subtitle: Text(_contacts[index].email),
            trailing: IconButton(
              icon: Icon(
                _contacts[index].isFavorite ? Icons.star : Icons.star_border,
                color: _contacts[index].isFavorite ? Colors.yellow : null,
              ),
              onPressed: () {
                setState(() {
                  _contacts[index].isFavorite = !_contacts[index].isFavorite;
                  _contacts.sort((a, b) {
                    if (a.isFavorite && !b.isFavorite) {
                      return -1;
                    } else if (!a.isFavorite && b.isFavorite) {
                      return 1;
                    }
                    return 0;
                  });
                });
              },
          ),
            );
          },
        ),
      );
  }
}

