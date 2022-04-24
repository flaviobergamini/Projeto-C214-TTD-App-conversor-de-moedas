import 'package:conversor_moedas/Controller/Conversor.dart';
import 'package:test/test.dart';


void main(){
  Conversor conversor = Conversor();

  //TESTES EM CASOS ÓTIMOS

  test('Valor do Dolar deve ser 0.5, ', (){
    expect(conversor.realChangedDolar(2.00, 4.00), 0.50);
  });

  test('Valor do Euro deve ser 0.5, ', (){
    expect(conversor.realChangedEuro(2.00, 4.00), 0.50);
  });

  test('Valor do Bitcoin deve ser 0.5, ', (){
    expect(conversor.realChangedBitcoin(2.00, 4.00), 0.50);
  });

  test('Valor do Real deve ser 8.00, ', (){
    expect(conversor.dolarChangedReal(2.00, 4.00), 8.00);
  });

  test('Valor do Euro deve ser 1.75, ', (){
    expect(conversor.dolarChangedEuro(3.50, 2.00, 4.00), 1.75);
  });

  test('Valor do Bitcoim deve ser 1.75, ', (){
    expect(conversor.dolarChangedBitcoin(3.50, 2.00, 4.00), 1.75);
  });

  test('Valor do Real deve ser 8.00, ', (){
    expect(conversor.euroChangedReal(2.00, 4.00), 8.00);
  });

  test('Valor do Dolar deve ser 1.75, ', (){
    expect(conversor.euroChangedDolar(3.50, 2.00, 4.00), 1.75);
  });

  test('Valor do Bitcoin deve ser 1.75, ', (){
    expect(conversor.euroChangedBitcoin(3.50, 2.00, 4.00), 1.75);
  });

  test('Valor do Real deve ser 8.00, ', (){
    expect(conversor.bitChangedReal(2.00, 4.00), 8.00);
  });

  test('Valor do Dolar deve ser 1.75, ', (){
    expect(conversor.bitChangedDolar(3.50, 2.00, 4.00), 1.75);
  });

  test('Valor do Euro deve ser 1.75, ', (){
    expect(conversor.bitChangedEuro(3.50, 2.00, 4.00), 1.75);
  });


  // TESTES EM CASOS NÃO ÓTIMO

  test('Erro, valor de Real -> Dolar deve ser -1', (){
    expect(conversor.realChangedDolar(2.00, 0), -1);
  });

  test('Erro, valor de Real -> Euro deve ser -1', (){
    expect(conversor.realChangedEuro(2.00, 0), -1);
  });

  test('Erro, valor de Real -> Bitcoin deve ser -1', (){
    expect(conversor.realChangedBitcoin(2.00, 0), -1);
  });

  test('Erro, valor de Dolar -> Real deve ser -1', (){
    expect(conversor.dolarChangedReal(3.50, 0), -1);
  });

  test('Erro, valor de Dolar -> Euro deve ser -1', (){
    expect(conversor.dolarChangedEuro(3.50, 4.30, 0), -1);
  });

  test('Erro, valor de Dolar -> Bitcoin deve ser -1', (){
    expect(conversor.dolarChangedBitcoin(3.50, 4.30, 0), -1);
  });

  test('Erro, valor de Euro -> Real deve ser -1', (){
    expect(conversor.euroChangedReal(3.50, 0), -1);
  });

  test('Erro, valor de Euro -> Dolar deve ser -1', (){
    expect(conversor.euroChangedDolar(3.50, 3.76, 0), -1);
  });

  test('Erro, valor de Euro -> Bitcoin deve ser -1', (){
    expect(conversor.euroChangedBitcoin(3.50, 3.76, 0), -1);
  });

  test('Erro, valor de Bitcoin -> Real deve ser -1', (){
    expect(conversor.bitChangedReal(3.50, 0), -1);
  });

  test('Erro, valor de Bitcoin -> Dolar deve ser -1', (){
    expect(conversor.bitChangedDolar(3.50, 5.73, 0), -1);
  });

  test('Erro, valor de Bitcoin -> Euro deve ser -1', (){
    expect(conversor.bitChangedEuro(3.50, 5.73, 0), -1);
  });
}