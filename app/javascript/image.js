$(document).on('turbolinks:load', ()=> {
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }
  function readURL(input) {
    if (input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#user_img").change(function(){
    console.log(this.files[0]);
    readURL(this);
  });

});