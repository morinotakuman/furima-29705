function price() {
  const fillInPrice = document.getElementById("item-price")
  const taxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  fillInPrice.addEventListener('input', function(){
    taxPrice.innerHTML = Math.floor(fillInPrice.value * 0.1)
    profit.innerHTML = Math.floor(fillInPrice.value * 0.9)
  })
}
window.addEventListener("load", price);