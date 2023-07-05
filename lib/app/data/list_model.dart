import 'package:flutter/material.dart';

abstract class ListSelect {
  bool selected = false;
}

class RestorableListSelections extends RestorableProperty<Set<int>> {
  Set<int> _dataSelections = {};

  bool isSelected(int index) => _dataSelections.contains(index);

  void setDessertSelections(List<ListSelect> list) {
    final updatedSet = <int>{};
    for (var i = 0; i < list.length; i += 1) {
      var data = list[i];
      if (data.selected) {
        updatedSet.add(i);
      }
    }
    _dataSelections = updatedSet;
    notifyListeners();
  }

  @override
  Set<int> createDefaultValue() => _dataSelections;

  @override
  Set<int> fromPrimitives(Object? data) {
    final selectedItemIndices = data as List<dynamic>;
    _dataSelections = {
      ...selectedItemIndices.map<int>((dynamic id) => id as int),
    };
    return _dataSelections;
  }

  @override
  void initWithValue(Set<int> value) {
    _dataSelections = value;
  }

  @override
  Object toPrimitives() => _dataSelections.toList();
}
