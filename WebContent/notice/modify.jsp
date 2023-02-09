<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%-- <%@ include file="../includes/header.jsp" %> --%>
    

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Board Modify</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Board Modify Page
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
						
					<form role="form" action="/board/modify" method="post">	
					
<!-- 						Page 319 Criteria cri 처리 추가해줍니다. -->
						<input type="hidden" id="pageNum" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
						<input type="hidden" id="amount" name="amount" value='<c:out value="${cri.amount}"/>'>
						<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
						<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
						
						
						<div class="form-group">
							<label>Bno</label> <input class="form-control" name="bno" value='<c:out value="${board.bno}" />' readonly="readonly">
						</div>
						<div class="form-group">
							<label>Title</label> <input class="form-control" name="title" value='<c:out value="${board.title}" />'>
						</div>
						<div class="form-group">
							<label>Text area</label> 
							<textarea class="form-control" rows="3" name="content"><c:out value="${board.content}"/></textarea>
						</div>
						<div class="form-group">
							<label>Writer</label> <input class="form-control" name="writer" value='<c:out value="${board.writer}" />' readonly="readonly">
						</div>
						<div class="form-group">
							<label>RegDate</label> <input class="form-control" name="regdate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}" />' readonly="readonly">
						</div>
						
						<button type="submit" data-oper='modify' class="btn btn-default" onclick="location.href='/board/modify?bno=<c:out value="${board.bno}"/>'">Modify</button>	
						<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
						<button type="submit" data-oper='list' class="btn btn-info" onclick="location.href='/board/list'">List</button>
						
					</form>	
                </div>
                <!-- end /.panel-body -->
            </div>
            <!-- end /.panel -->
        </div>
        <!-- /.col-lg-6 -->
    </div>
    <!-- /.row -->
	
<script type="text/javascript">
	$(document).ready(function () {
		var formObj = $("form");
		$('button').on("click", function (e) {
			e.preventDefault();
			var operation = $(this).data("oper");
			console.log(operation);
			
			if (operation === 'remove') {
				formObj.attr("action", "/board/remove");
				
				// 만약 사용자가 'list' 버튼을 클릭한다면
			} else if (operation === 'list') {
				// move to list : 아래 두 줄 코딩
				// self.location = "/board/list";
				// return;
				
				// Page266 11.5.4 수정 페이지에서 링크 처리 소스 코딩 : 아래 두 줄
				formObj.attr("action", "/board/list").attr("method", "get");
				
				// <form> 태그에서 필요한 부분만 잠시 복사(clone)해서 보관해 두고,
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();
				
				// <form> 태그 내의 모든 내용은 지워버립니다(empty).
				formObj.empty();
				// 이후에 다시 필요한 태그들만 추가(append)해서 '/board/list'를 호출하는 형태로 구현합니다.
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
				
			}
			formObj.submit();
		})
	})	
</script>	
	
<%-- 	<%@ include file="../includes/footer.jsp" %> --%>
	