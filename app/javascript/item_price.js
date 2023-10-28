
function item_price(){
  const priceInput = document.getElementById("item-price"); 
  priceInput.addEventListener("input", () => {
    const inputValue = parseFloat(priceInput.value); 
    const taxAmount = Math.floor(inputValue*0.1);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = taxAmount;
    const addProfit =document.getElementById("profit");
    addProfit.innerHTML =  inputValue + taxAmount; 
  })
};
window.addEventListener('turbo:load', item_price); 