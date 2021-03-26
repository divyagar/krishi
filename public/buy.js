// let elements = document.getElementsByClassName("vegetable-add")
// for (i = 0; i < elements.length; ++i){
//   elements[i].addEventListener("click", function(e){
//     console.log(e.target.nextElementSibling);
//   })
// }

let changeElement = []
for(let i = 0; i<6; ++i){

  let element = document.getElementById(`vegetable-add${i}`)
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
