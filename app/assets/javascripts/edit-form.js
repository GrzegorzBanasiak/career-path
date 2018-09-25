//= require jquery
//= require ajax-setup

$('.new-form-option-questions button').on('click',(event)=>{
  var contents = $('.question-content').val();
  var btnValue = validateQuestionValue(event.target.value);
  var formID = $('.input-with-id-form').val();
  var isNecessary = $('.is_necessary').is(":checked");

  if (validateQuestionContent(contents)) {
    myData = {
      question:{
        content:contents,
        is_closed:btnValue,
        form_id:formID,
        necessary:isNecessary,
      }
    }

    $.ajax({
      type: "POST",
      url: "/questions",
      data: myData,
      success: function(data, textStatus, jqXHR){buildQuestion(data)},
      error: function(jqXHR, textStatus, errorThrown){console.log(errorThrown);}
    })

  } else {
    alert('Pytanie musi mieć od 5 do 150 znaków!')
  }
});



function validateQuestionContent(contents){
  if (contents.length >= 5 && contents.length <= 150){
    return true;
  } else {
    return false;
  }
}

function validateQuestionValue(value){
  if (value == "true") {
    return true;
  } else if (value == "false") {
    return false;
  }
}


function buildQuestion(data){
  var questionsList = $('.new-questions-list').prepend(data.html_data);
}
