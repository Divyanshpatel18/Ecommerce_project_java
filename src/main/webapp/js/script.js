var itemQuantity1 = 1;
var itemPrice = 0;

//creating a fuction to add item to the cart

function add_to_cart(pid, pname, price, desc, discount, photo, category)
{
    var cart = localStorage.getItem("cart");
    if (cart === null) {

        //no cart yet
        //creating empty products array
        let products = [];
        
        //all the corresponding values are set as parameter passed from shopcart.jsp
        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price, productDesc: desc, productDiscount: discount, productPic: photo, productCategory: category};
        products.push(product);
        
        //converting the products array into the string and adding it to localstorage
        localStorage.setItem("cart", JSON.stringify(products));
        
//        console.log("product is added for the first time");
        showToast("Item is added to cart");
    } else {

            // cart is already present ,var cart = localStorage.getItem("cart"); will return stirng
            //converting into javascript object
            let pcart = JSON.parse(cart);

            //callback function to find if product is already present
            //                    id stored in productId in array    passed Id as arguement
            let oldProduct = pcart.find((item) => item.productId === pid);

            // if old product present i.e. true
            if (oldProduct) {
                    //only we have to increase the quantity
                    oldProduct.productQuantity = oldProduct.productQuantity + 1;

                    //pushing the increased quantity into the product which is same as oldproduct
                    pcart.map((item) => {
                        if (item.productId === oldProduct.productId) {
                            item.productQuantity = oldProduct.productQuantity;
                            var x = item.productQuantity * item.productPrice;

                        }
        //                 $(".myprice-indivi").html(item.productQuantity * item.productPrice);  
                    });
                    localStorage.setItem("cart", JSON.stringify(pcart));
        //            console.log("product Quantity is increased");

                showToast(oldProduct.productName + " product Quantity is increased, Quantity=" + oldProduct.productQuantity);
            } else {
                    //we have to add the product
                    let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price, productDesc: desc, productDiscount: discount, productPic: photo, productCategory: category};
                    pcart.push(product);
                    localStorage.setItem("cart", JSON.stringify(pcart));
        //            console.log("product is added");
                    showToast("product is added");
            }
    }
    
    //when product is added ,the cart will be updated
    //update cart is called here to update cart icon count and shopcart
    updateCart();

}


//UPDATE CART
//It will fetch the data from localstorage and will pass to shopcart.jsp for dynamic data

 function updateCart() {
//    getting the cart which is in string format and coverting it  to JSON and storingin cart objecy
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    var cartJsonString = JSON.stringify(cart);
   
   if(window.location.pathname.endsWith('/ordering.jsp')){
//     Use AJAX to send the cart data to the ordering.jsp page
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'ordering.jsp');
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(cartJsonString);
    }

//    var element=document.getElementById("no-items-id");   
    //if cart object is empty
    if (cart === null || cart.length === 0) {
        console.log("cart is empty");
        
        //setting the shop icon count to 0 
        $(".cart-items").html("(0)");
        
////           var Template=document.getElementById("template-true");
//           
////        setting the shopcart body to  CART DOES NOT HAVE ANY ITEM
        $(".no-items").html(`
            <h2 class='no-cart'>Cart does not have any Item<h2>\n\ 
              <div class='text-center mt-4'>
                   <button onclick='window.location.href="index.jsp#products"' class='btn btn-outline-primary'>Continue Shopping</button>
            </div>
            <div class="container ">
            <img src="images/img/cart3.png" class="img-fluid " >
           </div>`);
                  
    } else {
        console.log(cart);
//         var Template=document.getElementById("template-false");
        
       //setting the cart icon count with cart.length
        $(".cart-items").html(`( ${cart.length} )`);          
        localStorage.setItem("totalItems", cart.length);
   
//    cart.map((item)=> {
//            $(".product-name").html(` ${item.productName} `);
//            $("#itemval1").html(` ${item.productPrice} `);
//            $(".cart-image").attr("src",`${item.productPic}`); 
//            $(".product-category").html(`${item.productCategory}`);
//            $(".pdescr").html(`${item.productDesc}`);
//            console.log(` ${item.productCategory} `);
//            
//             let x=cart.length;
//             document.getElementsByClassName("total-items")[0].innerText=x;
//              console.log(x);
//    });
  
        let card = ``;
        var totalproductprice =0;
        cart.map((item) => {
            var itemquan = "item" + (`${item.productId}`);
                            
            card = card + `<div class="card  first-product  mb-3 p-4">
                            <h2 class="py-4 font-weight-bold product-category">${item.productCategory}</h2>
                            <div class="row">
                                <!-- div for images -->
                                <div
                                    class="col-md-5 col-11 mx-auto bg-light d-flex justify-content-center align-items-center shadow product-img">
                                    <img src="${item.productPic}" class="img-fluid cart-image" alt="">

                                </div>
                                <!-- card product details -->
                                <div class="col-md-7 coll-11 mx-auto px-sm-5 px-md-3 mt-2 pro-detail">
                                    <div class="row">
                                        <!-- product name -->
                                        <div class="col-8  card-title">
                                            <h3 class="mb-4 product-name text-uppercase ">${item.productName}</h3>
                                            <p class="mb-2">COLOR - WHITE</p>
                                            <p class="mb-2"> WEIGHT - 300GM</p>
                                            <p class="mb-4 pdescr">${item.productDesc}</p>
                                        </div>
                                        <!-- Quantity -->
                                        <div class="col-4 quantitybtn ">
                                            <ul class="pagination d-flex justify-content-end  set-quantity">

                                                <li class="page-item">
                                                    <button class="page-link" onclick="decreasenumber('${item.productName}','${itemquan}',${item.productPrice},${item.productId})">
                                                        <i class="fa  fa-minus"></i>
                                                    </button>
                                                </li>
                                                <li class="page-item ">
                                                    <input type="text" name="" class="page-link " value="${item.productQuantity}" id="${item.productName}" >
                                                </li>
                                                <li class="page-item">
                                                    <button class="page-link" onclick="increasenumber('${item.productName}','${itemquan}',${item.productPrice},${item.productId})">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </li>

                                            </ul>
                                        </div>
                                    </div>
                                    <!-- remove move and price -->
                                    <div class="row remove-wish">
                                        <div class="col-8 d-flex justify-content-between align-items-end remove-wish">
                                            <button style="border:none;" onclick="deleteItemFromCart(${item.productId})"><p class="h6"><i class="fas fa-trash px-1"></i>REMOVE ITEM</p></button>
                                            <p class="h6"><a onclick="makered()"><i class="fas fa-heart px-1 iwishlist"></i>ADD TO WISHLIST</a></p>
                                        </div>
                                        <div class="col-4 d-flex justify-content-end  price-money">
                                                    
                                            <h5 class="price-indivi mb-2">$<span id="${itemquan}" class=" myprice-indvi">${item.productPrice * item.productQuantity} </span></h5>
                                                
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
           
    `;    
            //ensures the it run only when the dom is fully loaded
            $(document).ready(function(){
              $("#scriptdiv").html(card);  
               
            //total price is calculated by multiplying each product with its quantity and adding them all
            totalproductprice = totalproductprice + parseInt(item.productPrice * item.productQuantity);
            });
        });
        
         //ensures the it run only when the dom is fully loaded
         $(document).ready(function(){

        $("#total-product-amt").html(totalproductprice);
        $("#total-cart-amount").html(totalproductprice + 50);
        $("#myOrderAmount").val(totalproductprice + 50);
//        document.getElementById("total-product-amt").innerHTML = totalproductprice;
//        document.getElementById("total-cart-amount").innerHTML = totalproductprice + 50;
         });
        
        console.log("total cart amount: "+totalproductprice);
         
    }
     
//     var clone= document.importNode(Template.content,true);
//     element.appendChild(clone);
     
}
//when document will be ready then only updateCart will be called
//on reload update will be called
$(document).ready(function () {
    updateCart();
});

//go to checkout
//function goToCheckout() {
//    window.location = "checkout.jsp";
//}

//DELETE ITEM FROM CART
//will take an pid to delete
function deleteItemFromCart(pid) {
    let cart = JSON.parse(localStorage.getItem("cart"));
    
    //the product which not satisfies the condition will not be in newcart ie our pid product to be deleted
    let newcart = cart.filter((item) => item.productId !== pid);
    localStorage.setItem("cart", JSON.stringify(newcart));
    //calling the updateCart to save changes after removing element
    updateCart();
    showToast("Item is removed from the cart");
}


var product_total_amt = document.getElementById('total-product-amt');
var total_cart_amt = document.getElementById('total-cart-amount');
var shipping_amt = document.getElementById('shipping-charge');

var discount_code = document.getElementById('discountcode1');

const discountcode = () => {
    let totalcuramt = parseInt(total_cart_amt.innerHTML);
    let codevalidation = document.getElementById("error");
    if (discount_code.value === 'Shan') {
        let amt_after_discount = totalcuramt - 15;
        total_cart_amt.innerHTML = amt_after_discount;
        codevalidation.innerHTML = " Hurray! code applied";
          $("#myOrderAmount").val(amt_after_discount);
    } else {

        codevalidation.innerHTML = "code expired";
    }
    
};
                       //product name ,productquantity,productprice,productId
const decreasenumber = (incrDecrBoxClass, itemPriceBoxClass, productPrice, productId) => {
    var itemval = document.getElementById(incrDecrBoxClass);
    var itemprice = document.getElementById(itemPriceBoxClass);
    var productPrice = productPrice;
    var productId = productId;
    var productPrice = productPrice;
    console.log(productId);

    if (itemval.value <= 1) {
        itemval.value = 1;


    } else {
        var cart = localStorage.getItem("cart");
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId === productId);
        if (oldProduct) {
            //only we have to decrease the quantity
            oldProduct.productQuantity = oldProduct.productQuantity - 1;
            pcart.map((item) => {
                if (item.productId === oldProduct.productId) {
                    item.productQuantity = oldProduct.productQuantity;
                }
            });
            localStorage.setItem("cart", JSON.stringify(pcart));

            showToast(oldProduct.productName + " product Quantity is decreased, Quantity=" + oldProduct.productQuantity);
        }

        itemval.value = parseInt(itemval.value) - 1;
//       localStorage.setItem("itemQuantity",itemval.value);
//       let itemQuantity1= localStorage.getItem("itemQuantity");
//       console.log(itemQuantity1);
        itemprice.innerHTML = parseInt(itemprice.innerHTML) - productPrice;
        product_total_amt.innerHTML = parseInt(product_total_amt.innerHTML) - productPrice;
        total_cart_amt.innerHTML = parseInt(product_total_amt.innerHTML) + parseInt(shipping_amt.innerHTML);
        itemval.style.background = 'white';
        itemval.style.color = '#000';
        console.log(itemval.value);
        console.log(itemprice.innerHTML);
//        localStorage.setItem("itemPrice",itemprice.innerHTML);
//         let itemPrice1= localStorage.getItem("itemPrice");
//       console.log(itemPrice1);

    }
    updateCart();
};
const increasenumber = (incrDecrBoxClass, itemPriceBoxClass, productPrice, productId) => {
    var itemval = document.getElementById(incrDecrBoxClass);
    var itemprice = document.getElementById(itemPriceBoxClass);
    var productId = productId;
    var productPrice = productPrice;
    console.log(productId);
    if (itemval.value >= 10) {
        itemval.value = 10;
        alert("max 10 allowed");
        itemval.style.background = 'red';
        itemval.style.color = 'white';

    } else {
        var cart = localStorage.getItem("cart");
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId == productId);
        if (oldProduct) {
            //only we have to increase the quantity
            oldProduct.productQuantity = oldProduct.productQuantity + 1;
            pcart.map((item) => {
                if (item.productId == oldProduct.productId) {
                    item.productQuantity = oldProduct.productQuantity;
                }
            });
            localStorage.setItem("cart", JSON.stringify(pcart));

            showToast(oldProduct.productName + " product Quantity is increased, Quantity=" + oldProduct.productQuantity);
        }
        itemval.value = parseInt(itemval.value) + 1;
//        localStorage.setItem("itemQuantity",itemval.value);
//       let itemQuantity1= localStorage.getItem("itemQuantity");
//       console.log(itemQuantity1);

        itemprice.innerHTML = parseInt(itemprice.innerHTML) + productPrice;
        product_total_amt.innerHTML = parseInt(product_total_amt.innerHTML) + productPrice;
        total_cart_amt.innerHTML = parseInt(product_total_amt.innerHTML) + parseInt(shipping_amt.innerHTML);
//         console.log(itemval.value);
//    console.log(itemprice.innerHTML);
//     localStorage.setItem("itemPrice",itemprice.innerHTML);
//         let itemPrice1= localStorage.getItem("itemPrice");
//       console.log(itemPrice1);
        updateCart();
    }

};


//TOAST function to display the message
function showToast(content) {
    $("#toast").addClass("display1");
    $("#toast").html(content);

    setTimeout(() => {
        $("#toast").removeClass("display1");
    }, 2000);
}
