function input (){  
  const price_input = document.getElementById("item-price");
  price_input.addEventListener("keyup", () => {
  const price = price_input.value ;
  const fee = Math.floor(price * 0.1 );
  const profit = (price - fee);
  document.getElementById("add-tax-price").innerHTML = (fee);
  document.getElementById("profit").innerHTML = (profit);
});
}
window.addEventListener('load', input);