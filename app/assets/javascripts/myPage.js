$(document).on('turbolinks:load', function(){

var todo_show         = $('.myPage__content__top__container__todo__show')
var notice_show       = $('.myPage__content__top__container__notice__show')
var purchase_show   = $('.myPage__content__top__container__purchase__show')
var purchased_show  = $('.myPage__content__top__container__purchased__show')
var todo_display      = $('.myPage__content__top__container__tab__todo--display')
var notice_display    = $(".myPage__content__top__container__tab__notice--display")
var purchase_display  = $('.myPage__content__bottom__container__tab__purchase--display')
var purchased_display = $('.myPage__content__bottom__container__tab__purchased--display')

  //sideBar

  $(".myPage__sideBar__myList--events").on("mouseover", function(){
    $(this).css("background-color","#fafafa");
    $(this).find(".sideBar-icon").css("color", "black");
    $(this).find(".sideBar-icon").css("transform", "translateX(3px)");
  }).on("mouseout", function(){
    $(this).css("background-color","#fff");
    $(this).find(".sideBar-icon").css("color", "#ccc");
    $(this).find(".sideBar-icon").css("transform", "translateX(0px)");
  });

//main

  todo_display.click(function(){
    todo_show.show();
    notice_show.hide();
    $(this).addClass("myPage__content--tabColor");
    notice_display.removeClass("myPage__content--tabColor");
  });

  notice_display.click(function(){
    notice_show.show();
    todo_show.hide();
    $(this).addClass("myPage__content--tabColor");
    todo_display.removeClass("myPage__content--tabColor");
  });


  purchased_display.click(function(){
    purchased_show.show();
    purchase_show.hide();
    $(this).addClass("myPage__content--tabColor");
    purchase_display.removeClass("myPage__content--tabColor");
  });

  purchase_display.click(function(){
   purchase_show.show();
   purchased_show.hide();
   $(this).addClass("myPage__content--tabColor");
   purchased_display.removeClass("myPage__content--tabColor");
  });
});
