const carouselItems = document.querySelectorAll(".carousel-item");
const thumbnails = document.querySelectorAll(".thumbnail");
const itemsArray = Array.from(carouselItems);

const makeActive = () => {
  let activeItem = document.querySelector(".carousel-item.active");
  let activeSrc = activeItem.firstElementChild.src;
  thumbnails.forEach(nail => {
    if (nail.src === activeSrc) {
      nail.classList.add("active");
    }
  });
}

const removeActives = (actives) => {
  actives.forEach(element => {
    element.classList.remove('active');
  });
}

const addActives = (nextActives) => {
  nextActives.forEach(element => {
    element.classList.add('active');
  });
}

const toggleActive = () => {
  if (carouselItems[0] !== undefined) {
    makeActive();
    thumbnails.forEach(nail => {
      nail.addEventListener('click', (event) => {
        let activeItem = document.querySelector(".carousel-item.active");
        let activeNail = document.querySelector(".thumbnail.active");
        removeActives([activeItem, activeNail]);
        let nextActiveNail = event.target;
        let nextActiveItem = itemsArray.find(item => item.firstElementChild.src === nextActiveNail.src);
        addActives([nextActiveNail, nextActiveItem]);
      });
    });
  }
}

export { toggleActive };
