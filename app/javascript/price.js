function price() {
  const priceInput = document.getElementById("price_input")
  const feeOutput = document.getElementById("add-tax-price")
  const profitOutput = document.getElementById("profit")

  priceInput.addEventListener("input", function() {
    let price = this.value
    let fee = Math.floor(price * 0.1)
    let profit = price - fee
    feeOutput.innerHTML = fee
    profitOutput.innerHTML = profit
  })
}

window.addEventListener("load", price);