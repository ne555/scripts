/***
    Remove the rows from the table that have empty column
***/
function remove_empty_rows(table, column){
    let rows = Array.from(table.rows)
    rows.slice(1).forEach( (element) => {
        if (element.children[column].innerText == '')
            element.parentNode.removeChild(element);
    });
}

//Use example
//let table = document.querySelector('table[border="1"]')
//remove_empty(table, 2)
