const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-lewagon-white');
      } else {
        navbar.classList.remove('navbar-lewagon-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };


const chooseNavBar = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  const banner = document.querySelector('.home-banner');
  if (banner === null) {
    navbar.classList.add('navbar-lewagon-white');
    navbar.classList.remove('fixed-top');
  }
}

export { chooseNavBar };