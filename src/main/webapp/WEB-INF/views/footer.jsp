<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css"  />
<footer>
           <a href="#" id="about">About OP.GG</a>
           <a href="#" id="history">로고 히스토리</a>
           <a href="" id="privacy">개인정보처리방침</a>
           <a href="" id="help">도움말</a>
           <a href="" id="alliance">제휴</a>
           <a href="" id="pid">문의 피드백</a>
           <a href="" id="hire">채용</a><br/>
          <div id="foot">  © 2020-2020 trollPolice.com isn’t endorsed by Riot Games and doesn’t reflect the views or opinions of Riot Games or anyone officially involved in producing or managing League of Legends. League of Legends and Riot Games are trademarks or registered trademarks of Riot Games, Inc. League of Legends © Riot Games, Inc. </div>
</footer>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(document).ajaxStart(function() {
    $(document.body).css({'cursor' : 'wait'});
}).ajaxStop(function() {
	$(document.body).css({'cursor' : 'default'});
});
</script>