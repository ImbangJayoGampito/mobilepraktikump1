import 'dart:io';

void main(List<String> arguments) {
  const int hargaCuciSetrika = 6000;
  const int hargaCuci = 4000;
  const int hargaSetrika = 3000;
  int kgCuciSetrika = 0;
  int kgCuci = 0;
  int kgSetrika = 0;
  bool isRunning = true;
  while (isRunning) {
    print('\n=== Selamat Datang di Mini Laundry ===');
    print('Pilihan Menu:');
    print('1. Cuci & Setrika dengan harga $hargaCuciSetrika');
    print('2. Cuci Saja dengan harga $hargaCuci');
    print('3. Setrika Saja dengan harga $hargaSetrika');
    print('4. Keluar');
    stdout.write('Pilih menu (1-4): ');
    String? pilihan = stdin.readLineSync();
    switch (pilihan) {
      case '1':
        stdout.write('Masukkan jumlah kg: ');
        kgCuciSetrika += int.parse(stdin.readLineSync()!);

        break;
      case '2':
        stdout.write('Masukkan jumlah kg: ');
        kgCuci += int.parse(stdin.readLineSync()!);

        break;
      case '3':
        stdout.write('Masukkan jumlah kg: ');
        kgSetrika += int.parse(stdin.readLineSync()!);

        break;
      case '4':
        print('Terima kasih telah menggunakan layanan kami!');
        isRunning = false;
        continue;
      default:
        print('Pilihan tidak valid.');
        continue;
    }
    int total =
        kgCuciSetrika * hargaCuciSetrika +
        kgCuci * hargaCuci +
        kgSetrika * hargaSetrika;

    double diskon = 0;
    if (total > 100000) {
      diskon = 0.10;
    } else if (total >= 50000) {
      diskon = 0.05;
    }
    double totalCost = total - (total * diskon);
    print('\n--- Struk Sementara ---');
    print(
      'Cuci & Setrika : $kgCuciSetrika kg x $hargaCuciSetrika = ${kgCuciSetrika * hargaCuciSetrika}',
    );
    print('Cuci Saja      : $kgCuci kg x $hargaCuci = ${kgCuci * hargaCuci}');
    print(
      'Setrika Saja   : $kgSetrika kg x $hargaSetrika = ${kgSetrika * hargaSetrika}',
    );
    print('Total Sebelum Diskon: $total');
    print('Diskon: ${diskon * 100}%');
    print('Total yang Harus Dibayar: ${totalCost.toInt()}');
  }
}
