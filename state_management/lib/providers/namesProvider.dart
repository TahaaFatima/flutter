import 'package:flutter/cupertino.dart';

class NamesProvider with ChangeNotifier {
  List<String> name = ['Ali', 'Zohair', 'Sakina', 'Anum', 'Haider', 'Zehra'];

  deleteItem(int index) {
    name.removeAt(index);
    notifyListeners();
  }

  editItem(int index, String newName) {
    name[index] = newName;
    notifyListeners();
  }
}
