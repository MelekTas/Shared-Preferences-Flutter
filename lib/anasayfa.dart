import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int sayac=0;

  @override
  void initState() {
    super.initState();
    //test();
    sayacKontrol();
  }

 Future <void> sayacKontrol() async{
   var sp=await SharedPreferences.getInstance();
   sayac=sp.getInt("sayac")??0;
   setState(() {
    sayac +=1;
     
   });
   sp.setInt("sayac",sayac);
 }





  Future<void> test() async {
    var sp = await SharedPreferences.getInstance(); // yetki aldık.
    //veri kaydı
    sp.setString("Ad", "Melek");
    sp.setDouble("Boy", 1.60);
    sp.setInt("Yas", 21);
    sp.setBool("Bekar", true);

    var arkadasListesi = <String>[];
    arkadasListesi.add("Ali");
    arkadasListesi.add("Ece");

    sp.setStringList("arkadasListesi", arkadasListesi);

    // veri okuma
    String gelenAd = sp.getString("Ad") ?? "İsim yok";
    int gelenYas = sp.getInt("Yas") ?? 0;
    double gelenBoy = sp.getDouble("Boy") ?? 0.0;
    bool gelenBekar = sp.getBool("Bekar") ?? false;
    var gelenArkadasListesi = sp.getStringList("arkadasListesi") ?? null;

    print("Gelen ad: $gelenAd");
    print("Gelen Yas: $gelenYas");
    print("Gelen Boy: $gelenBoy");
    print("Gelen Bekar: $gelenBekar");

    if (gelenArkadasListesi != null) {
      for (var a in arkadasListesi) {
        print("Arkadaş: $a");
      }
    }

    //veri silme
    //sp.remove("Boy");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preferences"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text("Açılış Sayısı : $sayac", style:const  TextStyle(fontSize: 40))],
        ),
      ),
    );
  }
}
