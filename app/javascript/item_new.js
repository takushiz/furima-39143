function price_count(){
  const input_price = document.getElementById("item-price");
  input_price.addEventListener("keyup", () => {
    let tax_price = document.getElementById("add-tax-price");
    let input_profit = document.getElementById("profit");
    let tax = Math.floor(input_price.value * 0.1);
    let sales_profit = input_price.value - tax;
    tax_price.innerHTML = tax;
    input_profit.innerHTML = sales_profit;
  });
  
};

window.addEventListener("load", price_count);

