import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map> getDataAPI() async {
  const apiFinance = "https://api.hgbrasil.com/finance?format=json&key=f6fdaf9a";
  http.Response response = await http.get(Uri.parse(apiFinance));
  return json.decode(response.body);
}

Widget textField(String label, String prefixo, TextEditingController textEditingController){
  return TextField(
    controller: textEditingController,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        border: OutlineInputBorder(),
        prefixText: prefixo
    ),
    style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  final bitcoinController = TextEditingController();

  double dolar = 0.0;
  double euro = 0.0;
  double bitcoin = 0.0;
  double ibovespa = 0.0;
  double cdi = 0.0;
  double selic = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: FutureBuilder<Map>(
        future: getDataAPI(),
        builder: (context, snapshot){  // Função anônima que verifica a conexão e dados vindos da API
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if(snapshot.hasError){
                return Center(
                  child: Text("Erro ao carregar dados da API",
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
              }
              else {
                dolar = snapshot.data!["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data!["results"]["currencies"]["EUR"]["buy"];
                bitcoin = snapshot.data!["results"]["currencies"]["BTC"]["buy"];
                return SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(15, 45, 15, 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.monetization_on_outlined, size: 100, color: Colors.white),
                            Padding(padding: EdgeInsets.all(3)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text("Conversor de ",
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                    Text("moedas ",
                                      style: TextStyle(color: Colors.cyan, fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Text("C214 - Engenharia de Software", style: TextStyle(color: Colors.white)),
                                Text("Inatel", style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://images.vexels.com/media/users/3/143188/isolated/preview/5f44f3160a09b51b4fa4634ecdff62dd-icone-de-dinheiro.png"),
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.all(Radius.circular(25))
                            ),
                            padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
                            child: Column(
                              children: <Widget>[
                                textField("Real", "R\$", realController),
                                Divider(),
                                textField("Dolar", "US\$", dolarController),
                                Divider(),
                                textField("Euro", "€", euroController),
                                Divider(),
                                textField("Bitcoin", "฿", bitcoinController),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                );
              }
          }
        },
      ),
    );
  }
}



