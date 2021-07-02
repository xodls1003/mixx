<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
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
            <input class="form-control" name='bno'
                value='<c:out value="${board.bno}"/>' readonly="readonly">
          </div>
          <div class="form-group">
            <label>Title</label>
            <input name='title' value='<c:out value="${board.title}"/>' class="form-control" readonly="readonly">
          </div>
          <div class="form-group">
            <label>Text area</label>
            <textarea name='content' rows="3" class="form-control" readonly="readonly"><c:out value="${board.content}"/></textarea>
          </div>
          <div class="form-group">
            <label>Writer</label>
            <input name='writer' class="form-control" value='<c:out value="${board.content}" />' readonly="readonly">
          </div>
          <button data-oper='modify' class="btn btn-default">Modify</buttn>
          <button data-oper='list' class="btn btn-info">List</buttn>
        
      </div>
      <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<%@include file="../includes/footer.jsp" %>
