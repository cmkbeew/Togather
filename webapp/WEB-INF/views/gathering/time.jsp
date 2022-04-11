<%@ page contentType="text/html;charset=utf-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
	function remaindTime() {
    var now = new Date();
    var end = new Date(now.getFullYear(),now.getMonth(),now.getDate(),21,00,00);
    var open = new Date(now.getFullYear(),now.getMonth(),now.getDate(),09,00,00);
  	
    var nt = now.getTime();
    
    var ot = open.getTime();
    var et = end.getTime();
    /*console.log("now: "+now);
    console.log("end: "+end);
    console.log("open: "+open);*/
   if(nt<ot){
     $(".time").fadeIn();
     $("p.time-title").html("금일 오픈까지 남은 시간");
     sec =parseInt(ot - nt) / 1000;
     day  = parseInt(sec/60/60/24);
     sec = (sec - (day * 60 * 60 * 24));
     hour = parseInt(sec/60/60);
     sec = (sec - (hour*60*60));
     min = parseInt(sec/60);
     sec = parseInt(sec-(min*60));
     if(hour<10){hour="0"+hour;}
     if(min<10){min="0"+min;}
     if(sec<10){sec="0"+sec;}
      $(".hours").html(hour);
      $(".minutes").html(min);
      $(".seconds").html(sec);
   } else if(nt>et){
    $("p.time-title").html("금일 마감");
    $(".time").fadeOut();
   }else {
       $(".time").fadeIn();
     $("p.time-title").html("금일 마감까지 남은 시간");
     sec =parseInt(et - nt) / 1000;
     day  = parseInt(sec/60/60/24);
     sec = (sec - (day * 60 * 60 * 24));
     hour = parseInt(sec/60/60);
     sec = (sec - (hour*60*60));
     min = parseInt(sec/60);
     sec = parseInt(sec-(min*60));
     if(hour<10){hour="0"+hour;}
     if(min<10){min="0"+min;}
     if(sec<10){sec="0"+sec;}
      $(".hours").html(hour);
      $(".minutes").html(min);
      $(".seconds").html(sec);
      console.log("span:te " +$('#timediv').children('span').text());
   }
 }
 setInterval(remaindTime,1000);
 </script>
</head>
<body>
	<div class="sec7-text-box">
  <p class="font18">오늘의 운영시간</p>
  <p class="runTimeCon font25">PM 09:00 ~ PM 09:00 </p>
  <hr/>
  <p class="font15 time-title">금일 마감까지 남은 시간</p>
  <div id="timediv" class="time font40">
    <span class="hours"></span>
    <span class="col">:</span>
    <span class="minutes"></span>
    <span class="col">:</span>
    <span class="seconds"></span>
  </div>

</div>
</body>
</html>
