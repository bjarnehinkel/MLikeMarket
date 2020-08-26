// const product = document.querySelector(".product");
const links = document.querySelectorAll(".quicklinks a");

const moveActive = () => {
  if (document.querySelectorAll(".quicklinks a")[0] !== undefined) {
    links.forEach(link => {link.classList.remove("active")});
  }
  if (document.querySelector(".product") !== null) {
    const product = document.querySelector(".product");
    const category = product.dataset["category"];
    links.forEach(link => {
      if (link.innerText === category) {
        console.log(link.innerText);
        link.classList.add("active");
      } else {
        link.classList.remove("active");
      }
    });
  }
};

export { moveActive }
