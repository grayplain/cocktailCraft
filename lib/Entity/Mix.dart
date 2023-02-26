// カクテルを混ぜる方法を定義する
// 混ぜ方は MixType で定義する

class Mix {
  MixType mixType;

  //コンストラクタ
  Mix(this.mixType);

  //ダミーデータを作成
  static Mix dummyMix = Mix(MixType.build);
}

// カクテルの混ぜ方を定義する
// stir: ステア
// shake: シェイク
// build: ビルド

enum MixType {
  stir,
  shake,
  build
}