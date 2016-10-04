$(document).on 'change', ->
  $('.new_comment').off 'submit'
  $('.new_comment').on 'submit', (event) ->
    event.preventDefault()
    url = $(this).attr('action')
    review_id = $(this).find('#comment_review_id').val()
    content_review = $(this).find('textarea#comment_content').val()
    $('textarea#comment_content').val ''
    $.ajax
      url: url
      method: 'POST'
      cache: false
      data: comment:
        review_id: review_id
        content: content_review
      dataType: 'JSON'
      success: (result) ->
        if result.status == "created"
          $('.reviews_comments_'+review_id).append result.content
        else
          alert result.content
        return
      error: (er) ->
        alert "Error! Try again!"
    return
  return
