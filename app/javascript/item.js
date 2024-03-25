function setupPriceCalc() {
// ページ上に「商品の情報を入力」というテキストが含まれているかをチェック
const isItemInputPage = document.body.textContent.includes('商品の情報を入力');

// 商品情報入力ページでなければ早期リターン
if (!isItemInputPage) {
  return;
}


  // 価格入力フィールドにイベントリスナーを設定
  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener('input', () => {
    calculateAndDisplayFees(priceInput.value);
  });

  // ページ読み込み時に現在の価格で手数料と利益を再計算
  if (priceInput.value) {
    calculateAndDisplayFees(priceInput.value);
  }
}

function calculateAndDisplayFees(price) {
  // 入力された価格に基づいて計算
  if (price >= 300 && price <= 9999999) {
    const tax = Math.floor(price * 0.1); // 販売手数料 (10%)→小数点以下切り捨て
    const profit = price - tax; // 販売利益を計算
    document.getElementById('add-tax-price').textContent = tax; // 販売手数料を表示更新
    document.getElementById('profit').textContent = profit; // 販売利益を表示更新
  } else {
    document.getElementById('add-tax-price').textContent = ''; // 範囲外の値の場合はクリア
    document.getElementById('profit').textContent = ''; // 範囲外の値の場合はクリア
  }
}

window.addEventListener("turbo:load", setupPriceCalc);
window.addEventListener("turbo:render", setupPriceCalc);
