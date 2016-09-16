var basket = 'empty';

function goShopping() {
  function shop1() {
    basket = 'tv';
  }

  console.log(basket); // shop1 not invoked yet

  function shop2() {
    basket = 'computer'; 
  }

  function shop3() {
    var basket = 'play station';
    console.log(basket);
  }

  shop1(); // basket = 'tv'
  shop2(); // basket = 'computer'
  shop3(); // play station

  console.log(basket); // computer
}

goShopping();

// empty
// play station
// computer