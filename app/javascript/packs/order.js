function updateTotalCost({ target: { value: quantity } }) {
  const totalElement = document.getElementById("total-cost-line-item")
  const costPerTicket = totalElement.dataset.ticketCost
  const totalCost = quantity * costPerTicket
  const totalCostDollars = (totalCost / 100).toLocaleString("en-US", {style:"currency", currency:"USD"})

  totalElement.innerText = totalCostDollars
}

const quantitySelector = document.getElementById("ticket-quantity-selector")
quantitySelector.addEventListener("change", updateTotalCost)

updateTotalCost({ target: quantitySelector })


