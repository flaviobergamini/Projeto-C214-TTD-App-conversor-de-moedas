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

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double dolar = 0.0;
  double euro = 0.0;
  double bitcoin = 0.0;
  double ibovespa = 0.0;
  double cdi = 0.0;
  double selic = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  padding: EdgeInsets.fromLTRB(10, 45, 10, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.monetization_on_outlined, size: 100, color: Colors.blueAccent),
                      Padding(padding: EdgeInsets.all(5)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Conversor de ",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Text("moedas ",
                            style: TextStyle(color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Real",
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          prefixText: "R\$"
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      TextField(
                        decoration: InputDecoration(
                            labelText: "Dolar",
                            labelStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(),
                            prefixText: "US\$"
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      TextField(
                        decoration: InputDecoration(
                            labelText: "Euro",
                            labelStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(),
                            prefixText: "€"
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      TextField(
                        decoration: InputDecoration(
                            labelText: "Bitcoin",
                            labelStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(),
                            prefixText: "฿"
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      )
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


