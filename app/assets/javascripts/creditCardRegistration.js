// カスタムフォーム用
// $(function() {

//   var form = $("#new_user");

//   form.submit(function() {
//     var card = {
//         number:    $(".number").val(),
//         exp_month: $(".exp_month").val(),
//         exp_year:  20 + $(".exp_year").val(),
//         cvc:       $(".cvc").val()
//     };
//     Payjp.createToken(card, function(s, response) {
//       $(".number").removeAttr("name");
//       $(".exp_month").removeAttr("name");
//       $(".exp_year").removeAttr("name");
//       $(".cvc").removeAttr("name");

//       var token = response.id;

//       form.append($('<input type="hidden" name="payjp_token">').val(token));

//       form.get(0).submit();
//     });
//   });
// });
