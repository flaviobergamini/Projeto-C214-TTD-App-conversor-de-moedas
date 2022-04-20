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

  double euroChangedReal(double euro, double v){
    double converted = euro * v;
    return converted;
  }

  double euroChangedDolar(double euro, double v, double dolar){
    double converted = euro * v/dolar;
    return converted;
  }

  double euroChangedBitcoin(double euro, double v, double bitcoin){
    double converted = euro * v/bitcoin;
    return converted;
  }

  double bitChangedReal(double bitcoin, double v){
    double converted = bitcoin * v;
    return converted;
  }

  double bitChangedDolar(double bitcoin, double v, double dolar){
    double converted = bitcoin * v/dolar;
    return converted;
  }

  double bitChangedEuro(double bitcoin, double v, double euro){
    double converted = bitcoin * v/euro;
    return converted;
  }

}