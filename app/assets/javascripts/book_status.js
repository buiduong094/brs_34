$(document).on('ready page:load', function(){
  var book_id = $('#review_book_id').val();
  if($('#is_favourite').val()=='true'){
    $('#btn_favourite').addClass('btn-success');
    $('#btn_favourite').removeClass('btn-default');
  }
  if($('#reading_status').val()=='0'){
    $('#btn_read').addClass('btn-success');
    $('#btn_read').removeClass('btn-default');
  }else if($('#reading_status').val()=='1'){
    $('#btn_reading').addClass('btn-success');
    $('#btn_reading').removeClass('btn-default');
  }

  function submit_form(attribute, status){
    var bookstatus_id = $('#book_status').val();
    var reading_status = $('#reading_status').val();
    var is_favourite = $('#is_favourite').val();
    if(attribute == 'reading_status'){
      reading_status = status;
    }else{
      is_favourite = status
    }
    var method = "PUT";
    var url = '/book_status/';
    if(bookstatus_id == ''){
      method = 'POST';
    }else{
      url = url+bookstatus_id
    }

    $.ajax({
      url: url,
      method: method,
      data: {
        book_status:
          {book_id: book_id, is_favourite: is_favourite,
            reading_status: reading_status}
      },
      dataType: 'JSON',
      success: function(response){
        $('#book_status').val(response.book_status);
        $('#reading_status').val(reading_status);
        $('#is_favourite').val(is_favourite);
      },
      error: function(){
        alert("Error!");
      }
    });
  }

  function destroy(){
    var bookstatus_id = $('#book_status').val();
    $.ajax({
      url: '/book_status/'+bookstatus_id,
      method: 'DELETE',
      data: {},
      dataType: 'JSON',
      success: function(response){
        $('#book_status').val('');
        $('#reading_status').val('');
        $('#is_favourite').val('false');

        $('#btn_read').removeClass('btn-success');
        $('#btn_reading').removeClass('btn-success');
        $('#btn_favourite').removeClass('btn-success');

        $('#btn_read').addClass('btn-default');
        $('#btn_reading').addClass('btn-default');
        $('#btn_favourite').addClass('btn-default');
      },
      error: function(){
        alert("Error!");
      }
    });
  }

  $('#btn_read').click(function(){
    var reading_status = $('#reading_status').val();
    if(reading_status!='0'){
      submit_form('reading_status', 0);
      $('#reading_status').val(0);
      $('#btn_read').removeClass('btn-default');
      $('#btn_read').addClass('btn-success');
      $('#btn_reading').addClass('btn-default');
      $('#btn_reading').removeClass('btn-success');
    }else{
      if($('#is_favourite').val()=='false'){
        destroy();
      }else{
        submit_form('reading_status', null);
        $('#btn_read').addClass('btn-default');
        $('#btn_read').removeClass('btn-success');
      }
    }
  });

  $('#btn_reading').click(function(){
    var reading_status = $('#reading_status').val();
    if(reading_status!='1'){
      submit_form('reading_status', 1);
      $('#reading_status').val(1);
      $('#btn_reading').removeClass('btn-default');
      $('#btn_reading').addClass('btn-success');
      $('#btn_read').addClass('btn-default');
      $('#btn_read').removeClass('btn-success');
    }else{
      if($('#is_favourite').val()=='false'){
        destroy();
      }else{
        submit_form('reading_status', null);
        $('#btn_reading').addClass('btn-default');
        $('#btn_reading').removeClass('btn-success');
      }
    }
  });

  $('#btn_favourite').click(function(){
    var is_favourite = $('#is_favourite').val();
    if(is_favourite=='true'){
      $('#btn_favourite').removeClass('btn-success');
      $('#btn_favourite').addClass('btn-default');
      if($('#reading_status').val()){
        submit_form('is_favourite',false);
      }else{
        destroy();
      }
    }else{
      submit_form('is_favourite',true);
      $('#btn_favourite').addClass('btn-success');
      $('#btn_favourite').removeClass('btn-default');
    }
  });
});
