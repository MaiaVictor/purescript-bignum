"use strict";

var bn = require("bn.js");

// module Data.BigNum

// Instantiators
exports.fromStringPrime = function(b) {
  return function(x) {
    return new bn(x, b);
  }
};

exports.fromInt = exports.fromStringPrime(10);
exports.fromArray = exports.fromStringPrime(10);

exports.toString = function(x) {
  return x.toString(10);
};

exports.toHexString = function(x) {
  return x.toString(16);
};

exports.toBinaryString = function(x) {
  return x.toString(2);
};


// Utils =====================================================================

exports.bnClone = function(x) {
  return x.clone();
};

exports.toArray = function(x) {
  return x.toArray();
};

exports.toNumberPrime = function(just, nothing, x) {
  try {
    return just(x.toNumber());
  } catch (err) {
    return nothing;
  }
};

exports.bitLength = function(x) {
  return x.bitLength();
};

exports.zeroBits = function(x) {
  return x.zeroBits();
};

exports.byteLength = function(x) {
  return x.byteLength();
};

exports.isNeg = function(x) {
  return x.isNeg();
};

exports.isEven = function(x) {
  return x.isEven();
};

exports.isOdd = function(x) {
  return x.isOdd();
};

exports.isZero = function(x) {
  return x.isZero();
};

exports.cmp = function(a, b) {
  return a.cmp(b);
};

// Arithmetics  ===============================================================
exports.neg = function(x) {
  return x.neg();
};

exports.abs = function(x) {
  return x.abs();
};

exports.bnAdd = function(x) {
  return function(y) {
    return x.add(y);
  }
};

exports.bnSub = function(x, y) {
  return function(y) {
    return x.sub(y);
  }
};

exports.bnMul = function(x, y) {
  return function(y) {
    return x.mul(y);
  }
};

exports.sqr = function(x) {
  return x.sqr();
};

exports.pow = function(x) {
  return function(p) {
    return x.pow(p);
  }
};

exports.bnMod = function(x) {
  return function(m) {
    return x.mod(m);
  }
};

exports.bnDiv = function(x) {
  return function(y) {
    return x.div(y);
  }
};

exports.bnSafeDivPrime = function(just, nothing, x, y) {
  try {
    return just(x.div(y));
  } catch (err) {
    return nothing;
  }
};

exports.bnDivRound = function(x) {
  return function (y) {
    return x.divRound(y);
  }
};

// Bit Operations =============================================================

exports.bnOrPrime = function(just, nothing, a, b) {
  try {
    return just(a.or(b));
  } catch (err) {
    return nothing;
  }
};

exports.bnAndPrime = function(just, nothing, a, b) {
  try {
    return just(a.and(b));
  } catch (err) {
    return nothing;
  }
};

exports.bnXorPrime = function(just, nothing, a, b) {
  try {
    return just(a.xor(b));
  } catch (err) {
    return nothing;
  }
};

exports.bnSetn = function(a) {
  return function(b) {
    // Clone to avoid mutating
    return a.clone().setn(b);
  }
};

exports.bnShln = function(a) {
  return function(b) {
    // Clone to avoid mutating
    return a.clone().shln(b);
  }
};

exports.bnShrn = function(a) {
  return function(b) {
    return a.clone().shrn(b);
  }
};

exports.bnTestn = function(a) {
  return function(b) {
    return a.testn(b);
  }
};

exports.bnMaskn = function(a) {
  return function(b) {
    // Does not mutate
    return a.maskn(b);
  }
};

exports.bnBincn = function(a) {
  return function(b) {
    // Clone to avoid mutating
    return a.clone().bincn(b);
  }
};

exports.bnNotn = function(a) {
  return function(b) {
    // Does not mutate
    return a.notn(b);
  }
};

// Reduction ==================================================================

exports.bnGcd = function(a) {
  return function(b) {
    return a.gcd(b);
  }
};

exports.bnEgcd = function(a) {
  return function(b) {
    return a.egcd(b);
  }
};

exports.bnInvm = function(a) {
  return function(b) {
    return a.invm(b);
  }
};
