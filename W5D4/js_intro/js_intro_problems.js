/* 
useful methods: XOR is ^ 
*/

function madLib(verb, adjective, noun) {
  return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}!`
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

function fizzBuzz(arr) {
  let fizzBuzzable = [];
  arr.forEach(ele => {
    if ((ele % 3 === 0) ^ (ele % 5 === 0)) {
      fizzBuzzable.push(ele)
    }
  })
  return fizzBuzzable;  
}

function isPrime(number) {
  if (number < 2) { return false; }

  for (let i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }

  return true;
}

function sumOfNPrimes(n) {
  let sum = 0;
  let numPrimes = 0;
  let i = 2;

  while (numPrimes < n) {
    if (isPrime(i)) {
      sum += i;
      numPrimes++;
    }
    i++;
  }

  return sum;
}



console.log(madLib("read", "kami", "light novels"))

console.log(isSubstring("somethingsomething", "something"))

console.log(isSubstring("somethingsomething", "confused anime girl"))

console.log(fizzBuzz([15, 3, 10, 30]))

console.log(isPrime(3))

console.log(isPrime(6))

console.log(sumOfNPrimes(3))