if (/items.*edit|new/.test(window.location.pathname)) {
  document.addEventListener("DOMContentLoaded", function() {
    const ImagePreview = document.getElementById("item-image")

    // 画像表示のHTMLを挿入する関数を定義
    const createImageHTML = function(blob) {
      const imageElement = document.createElement("div");
      const blobImage = document.createElement("img");
      blobImage.setAttribute("src", blob);
      blobImage.setAttribute("class", "image-preview");
      imageElement.appendChild(blobImage);
      ImagePreview.appendChild(imageElement);
    }

    document.getElementById("image-upload").addEventListener("change", function(e) {
      // 古い画像は削除
      const imageContent = document.querySelector(".image-preview");
      if (imageContent) {
        imageContent.remove();
      };

      // 画像のURLを生成してビューに表示
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
    });
  });
}
