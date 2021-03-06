// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initSelect2 } from '../components/init_select2';
import { initMapbox } from '../components/init_mapbox';
import { initFileUpload } from '../components/initFileUpload';
import { previewImageOnFileSelect } from '../components/init_photo_preview';
import { initCropper } from '../components/init_cropper';
import { initFlatpickr } from '../components/init_flatpickr';
import { initUserCable } from '../channels/user_channel'



// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
Turbolinks.scroll = {};

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initSelect2();
  initMapbox();
  initFileUpload();
  previewImageOnFileSelect();
  initCropper();
  initFlatpickr();
  initUserCable();


  const elements = document.querySelectorAll("[data-turbolinks-scroll]");

  elements.forEach(function(element){

    element.addEventListener("click", ()=> {
      Turbolinks.scroll['top'] = document.scrollingElement.scrollTop;
    });

    element.addEventListener("submit", ()=> {
      Turbolinks.scroll['top'] = document.scrollingElement.scrollTop;
    });

  });

  if (Turbolinks.scroll['top']) {
    document.scrollingElement.scrollTo(0, Turbolinks.scroll['top']);
  }

  Turbolinks.scroll = {};

});

import "controllers";


