// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .
//= require social-share-button

$(document).on('ready page:load', function(){
  $('.sumit_form_comment').on('click', 'input[type=submit]',function(){
    $('.sumit_form_comment').not(this).attr('disabled','disabled');
    content_review = $(this).find('textarea#comment_content').val();
    console.log('adad'+content_review);
  });
  var load_image_star= function(length) {
    $.each($('.star-review'), function(index, key){
      if (index < length){
        $(key).attr('src', '/assets/star-on.png');
      }else {
        $(key).attr('src', '/assets/star-off.png');
      }
    });
  }

  $('.star-review').hover(function() {
    load_image_star($(this).attr('alt'));
  });

  $('.star-review').mouseleave(function() {
    load_image_star($('#review_rating').val());
  });

  $('.star-review').click(function() {
    var value = $(this).attr('alt');
    $('#review_rating').val(value);
    load_image_star(value);
  });

  $('#review-remove-btn').on('click', function(event){
    var result = confirm("Want to delete?");
    if (result) {
      var id = $('#review_id').val();
      $.ajax({
        url: '/reviews/'+id,
        method: 'DELETE',
        data: {},
        dataType: 'JSON',
        success: function(response){
          $('#review_'+id).fadeOut(500, function(){
            $(this).remove();
          });
          $('.mynewreview').text('Add review');
          $('#review-btn').val('Add review');
          if(response.star_rewview_book){
            $('#star_rewview_book').text(response.star_rewview_book);
          }else{
            $('.star_rewview_book').addClass('hidden');
          }
          alert(response.status);
          load_image_star(0);
          $('#review_rating').val('');
          $('#review_content').val('');
        },
        error: function(){
          alert("Error!");
        }
      });
    }
  });

  $('#review-btn').on('click', function(event){
    var method = $(this).val();
    var id = $('#review_id').val();
    var url = '/reviews';
    if (method == 'Update review'){
      url = url+'/'+id;
      method = "PUT";
    }else{
      method = 'POST';
    }
    event.preventDefault();
    var rating = $('#review_rating').val();
    var content_book = $('#review_content').val();
    var book_id = $('#review_book_id').val();
    $.ajax({
      url: url,
      method: method,
      data: {
        review: {content: content_book, rating: rating, book_id:book_id}
      },
      dataType: 'JSON',
      success: function(response){
        if(method == 'PUT'){
          $('#review_'+id).fadeOut(0, function(){
            $(this).remove();
          });
          $("#mynewreview").modal("hide");
          $(".reviews-index").prepend(response.content);
        }else{
          $('.star_rewview_book').removeClass('hidden');
          $("#mynewreview").modal("hide");
          $(".reviews-index").prepend(response.content);
          $('.mynewreview').text('Update review');
          $('#review-btn').val('Update review');
          $('#review_id').val(response.review_id);
        }
        $('#star_rewview_book').text(response.star_rewview_book);
        alert(response.status);

        $('#review-remove-btn').on('click', function(event){
        var result = confirm("Want to delete?");
        if (result) {
          var id = $('#review_id').val();
          $.ajax({
            url: '/reviews/'+id,
            method: 'DELETE',
            data: {},
            dataType: 'JSON',
            success: function(response){
              $('#review_'+id).fadeOut(500, function(){
                $(this).remove();
              });
              $('.mynewreview').text('Add review');
              $('#review-btn').val('Add review');
              if(response.star_rewview_book){
                $('#star_rewview_book').text(response.star_rewview_book);
              }else{
                $('.star_rewview_book').addClass('hidden');
              }
              alert(response.status);
              load_image_star(0);
              $('#review_rating').val('');
              $('#review_content').val('');
            },
            error: function(){
              alert("Error!");
            }
          });
        }
      });
      },
      error: function(){
        alert("Error! Please check your review and retry!");
      }
    });
  });
});
