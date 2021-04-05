let changeElement = []
for(let i = 0; i<1; ++i){
  console.log(`vegetable-add${i}`)
  let element = document.getElementById(`vegetable-add${i}`)
  console.log(element)
  element.addEventListener("click", function(){
    let length = changeElement.length
    for(let i = 0; i<length; ++i){
      let element = document.getElementById(`vegetable-add${changeElement[i]}`)
      let element2 = document.getElementById(`vegetable-add-form${changeElement[i]}`)
      element.style.display = "block"
      element2.style.display = "none"
    }

    element2 = document.getElementById(`vegetable-add-form${i}`)
    element.style.display = "none"
    element2.style.display = "flex"
    changeElement.push(i)
  })
}