// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap-sprockets
import "@hotwired/turbo-rails"
import "@hotwired/stimulus"


document.querySelector('html').addEventListener("turbo:load", function (e) {

  const avatar_base64 = document.getElementById("user_avatar");
  const avatar_selector = document.getElementById("avatar-selector");

const convertBase64 = (file) => {
    return new Promise((resolve, reject) => {
        const fileReader = new FileReader();
        fileReader.readAsDataURL(file);

        fileReader.onload = () => {
            resolve(fileReader.result);
        };

        fileReader.onerror = (error) => {
            reject(error);
        };
    });
};

const uploadAvatar = async (event) => {
    const file = event.target.files[0];
    const base64 = await convertBase64(file);
    avatar_base64.setAttribute('value', base64);
};

if (avatar_selector != null) {
  avatar_selector.addEventListener("change", (e) => {
      uploadAvatar(e);
  });
}


const image_base64 = document.getElementById("data");
const image_selector = document.getElementById("photo-selector")

const uploadImage = async (event) => {
    const file = event.target.files[0];
    const base64 = await convertBase64(file);
    image_base64.setAttribute('value', base64);
};

if (image_selector != null) {
    image_selector.addEventListener("change", (e) => {
      uploadImage(e);
  });
}

})
