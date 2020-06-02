const initCropper = () => {
  const coordsInput = document.querySelector('#croppings');
  const photo = document.querySelector('#photo-preview');
  const growthFactor = photo.naturalHeight / photo.height;
  const stage = Jcrop.attach('photo-preview',{
    multi: true
  });
  stage.listen('crop.change',(widget,e) => {
    const coords = [...stage.crops];
    const mapped = coords.map((item) => {
      const newPos = {};
      for (const prop in item.pos) {
        newPos[prop] = Math.round(item.pos[prop] * growthFactor)
      }
      return JSON.stringify(newPos);
    });
    coordsInput.value = `[${mapped}]`;
  });
}


const displayPreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById('photo-preview').src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.getElementById('photo-preview').classList.remove('hidden');
    setTimeout(initCropper, 1000);
  }
}

const previewImageOnFileSelect = () => {
  // we select the photo input
  const input = document.getElementById('photo-input');
  if (input) {
    // we add a listener to know when a new picture is uploaded
    input.addEventListener('change', () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      displayPreview(input);
    })
  }
}

export { previewImageOnFileSelect }
