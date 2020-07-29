const { remote } = require('electron');
const main = remote.require('./main.js');

const productForm = document.getElementById('productForm');
const productName = document.getElementById('name');
const productProvider = document.getElementById('provider');
const productPrice = document.getElementById('price');
const productAmount = document.getElementById('amount');
const productDescription = document.getElementById('description');
const productsList = document.getElementById('products')

let products = [];
let editingStatus = false;
let editproductId;

productForm.addEventListener('submit', async (e) => {
    e.preventDefault();

    const newProduct = {
        name: productName.value,
        provider: productProvider.value,
        price: productPrice.value,
        amount: productAmount.value,
        description: productDescription.value
    }
    if (!editingStatus) {
        const result = await main.createProduct(newProduct)
        console.log(result);
    } else {
        await main.updateProduct(editproductId, newProduct);
        editingStatus = false;
        editProductId = '';
    }

    productForm.reset();
    productName.focus();

    getProducts();
})


async function deleteProduct(id) {
    const response = confirm('Deseja excluir esse registro?');
    if (response) {
        await main.deleteProduct(id);
        await getProducts();
    }
    return;
}

async function editProduct(id) {
    const product = await main.getProductById(id);
    productName.value = product.name;
    productProvider.value = product.provider;
    productPrice.value = product.price;
    productAmount.value = product.amount;
    productDescription.value = product.description;

    editingStatus = true;
    editproductId = product.id;
}

function renderProducts(products) {
    productsList.innerHTML = '';
    products.forEach(product => {
        productsList.innerHTML += `
            <div class="card card-body my-1 animated fadeInLeft">
                <h4><strong>${product.name}</strong></h4>
                <p>${product.description}</p>
                <h3>R$ ${product.price},00</h3>
                <p>
                    <button class="btn btn-sm btn-outline-warning" onclick="editProduct('${product.id}')"><i class="fa fa-edit"></i> Editar</button>
                    <button class="btn btn-sm btn-outline-danger" onclick="deleteProduct('${product.id}')"><i class="fa fa-trash-o"></i> Excluir</button>
                </p>
                <div class="row">
                    <div class="col">
                        <small><strong>quantidade no estoque:</strong> (${(product.amount) ? product.amount : '0'})</small>
                    </div>
                    <div class="col">
                        <small><strong>Fornecedor:</strong> (${(product.provider) ? product.provider : 'Interno'})</small>
                    </div>
                </div>
            </div>
        `;
    })
}


//list Products
const getProducts = async () => {
    products = await main.getProducts();
    renderProducts(products);
}

async function init() {
    await getProducts();
}

init();


