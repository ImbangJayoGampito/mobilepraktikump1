void main(List<String> arguments) {
  print("Hasil manipulasi list:");
  List<String> fruits = ['Apel', 'Alpukat', 'Nanas', 'Mangga', 'Pisang'];
  print(fruits.toString());

  // manipulasi list
  fruits.add('Jeruk');
  print(fruits.toString());

  fruits.remove('Alpukat');
  print(fruits.toString());

  fruits.sort();
  print(fruits.toString());

  fruits[0] = 'Semangka';
  print(fruits.toString());

  fruits.shuffle();
  print(fruits.toString());

  print(fruits.first);
  print(fruits.last);
  print(fruits.contains('Mangga'));
  print(fruits.indexOf('Pisang'));
  print(fruits.isEmpty);
  print(fruits.isNotEmpty);
  Set<String> animals = {'Kucing', 'Anjing', 'kelinci', 'Burung'};
  print(animals.toString());

  // manipulasi set
  print("Hasil manipulasi set");
  animals.add('Ikan');
  print(animals.toString());

  animals.remove('Kelinci');
  print(animals.toString());

  print(animals.length);
  print(animals.contains('Anjing'));
  print(animals.isEmpty);
  print(animals.isNotEmpty);
  print("Hasil manipulasi map:");
  Map<String, String> productPrices = {
    'Laptop': '10.000.000',
    'Mouse': '200.000',
    'Keyboard': '500.000',
    'Monitor': '2.000.000',
  };
  print(productPrices.toString());

  // manipulasi map
  productPrices['Printer'] = '1.500.000';
  print(productPrices.toString());

  productPrices.remove('Mouse');
  print(productPrices.toString());

  productPrices['Laptop'] = '9.500.000';
  print(productPrices['Laptop']);

  print(productPrices.length);
  print(productPrices.containsKey('Keyboard'));
  print(productPrices.containsValue('2.000.000'));
  print(productPrices.keys);
  print(productPrices.values);
  print(productPrices.isNotEmpty);
  print("Hasil perulangan:");
  // Cara Pertama: for-in & forEach
  for (var fruit in fruits) {
    print(fruit);
  }

  for (var animal in animals) {
    print(animal);
  }

  productPrices.forEach((key, value) {
    print('$key: $value');
  });

  // Cara Kedua: indexed access
  print("Hasil cetak")
  for (var i = 0; i < fruits.length; i++) {
    print(fruits[i]);
  }

  for (var i = 0; i < animals.length; i++) {
    print(animals.elementAt(i));
  }

  for (var i = 0; i < productPrices.length; i++) {
    print(
      '${productPrices.keys.elementAt(i)}: ${productPrices.values.elementAt(i)}',
    );
  }
}
