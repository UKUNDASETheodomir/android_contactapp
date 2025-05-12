import 'package:flutter/material.dart';
import '../../../data/contact.dart'; // Correct relative import path

class ContactListTile extends StatelessWidget {
  final List<Contact> contacts; // Declare final fields
  final int index;

  // Constructor with required parameters and proper key usage
  const ContactListTile({
    Key? key, // Use nullable Key with null safety
    required this.contacts,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(contacts[index].name), // Assuming Contact has a 'name' field
      subtitle:
          Text(contacts[index].email), // Assuming Contact has an 'email' field
      trailing: IconButton(
        icon: Icon(
          contacts[index].isFavorite ? Icons.star : Icons.star_border,
          color: contacts[index].isFavorite ? Colors.yellow : null,
        ),
        onPressed: () {
          // Toggle favorite status
          contacts[index].isFavorite = !contacts[index].isFavorite;

          // Sort contacts based on favorite status
          contacts.sort((a, b) {
            if (a.isFavorite && !b.isFavorite) {
              return -1;
            } else if (!a.isFavorite && b.isFavorite) {
              return 1;
            }
            return 0;
          });
        },
      ),
    );
  }
}
