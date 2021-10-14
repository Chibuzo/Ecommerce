const TAX = 0;

function renderCart(items) {
    const $cart = document.querySelector(".cart-tb")
    const $total = document.querySelector(".total")

    $cart.innerHTML = items.map((item) => `
      <tr>
        <td class="cart-table__column cart-table__column--image"><a href="#"><img src="/product_photos/thumbnail/${item.thumb}" /></a></td>
        <td>${item.name}</td>
        <td class="text-right">₦${formateCurrency(item.price)}</td>
        <!--<td style="width: 60px;"> 
          <button type="button" class="btn btn-block btn-sm btn-outline-primary"
            onClick="cartLS.quantity(${item.id},1)">+</button>
        </td>
        <td style="width: 60px;"> 
          <button type="button" class="btn btn-block btn-sm btn-outline-primary"
            onClick="cartLS.quantity(${item.id},-1)">-</button>
        </td>-->
        <td class="cart-table__column cart-table__column--quantity" data-title="Quantity">
            <div class="input-number"><input class="form-control input-number__input"
                    type="number" min="1" value="${item.quantity}">
                <div class="input-number__add" onClick="cartLS.quantity(${item.id},1)"></div>
                <div class="input-number__sub" onClick="cartLS.quantity(${item.id},-1)"></div>
            </div>
        </td>
        <td class="cart-table__column cart-table__column--price">₦${formateCurrency(item.quantity * item.price)}</td>
        <td class="cart-table__column cart-table__column--remove" onClick="cartLS.remove(${item.id})">
            <button type="button" class="btn btn-light btn-sm btn-svg-icon">
                <svg width="12px" height="12px">
                    <use xlink:href="images/sprite.svg#cross-12"></use>
                </svg>
            </button>
        </td>
      </tr>`).join("")

    $total.innerHTML = "₦" + formateCurrency(cartLS.total());
    updateOrderSummary();
}

function listOrderItems(items) {
    const $orderlist = document.querySelector(".checkout__totals-products");

    $orderlist.innerHTML = items.map(item => `
        <tr>
            <td>${item.name} × ${item.quantity}</td>
            <td>₦${formateCurrency(item.quantity * item.price)}</td>
        </tr>
    `).join("");
    updateOrderSummary();
}

function addItemToCart(id, name, price, thumb, merchant) {
    cartLS.add({ id, name, price, thumb, merchant });
    updateCartIndicator();
}


function updateCartIndicator() {
    const cartCount = cartLS.list().length;
    document.querySelectorAll('.indicator__value').forEach(el => {
        el.innerHTML = cartCount;
    });
}

function updateCart() {
    cartLS.onChange(renderCart);
    updateOrderSummary();
}

function updateOrderSummary() {
    const orderTotal = cartLS.total();
    document.querySelector("#sub-total").innerHTML = "₦" + formateCurrency(orderTotal);
    document.querySelector("#total").innerHTML = "₦" + formateCurrency((TAX && (TAX / 100) * orderTotal) || orderTotal);
}

function formateCurrency(input) {
    return parseInt(input).toLocaleString('en-US', { style: 'decimal' });
}

updateCartIndicator();