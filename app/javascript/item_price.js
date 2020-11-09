function price() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const getPrice = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = Math.floor( getPrice/10 );
    const profit = document.getElementById("profit");
    profit.innerHTML = getPrice - addTaxPrice.innerHTML
  });
}

window.addEventListener('load', price);