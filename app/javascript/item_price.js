
function item_price() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = parseFloat(priceInput.value);

    // Check if inputValue is a valid number
    if (!isNaN(inputValue)) {
      const taxAmount = Math.floor(inputValue * 0.1);
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = taxAmount;

      const addProfit = document.getElementById("profit");
      addProfit.innerHTML = inputValue - taxAmount;
    } else {
      // If inputValue is not a valid number, set tax and profit to 0
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = "0";

      const addProfit = document.getElementById("profit");
      addProfit.innerHTML = "0";
    }
  });
}

window.addEventListener('turbo:load', item_price);




