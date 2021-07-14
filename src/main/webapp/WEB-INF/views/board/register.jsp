<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board Register</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading">Board Register</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
        <form role="form" action="/board/register" method="POST">
          <div class="form-group">
            <label>Title</label>
            <input name="title" class="form-control" />
          </div>
          <div class="form-group">
            <label>Text area</label>
            <textarea name="content" rows="3" class="form-control"></textarea>
          </div>
          <div class="form-group">
            <label>Writer</label>
            <input name="writer" class="form-control" />
          </div>
          <button type="submit" class="btn btn-default">Submit Button</button>
          <button type="reset" class="btn btn-default">Reset Button</button>
        </form>
      </div>
      <!-- /.panel-body -->
      <div class="panel-heading">File Attach</div>
      <div class="panel-body">
        <div class="form-group uploadDiv">
          <input type="file" name="uploadFile" multiple />
        </div>
        <div class="uploadResult">
          <ul></ul>
        </div>
      </div>
    </div>
    <!-- /.panel -->
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<script>
  $(document).ready(function (e) {
    var formObj = $("form[role='form']");
    $("button[type='submit']").on("click", function (e) {
      e.preventDefault();

      console.log("submit clicked");
    });
    var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
    var maxSize = 5242880;

    function checkExtension(fileName, fileSize) {
      if (fileSize >= maxSize) {
        alert("파일 사이즈 초과");
        return false;
      }
      if (regex.test(fileName)) {
        alert("해당 종류의 파일은 업로드할 수 없습니다.");
        return false;
      }
      return true;
    }
    $("input[type='file']").change(function (e) {
      var formData = new FormData();
      var inputFile = $("input[name='uploadFile']");

      var files = inputFile[0].files;
      for (var i = 0; i < files.length; i++) {
        if (!checkExtension(file[i].name, files[i].size)) {
          return false;
        }
        formData.append("uploadFile", files[i]);
      }
      $.ajax({
        url: "/uploadAjaxAction",
        processData: false,
        contentType: false,
        data: formData,
        dataType: "json",
        success: function (result) {
          console.log(result);
        },
      });
    });
  });
</script>

<%@include file="../includes/footer.jsp" %>
