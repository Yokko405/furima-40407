window.addEventListener('turbo:load', function(){
  // 価格入力フィールドにイベントリスナーを設定
  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener('input', () => {
    const price = priceInput.value; // 入力された価格を取得
    if (price >= 300 && price <= 9999999) {
      const tax = Math.floor(price * 0.1); // 販売手数料 (10%)→小数点以下切り捨て
      const profit = price - tax; // 販売利益を計算
      document.getElementById('add-tax-price').textContent = tax; // 販売手数料を表示更新
      document.getElementById('profit').textContent = profit; // 販売利益を表示更新
    } else {
      document.getElementById('add-tax-price').textContent = ''; // 範囲外の値の場合はクリア
      document.getElementById('profit').textContent = ''; // 範囲外の値の場合はクリア
    }
  });
});