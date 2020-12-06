const fs = require('fs')

async function readInput(map){
    const input = await fs.promises.readFile('input.txt', 'utf-8'); 
    return input.split('\n');
}

async function solve() { 
    const values = await readInput(); 
    values.shift(); // removes the first row 

    let index = 3;
    let treeCount = 0; 

    values.forEach(row => {
        if(row[index % row.length] === '#'){
            treeCount += 1; 
        }
        index += 3;  
    })
    console.log(treeCount);
}

solve(); 


async function solve_two(increment, down = 1){ 
    const values = await readInput(); 

    let index = increment;
    let treeCount = 0; 

    for(let i = down; i < values.length; i += down){
        const row = values[i]; 
        const rowIndex = index % row.length; 
        if(row[rowIndex] === '#'){
            treeCount += 1; 
        }
        index += increment;
    }
    return treeCount;
} 

Promise.all(
    [solve_two(1), solve_two(3), solve_two(5), solve_two(7), solve_two(1,2)], 
).then((answers) => {
    console.log(answers); 
    return answers.reduce((product, value) => product * value, 1); 
}).then(console.log); 
