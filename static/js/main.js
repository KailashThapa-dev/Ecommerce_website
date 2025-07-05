let cart = JSON.parse(localStorage.getItem('cart')) || {};
// Add to cart logic
document.addEventListener('click', function(event) {
    // Check if the clicked element has the class 'add-to-cart-btn'
    if (event.target.classList.contains('add-to-cart-btn')) {
        const btn = event.target;
        const id = btn.dataset.id;
        const name = btn.dataset.name;
        const price = parseFloat(btn.dataset.price);
        const image = btn.dataset.image;

        if (cart[id]) {
            cart[id].quantity += 1;
        } else {
            cart[id] = { name: name, price: price, quantity: 1, image: image };
        }

        localStorage.setItem('cart', JSON.stringify(cart));
        showMessageBox("Product is added to cart!");
        updateCartCount();
    }
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
// Message box function to show message when product is added
function showMessageBox(message, duration = 2000) {
    // Remove any existing message box
    const existingBox = document.getElementById('cart-message-box');
    if (existingBox) {
        existingBox.remove();
    }

    // Create message box
    const box = document.createElement('div');
    box.id = 'cart-message-box';
    box.textContent = message;
    box.style.position = 'fixed';
    box.style.top = '24px';
    box.style.right = '24px';
    box.style.background = '#323232';
    box.style.color = '#fff';
    box.style.padding = '14px 28px';
    box.style.borderRadius = '6px';
    box.style.boxShadow = '0 2px 12px rgba(0,0,0,0.15)';
    box.style.zIndex = '9999';
    box.style.fontSize = '16px';
    box.style.opacity = '0.97';
    box.style.transition = 'opacity 0.3s';

    document.body.appendChild(box);

    setTimeout(() => {
        box.style.opacity = '0';
        setTimeout(() => {
            if (box.parentNode) {
                box.parentNode.removeChild(box);
            }
        }, 300);
    }, duration);
}


