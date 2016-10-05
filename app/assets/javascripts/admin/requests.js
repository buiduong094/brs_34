$(document).on('ready page:load', function(){

  $('.btn_acceppt').click(function() {
    var id = $(this).val();
    update_request(id,2);
  });

  $('.btn_deny').click(function() {
    var id = $(this).val();
    update_request(id,1);
  });

  function update_request(id_request, status){
    $.ajax({
      url: '/admin/requests/'+id_request,
      method: 'PUT',
      data: {status: status},
      dataType: 'JSON',
      success: function(response){
        if(response.status){
          $('.request_status_'+id_request).text(response.status);
          $('.btn_acceppt_'+id_request).addClass('hidden');
          $('.btn_deny_'+id_request).addClass('hidden');
        }
      },
      error: function(){
        alert("Error!");
      }
    });
  }
});
