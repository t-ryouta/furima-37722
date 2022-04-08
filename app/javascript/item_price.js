window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput){ return false;}
  priceInput.addEventListener("input", () => {
    const tax = 10;
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * tax /100);
    const valueProfit = document.getElementById("profit");
    valueProfit.innerHTML = Math.floor(inputValue - (inputValue * tax /100));
  })
});