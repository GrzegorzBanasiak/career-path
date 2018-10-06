var btn = $('.btn-cv').on('click',()=>{
  var inputFirstname = $('.input-firstname');
  var inputSecondname = $('.input-secondname');
  var inputCity = $('.input-city');
  var inputEmail = $('.input-email');
  var inputPhonenumber = $('.input-phonenumber');
  var inputConsent = $('.input-consent');

  var listQuestionsForm = $('.list-of-questions');
  var listQuestions = [];

  for (var i = 0; i < listQuestionsForm.length; i++) {
    var questionId = listQuestionsForm[i].dataset.id;
    var isClosed = $('.question-is-closed-hidden' + questionId).val();

    if (isClosed == "open") {
      var option = $(".answer-option-input-for-" + questionId).val()
      listQuestions.push({questionId,option});

    } else {
      var optionID = $(".radio-input-for-" + questionId + ":checked" )[0].dataset.id;
      console.log(optionID);
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
})
