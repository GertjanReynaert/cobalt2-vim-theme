var test = 0;
var array = [1, 2];
var regex = /^\b1?[-.\s]?(\d{3})|([A-z])[-.\s]?\d{3}[-.\s]?\d{4}\b$/img;

// single line comment

/**
*  multi line comment
**/
var obj = {
  id: 1,
  title: "SomeObject",
  description: "SomeDescription"
};

function test(item, array) {
  document.getElementById("test");
  this.element = $(".button").first();
}

function comparisson() {
  if (a == b){}
  if (b === c){}
  if (a <= b){}
  if (b >= a){}
  if (b != a){}
  if (b !== a){}
  if (true && false) {} else {}
  var tester = a === b ? true : false;
}

function calculations() {
  var t = a + b;
  t = b - c;
  t = c % d;
  t = d / e;
  t = e * f;
}

switch(expression) {
  case n:
    testBuiltins();
  break;
  case n:
    testBuiltins();
  break;
  default:
    testBuiltins();
}

function returnNothing() {
  var something = null;
  something = undefined;
  something = NaN;
}

function tryCatch() {
  try {
    adddlert("Welcome guest!");
  }
  catch(err) {
    document.getElementById("demo").innerHTML = err.message;
  }
}

function loops() {
  while (true) {
    j++;
    break;
  }

  for(var i = 0; i < 10; i++) {
    if (i === 5) {
      continue;
    }
    j++;
  }
}

function rnd() {
  Math.random();
}

function today() {
  new Date();
}

var testBuiltins = function() {
  window.console.log("test");
  window.alert("test");
};

today.prototype.day = function() {
  return "bs";
};
