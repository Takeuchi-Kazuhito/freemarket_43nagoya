$(document).on('turbolinks:load', function() {
  var maxNum = 9999999;
  var minNum = 300;
  var rate = 0.1;
  $("#sell-price").on("keyup", function(){
    var str = $(this).val();
    var num = Number(str.replace(/[^0-9]/g));
    if(num >= minNum && num <= maxNum){
      var price = Math.floor(num * rate).toLocaleString();
      var other_price = Math.floor(num * rate);
      var profits = Math.floor(num - other_price).toLocaleString();
      $("#commission").text("¥" + price);
      $("#profits").text("¥" + profits);
    }
    else if(num < minNum || num > maxNum){
      $("#commission").text("-");
      $("#profits").text("-");
    }
  });
});
