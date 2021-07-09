<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board Read</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading">Board Read</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
        <div class="form-group">
          <label>Bno</label>
          <input
            class="form-control"
            name="bno"
            value='<c:out value="${board.bno}"/>'
            readonly="readonly"
          />
        </div>
        <div class="form-group">
          <label>Title</label>
          <input
            name="title"
            value='<c:out value="${board.title}"/>'
            class="form-control"
            readonly="readonly"
          />
        </div>
        <div class="form-group">
          <label>Text area</label>
          <textarea
            name="content"
            rows="3"
            class="form-control"
            readonly="readonly"
          >
<c:out value="${board.content}"/></textarea
          >
        </div>
        <div class="form-group">
          <label>Writer</label>
          <input
            name="writer"
            class="form-control"
            value='<c:out value="${board.content}" />'
            readonly="readonly"
          />
        </div>
        <button data-oper="modify" class="btn btn-default">Modify</button>
        <button
          data-oper="list"
          class="btn btn-info"
          onclick="location.href='/board/list'"
        >
          List
        </button>

        <form id="operForm" action="/board/modify" method="GET">
          <input
            type="hidden"
            id="bno"
            name="bno"
            value='<c:out value="${board.bno}"/>'
          />
          <input
            type="hidden"
            name="pageNum"
            value='<c:out value="${cri.pageNum}"/>'
          />
          <input
            type="hidden"
            name="amount"
            value='<c:out value="${cri.amount}"/>'
          />
          <input
            type="hidden"
            name="startNum"
            value='<c:out value="${cri.startNum}"/>'
          />
          <input
            type="hidden"
            name="keyword"
            value='<c:out value="${cri.keyword}"/>'
          />
          <input
            type="hidden"
            name="type"
            value='<c:out value="${cri.type}"/>'
          />
        </form>
      </div>
      <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<!--사용자가 수정 버튼 클릭시 operForm의 id를 가진 form 태크를 전송 
        수정 버튼 누를때 bno 같이 전달 후 form태그를 submit
        리스트 이동시에는 아무런 데이터도 필요하지 않으므로 form태그내의 bno태그를 지우고 submit을 통해 리스트 페이지로 이동-->

<script type="text/javascript">
  $(document).ready(function () {
    var operForm = $("#operForm");

    $("button[data-oper='modify']").on("click", function (e) {
      operForm.attr("action", "/board/modify").submit();
    });

    $("button[data-oper='list']").on("click", function (e) {
      operForm.find("#bno").remove();
      operForm.attr("action", "/board/list");
      operForm.submit();
    });
  });
</script>

<%@include file="../includes/footer.jsp" %>
