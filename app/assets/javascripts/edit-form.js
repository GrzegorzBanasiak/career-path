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
      error: function(jqXHR, textStatus, errorThrown){alert("Coś poszło nie takm skontaktuj się z administratorem")}
    })
  $('.question-content').val("");
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
  $('.question-content').val("");
}


function deleteQuestion(questionID){
  console.log(questionID);
}

// Delete Question //// Delete Question //// Delete Question //

$(document).on('click', '.span-delete-from-list', (event)=> {
  var parentElement = event.target.parentElement.parentElement;
  var questionID = event.currentTarget.dataset.id;

  if (confirm("Czy na pewno usunąć?")) {
    $.ajax({
      type: "DELETE",
      url: "/questions/" + event.currentTarget.dataset.id,
      success: function(data, textStatus, jqXHR){parentElement.remove()},
      error: function(jqXHR, textStatus, errorThrown){alert("Coś poszło nie takm skontaktuj się z administratorem")}
    })
  }
})

// Add Option for Question //// Add Option for Question //// Add Option for Question //

$(document).on('click',".btn-add-option-for-question", (event)=>{
  var questionID = event.currentTarget.dataset.questionId;
  var optionList = $(".question-nr-" + questionID.toString());
  var inputValue = $(".input-for-option-nr-"+ questionID.toString());

  myData = {
    question_option:{
      content:inputValue.val(),
      question_id:questionID,
    }
  }

  if (inputValue.val() != "") {
    $.ajax({
      type: "POST",
      url: "/questions/" + questionID + "/add_option",
      data: myData,
      success: function(data, textStatus, jqXHR){optionList.append(data.html_data)},
      error: function(jqXHR, textStatus, errorThrown){alert("Coś poszło nie takm skontaktuj się z administratorem")}
    })
  inputValue.val("");
  } else (
    alert("Nie może być puste")
  )

})

// Remove Option for Question //// Remove Option for Question //// Remove Option for Question //

$(document).on('click', '.span-option-delete', (event)=>{
  var optionID = event.currentTarget.dataset.id;
  var questionID = event.currentTarget.dataset.questionId;
  var parentElement = event.target.parentElement;

  myData = {
    option_id: optionID,
  }

  $.ajax({
      type: "DELETE",
      url: "/questions/" + questionID + "/remove_option",
      data: myData,
      success: function(data, textStatus, jqXHR){parentElement.remove();},
      error: function(jqXHR, textStatus, errorThrown){alert("Coś poszło nie takm skontaktuj się z administratorem")}
  })

})


//update consent for form////update consent for form////update consent for form////update consent for form//

var btnForConsent = $('.btn-for-consent').on('click',(event)=>{
  var textareaConsent = $('.form-edit-text-field-for-consent').val();

  myData = {
    consent: textareaConsent,
  }

  $.ajax({
    type:"PUT",
    url: "/forms/" + event.currentTarget.dataset.id + "/change_consent",
    data: myData,
    success: function(data, textStatus, jqXHR){console.log("poszlo ok")},
    error: function(jqXHR, textStatus, errorThrown){alert("Coś poszło nie takm skontaktuj się z administratorem")}
  })
})
