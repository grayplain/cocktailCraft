//TODO: アルコール度数の分布がこれでいいか検証する必要がある。
// 極端に少なかったり多かったりする場合は、分布を変える必要がある。

/* アルコール度数を表すクラス
  7段階の enum で表現する
  0: 0%
  1: 1~5%
  2: 6-10%
  3: 11-19%
  4: 20-29%
  5: 30-39%
  6: 40% 以上
 */
enum AlbRate {
  none,
  veryLow,
  low,
  intermediate,
  high,
  veryHigh,
  criticallyHigh
}