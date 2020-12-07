function input (){  
  const price_input = document.getElementById("item-price");
  price_input.addEventListener("keyup", () => {
  var price = price_input.value ;
  var fee = Math.floor(price * 0.1 );
  var profit = (price - fee);
  document.getElementById("add-tax-price").innerHTML = (fee);
  document.getElementById("profit").innerHTML = (profit);
});
}
window.addEventListener('load', input);