//TODO: アルコール度数の分布がこれでいいか検証する必要がある。
// 極端に少なかったり多かったりする場合は、分布を変える必要がある。

/* アルコール度数を表すクラス
  6段階の enum で表現する
  0: 0%
  1: 1~10%
  2: 11-18%
  3: 20-25%
  4: 26-30%
  5: 31以上%
 */

//それぞれの enum に 0 ~ 6 の値を設定する
enum AbvRate {
  none,
  veryLow,
  low,
  intermediate,
  high,
  veryHigh
}

// AbvRate の値から、アルコールの強さを表す文字列を返却する
String getAbvRateString(AbvRate abvRate) {
  switch (abvRate) {
    case AbvRate.none:
      return "ノンアルコール";
    case AbvRate.veryLow:
      return "弱め";
    case AbvRate.low:
      return "普通";
    case AbvRate.intermediate:
      return "やや強い";
    case AbvRate.high:
      return "強い";
    case AbvRate.veryHigh:
      return "非常に強い";
  }
}

// 数値を引数にして、AbvRate を返却する
// 閾値は、6段階の enum で表現するで定義した値を利用する
AbvRate getAbvRate(int abv) {
  if (abv == 0) {
    return AbvRate.none;
  } else if (abv <= 10) {
    return AbvRate.veryLow;
  } else if (abv <= 18) {
    return AbvRate.low;
  } else if (abv <= 25) {
    return AbvRate.intermediate;
  } else if (abv <= 30) {
    return AbvRate.high;
  } else {
    return AbvRate.veryHigh;
  }
}