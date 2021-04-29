// window.addEventListener('load', () => {
//      const priceInput = document.getElementById("item-price");
//      addTaxDom.innerHTML = "priceInput * 0.1"


//      // const XHR = new XMLHttpRequest();
//      // XHR.open("POST", "/posts", true);
//      // XHR.responseType = "json";
//      // XHR.send(formData);
   
// });

function tax (){
     const itemPrice  = document.getElementById("item-price");
     itemPrice.addEventListener("keyup", () => {
       const fee = Math.floor(itemPrice.value * 0.1);
       const addTaxPrice = document.getElementById("add-tax-price");
       addTaxPrice.innerHTML = `${fee}`;
       const SalesProfit = itemPrice.value - fee ;
       const profit = document.getElementById("profit");
       profit.innerHTML = `${SalesProfit}`;
     });
}
   
window.addEventListener('load', tax);