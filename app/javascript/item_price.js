window.addEventListener('load', function(){
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
 const salesProfit = document.getElementById("profit");
  const value_result = inputValue * 0.1
  salesProfit.innerHTML = Math.floor(inputValue - value_result);
})
})