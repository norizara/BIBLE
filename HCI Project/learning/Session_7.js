function printSomething(text, callback){
    console.log(text);
    callback();
}

const someFunction = () => {
    console.log('This is a function');
}

printSomething('This is a text', someFunction);
// printSomething('This is a text', someFunction());
someFunction();