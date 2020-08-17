if (window.location.pathname === "/items/new") {
  document.addEventListener("DOMContentLoaded", function() {
    const ImagePreview = document.getElementById("item-image")
    document.getElementById("image-upload").addEventListener("change", function(e) {
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      const imageElement = document.createElement("div");
      const blobImage = document.createElement("img");
      blobImage.setAttribute("src", blob);
      blobImage.setAttribute("class", "image-preview");
      imageElement.appendChild(blobImage);
      ImagePreview.appendChild(imageElement);
    });
  });
}