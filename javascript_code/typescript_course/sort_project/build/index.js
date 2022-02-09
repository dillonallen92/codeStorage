"use strict";
// the goal of this project is to make
// a generic sorter, so we can use
// this sorting algorithm on every data
// structure we want
// we will be using bubble-sort
// first, implement with an array of nums
class Sorter {
    constructor(collection) {
        this.collection = collection;
    }
    sort() {
        const { length } = this.collection;
        for (let i = 0; i < length; i++) {
            for (let j = 0; j < length - i - 1; j++) {
                if (this.collection[j] > this.collection[j + 1]) {
                    const temp = this.collection[j];
                    this.collection[j] = this.collection[j + 1];
                    this.collection[j + 1] = temp;
                }
            }
        }
    }
}
const sorter = new Sorter([10, 3, -5, 0, 20, -10, 15, -120]);
sorter.sort();
console.log(sorter.collection);
