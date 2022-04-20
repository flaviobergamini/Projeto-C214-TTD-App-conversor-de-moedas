class Conversor{

  double realChangedDolar(double real,double dolar){
    double converted=(real/dolar);
    return converted;
  }

  double realChangedEuro(double real,double euro){
    double converted=(real/euro);
    return converted;
  }

  double realChangedBitcoin(double real,double bitcoin){
    double converted=(real/bitcoin);
    return converted;
  }

  double dolarChangedReal(double dolar, double v){
    double converted = dolar * v;
    return converted;
  }

  double dolarChangedEuro(double dolar, double v, double euro){
    double converted = dolar * v/euro;
    return converted;
  }

  double dolarChangedBitcoin(double dolar, double v, double bitcoin){
    double converted = dolar * v/bitcoin;
    return converted;
  }
}