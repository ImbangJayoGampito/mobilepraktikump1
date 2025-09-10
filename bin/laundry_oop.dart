import 'dart:io';

class LaundryPackage {
  String selectionKey;
  String name;
  int kgAmount = 0;
  int pricePerKg;

  // Constructor
  LaundryPackage(this.selectionKey, this.name, this.pricePerKg);
  void printOption() {
    print('$selectionKey -> $name dengan harga $pricePerKg/kg');
  }

  void increaseKg(int kg) {
    if (kg < 0) {
      print("Harus memberikan input positif!");
      return;
    }
    this.kgAmount += kg;
  }

  void displayReceipt() {
    int total = this.calculateCost();
    if (total == 0) {
      return;
    }
    print('$name : $kgAmount kg x $pricePerKg = $total');
  }

  int calculateCost() {
    return pricePerKg * kgAmount;
  }
}

void printReceipt(List<LaundryPackage> packages) {
  int total = packages.fold(0, (sum, pkg) => sum + pkg.calculateCost());

  for (var package in packages) {
    package.printOption();
  }
  if (total == 0) {
    print("Anda tidak membeli apa-apa");
  }
  double diskon = 0;
  if (total > 100000) {
    diskon = 0.10;
  } else if (total >= 50000) {
    diskon = 0.05;
  }
  double totalCost = total - (total * diskon);
  print('Total Sebelum Diskon: $total');
  print('Diskon: ${diskon * 100}%');
  print('Total yang Harus Dibayar: ${totalCost.toInt()}');
}

void main(List<String> arguments) {
  List<LaundryPackage> packages = [
    LaundryPackage('1', 'Cuci & Setrika', 6000),
    LaundryPackage('2', 'Cuci Saja', 4000),
    LaundryPackage('3', 'Setrika Saja', 3000),
  ];
  bool isRunning = true;
  while (isRunning) {
    print('\n=== Selamat Datang di Mini Laundry ===');
    print('Pilihan Menu:');
    for (var package in packages) {
      package.printOption();
    }
    print("4. Keluar");
    stdout.write('Pilih menu (1-4): ');
    String? option = stdin.readLineSync();
    if (option == "4") {
      printReceipt(packages);
      isRunning = true;
      print('\n--- Struk Akhir ---');
      printReceipt(packages);
      print("Terima kasih atas berbelanja di laundry kami");
      break;
    }
    var selected = packages.firstWhere(
      (pkg) => pkg.selectionKey == option,
      orElse: () {
        print("Pilihan invalid!");
        return LaundryPackage('', 'Invalid', 0);
      },
    );
    if (selected.selectionKey == '') {
      continue;
    }
    stdout.write('Masukkan jumlah kg: ');
    try {
      int kg = int.parse(stdin.readLineSync()!);
      selected.increaseKg(kg);
    } catch (e) {
      print('Input tidak valid. Harus berupa angka!');
    }
    print('\n--- Struk Sementara ---');
    printReceipt(packages);
  }
}
