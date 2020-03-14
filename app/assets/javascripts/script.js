$(function() {
 
  $('#back a').on('click',function(){
    $('body, html').animate({
      scrollTop:0
    }, 800);
      return false;
  });
 
});

$(document).ready(function() {
 $("p").css("color", "blue");
});

$(function(){
  $('いいねボタン').on('click',function(){
　　　$.ajax({
    　　  url: '/likes/'+ ポストID + '/create',　　//←createメソッドのURL
    　　  type:'POST',
  　  }).done(function(data){
     　　//ボタンの色を変える処理
   　 });
  　});
});
createメソ