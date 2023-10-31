const fac = n => {
    let result = 1;
    for(let i=1;i<n+1;i++){
        result *= i;
    }
    return result;
}

const permutation = (n,r) => fac(n) / fac(n-r);

const combination = (n,r) => fac(n) / (fac(n-r) * fac(r));

const multiPermutation = (n,r) => n**r;

const multiCombination = (n,r) => combination(n+r-1,r);

module.exports = {
    permutation : permutation,
    combination : combination,
    multiPermutation : multiPermutation,
    multiCombination : multiCombination,
};
