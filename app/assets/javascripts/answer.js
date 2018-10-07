//= require jquery
//= require ajax-setup

var btn = $('.btn-cv').on('click',()=>{
  var inputFirstname = $('.input-firstname');
  var inputSecondname = $('.input-secondname');
  var inputCity = $('.input-city');
  var inputEmail = $('.input-email');
  var inputPhonenumber = $('.input-phonenumber');
  var inputConsent = $('.input-consent');

  var listQuestionsForm = $('.list-of-questions');
  var listQuestions = [];


  //for all additional questions
  for (var i = 0; i < listQuestionsForm.length; i++) {
    var questionId = listQuestionsForm[i].dataset.id;
    var isClosed = $('.question-is-closed-hidden' + questionId).val();

    if (isClosed == "open") {
      //get value fom open answer
      var option = $(".answer-option-input-for-" + questionId).val()
      listQuestions.push({questionId,option});

    } else {
      //get value fom clesed answer
      if ($(".radio-input-for-" + questionId + ":checked" )[0]) {
        var optionID = $(".radio-input-for-" + questionId + ":checked" )[0].dataset.id;
      } else {
        optionID = false
      }
      listQuestions.push({questionId,optionID});
    }

  }

  myData = {
      firstname: inputFirstname.val(),
      secondname: inputSecondname.val(),
      city: inputCity.val(),
      email: inputEmail.val(),
      phonenumber: inputPhonenumber.val(),
      is_consant: inputConsent[0].checked,
      questions: listQuestions,
    }


  console.log(myData);
  var formID = $('.input-with-form-id').val();

  $.ajax({
    type: "POST",
    url: "/forms/" + formID + "/answers",
    data: myData,
    success: function(data, textStatus, jqXHR){console.log("aja poszedl")},
    error: function(jqXHR, textStatus, errorThrown){alert("Coś poszło nie takm skontaktuj się z administratorem")}
  })


  // /////// if all params ok send ajax ///////
  //
  // if (inputFirstname && inputSecondname && inputCity && inputEmail && inputPhonenumber && inputConsent[0].checked){
  //   console.log("all ok");
  // } else {
  //   alert("Uzupelnij wszystkie wymagane pola");
  // }

})

// function setAndValidate(inputDataClass,minLength,maxLength){
//   var date = $(inputDataClass);
//   if ( ( date.val().length >= minLength) && (date.val().length <= maxLength) ){
//     date[0].style.borderBottom = "1px solid #a6a6a6";
//     return date.val()
//   } else {
//     date[0].style.borderBottom = "2px solid red";
//     return false
//   }
// }

// function validateOptions(value){
//   if (value.length > 1) {
//     return value
//   } else {
//     return false
//   }
// }
