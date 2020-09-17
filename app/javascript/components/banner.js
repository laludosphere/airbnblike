import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Le Dépaysement à ", "deux pas de chez vous"],
    typeSpeed: 20,
    loop: true
  });
}

export { loadDynamicBannerText };