const saveOrder = async ({ userId, payment_method, delivery_opt, shipping, items, note }) => {
    let item_count = 0;
    let total = 0;

    items.forEach(item => {
        item_count += item.quantity;
        total += item.price;
        items.push({ product: item.id, quantity: item.quantity, unit_price: item.price });
    });

    const order = await Order.create({
        user: userId,
        item_count,
        total,
        payment_method,
        delivery: delivery_opt,
        delivery_fee: shipping,
        note
    });

    await Promise.all(items.map(item => OrderItems.create({ ...item, order: order.id })));
    return order;
}


module.exports = {
    saveOrder
}