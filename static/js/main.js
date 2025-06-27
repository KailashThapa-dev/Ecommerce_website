let cart = JSON.parse(localStorage.getItem('cart')) || {};
// Add to cart logic
document.querySelectorAll('.add-to-cart-btn').forEach(button => {
    button.addEventListener('click', (event) => {
        const btn = event.currentTarget;

      
        const id = btn.dataset.id;
        console.log(`Adding product with ID: ${id}`);
        const name = btn.dataset.name;
        const price = parseFloat(btn.dataset.price);
        const image = btn.dataset.image

        if (cart[id]) {
            cart[id].quantity += 1;
        } else {
            cart[id] = { name: name, price: price, quantity: 1, image: image};
        }

        localStorage.setItem('cart', JSON.stringify(cart));
        alert('Product added to cart!');
        updateCartCount();
    });
});

// Cart count updater
function updateCartCount() {
    
    const count = Object.keys(cart).length;
    const countElement = document.getElementById('count-cart');
    if (countElement) {
        countElement.textContent = count;
    }
}

// Run on page load
document.addEventListener('DOMContentLoaded', () => {
    updateCartCount();
});
