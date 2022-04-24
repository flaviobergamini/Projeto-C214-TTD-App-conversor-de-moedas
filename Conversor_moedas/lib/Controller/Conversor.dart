class Conversor{

  double realChangedDolar(double real,double dolar){
    if(dolar > 0){
      double converted=(real/dolar);
      return converted;
    }
    return -1;
  }

  double realChangedEuro(double real,double euro){
    if(euro > 0){
      double converted=(real/euro);
      return converted;
    }
    return -1;
  }

  double realChangedBitcoin(double real,double bitcoin){
    if(bitcoin > 0){
      double converted=(real/bitcoin);
      return converted;
    }
    return -1;
  }

  double dolarChangedReal(double dolar, double v){
    if(v > 0){
      double converted = dolar * v;
      return converted;
    }
    return -1;
  }

  double dolarChangedEuro(double dolar, double v, double euro){
    if(euro > 0){
      double converted = dolar * v/euro;
      return converted;
    }
    return -1;
  }

  double dolarChangedBitcoin(double dolar, double v, double bitcoin){
    if(bitcoin > 0){
      double converted = dolar * v/bitcoin;
      return converted;
    }
    return -1;
  }

  double euroChangedReal(double euro, double v){
    if(v > 0){
      double converted = euro * v;
      return converted;
    }
    return -1;
  }

  double euroChangedDolar(double euro, double v, double dolar){
    if(dolar > 0){
      double converted = euro * v/dolar;
      return converted;
    }
    return -1;
  }

  double euroChangedBitcoin(double euro, double v, double bitcoin){
    if(bitcoin > 0){
      double converted = euro * v/bitcoin;
      return converted;
    }
    return -1;
  }

  double bitChangedReal(double bitcoin, double v){
    if(v > 0){
      double converted = bitcoin * v;
      return converted;
    }
    return -1;
  }

  double bitChangedDolar(double bitcoin, double v, double dolar){
    if(dolar > 0){
      double converted = bitcoin * v/dolar;
      return converted;
    }
    return -1;
  }

  double bitChangedEuro(double bitcoin, double v, double euro){
    if(euro > 0){
      double converted = bitcoin * v/euro;
      return converted;
    }
    return -1;
  }

}