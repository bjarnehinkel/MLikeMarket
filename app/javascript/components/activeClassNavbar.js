// const product = document.querySelector(".product");
const links = document.querySelectorAll(".quicklinks a");

const moveActive = () => {
  // if (document.querySelectorAll(".quicklinks a")[0] !== undefined) {
  //   links.forEach(link => {link.classList.remove("active")});
  // }
  // if (document.querySelector("#product") !== null) {
  //   const product = document.querySelector("#product");
  //   let categoryIdString = product.dataset.category;
  //   const categoryID = parseInt(categoryIdString);
  //   links.forEach(link => {
  //     let linkIdString = link.dataset.catid;
  //     let linkID = parseInt(linkIdString);
  //     if (linkID === categoryID) {
  //       link.classList.add("active");
  //       console.log('made it here');
  //       console.log(link.classList);
  //       let active = document.querySelector(".quicklinks a.active");
  //       console.log(active);
  //     } else {
  //       link.classList.remove("active");
  //     }
  //   });
  // }
  // let active = document.querySelector(".quicklinks a.active");
  // console.log(active);
};

export { moveActive }
