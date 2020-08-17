if (/items.*edit|new/.test(window.location.pathname)) {
  window.addEventListener("load", function() {
    const priceInput = document.getElementById("price_input")
    const feeOutput = document.getElementById("add-tax-price")
    const profitOutput = document.getElementById("profit")

    if (priceInput.value) {
      let price = priceInput.value
      let fee = Math.floor(price * 0.1)
      let profit = price - fee
      feeOutput.innerHTML = fee
      profitOutput.innerHTML = profit
    }

    priceInput.addEventListener("input", function() {
      let price = this.value
      let fee = Math.floor(price * 0.1)
      let profit = price - fee
      feeOutput.innerHTML = fee
      profitOutput.innerHTML = profit
    })
  })
}