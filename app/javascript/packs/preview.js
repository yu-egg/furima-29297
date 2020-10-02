document.addEventListener('DOMContentLoaded', function(){
  const ImageList = document.getElementById('image-list');
  document.getElementById('item_image').addEventListener('change', function(e){
    const file = e.target.files[0];
  });
});