<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">게시판 글 조회</h3>
				</div>
				<!-- /.box-header -->
				
				<!-- 바디  -->
				 <div class="box-body">
				 	<table class="table table-bodered">
				 		<tr>
				 			<th>번호</th>
				 			<th>글쓴이</th>
				 			<th>제목</th>
				 			<th>내용</th>
				 			<th>작성일</th>
				 			<th>조회수</th>
				 		</tr>
				 		<c:forEach var="i" items="${boardList }">
				 		<tr>
				 			<td>${i.bnum }</td>
				 			<td>${i.mname }</td>
				 			<td><a href="/board/read?bno=${i.bnum }">${i.btitle }</a></td>
				 			<td>${i.bcontent }</td>
				 			<td><fmt:formatDate value="${i.rdate }" pattern="yyyy-MM-dd (E) HH:mm" /></td>
				 			<td><span class="badge bg-red">${i.bview }</span></td>
				 		</tr>
				 		</c:forEach>
				 	</table>
				 </div>
				 
				 <div class="box-footer">
				 	<div class="text-center">
				 		<ul class="pagination">
				 			<!-- 이전prev -->
				 			<c:if test="${pm.prev }">
				 				<li><a href="listPage?page=${pm.startPage-1}">Previous</a></li>
				 			</c:if>
				 			<!-- 페이지블럭 -->
							<c:forEach var="idx" begin="${pm.startPage }" end="${pm.endPage }">
								<!-- 삼항연산자를 사용해서 class로 스타일적용  -->
					 			<li ${pm.cri.page == idx? 'class=active':''}>
					 				<a href="listPage?page=${idx }">${idx}</a>
					 			</li>				
							</c:forEach>
				 			<!-- 다음next -->
				 			<c:if test="${pm.next && pm.endPage > 0}">
				 				<li><a href="listPage?page=${pm.endPage+1}">Next</a></li>
				 			</c:if>
				 		</ul>
				 	</div>
				 </div>
				
				<!-- 바디 끝 -->
			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->
	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script type="text/javascript">
	let result="${result}";
	let isResist = "${isRegist}";
	
	if(result == 'success' && isResist == 'true'){
		alert('성공적으로 글 작성되었습니다.');
	}else if(result == 'success' && isResist != 'true'){
		alert('글쓰기가 실패하였습니다.');
	}else if(result =='up-ok'){
		alert('성공적으로 글이 수정되었습니다.');
	}else if(result =='delete-ok'){
		alert('성공적으로 글이 삭제되었습니다.');
	}else{
		//글쓰기없이 출력시 alert창 필요없음
	}
</script>