 import 'package:flutter/material.dart';
 import '';
 class contactsTile extends StatelessWidget {
  const contactsTile({
    super.key,
    required List<Contact> contacts,
  }) : _contacts = contacts;

  final List<Contact> _contacts;

  @override
  Widget build(BuildContext context) {
    return Text(_contacts[index].name);
  }
}
