<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@include file="../includes/header.jsp" %>

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
                            <div class="panel-heading">Board Modify</div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <form role="form" action="/board/modify" method="POST">
                                	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'/>
                                    <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'/>
                                    <input type="hidden" name="startNum" value='<c:out value="${cri.startNum}"/>'/>
                                    <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'/>
                                    <input type="hidden" name="type" value='<c:out value="${cri.type}"/>'/>
                                    <div class="form-group">
                                        <label>Bno</label>
                                        <input class="form-control" name='bno' value='<c:out value="${board.bno}"/>'
                                            readonly="readonly">
                                    </div>
                                    <div class="form-group">
                                        <label>Title</label>
                                        <input name='title' value='<c:out value="${board.title}"/>'
                                            class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Text area</label>
                                        <textarea name='content' rows="3"
                                            class="form-control"><c:out value="${board.content}"/></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Writer</label>
                                        <input name='writer' class="form-control"
                                            value='<c:out value="${board.content}" />' readonly="readonly">
                                    </div>
                                    <div class="form-group">
                                        <label>RegDate</label>
                                        <input name='regDate' class="form-control"
                                            value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}" />'
                                            readonly="readonly">
                                    </div>
                                    <div class="form-group">
                                        <label>updateDate</label>
                                        <input name='updateDate' class="form-control"
                                            value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.updateDate}" />'
                                            readonly="readonly">
                                    </div>


                                    <button data-oper='modify' class="btn btn-default"
                                        onclick="location.href='/board/modify?bno=<c:out value=" ${board.bno}" />'">
                                    Modify</button>
                                    <button type="submit" data-oper="remove" class="btn btn-danger">Remove</button>
                                    <button data-oper='list' class="btn btn-info"
                                        onclick="location.href='/board/list'">List</button>
                                </form>
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
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
                            } else if (operation === 'list') {
                                //move to list
                                formObj.attr("action", "/board/list").attr("method", "get");
                                var pageNumTag = $("input[name='pageNum']").clone();
                                var amountTag = $("input[name='amount']").clone();
                                var startNumTag = $("input[name='startNum']").clone();
                                var keywordTag = $("input[name='keyword']").clone();
                                var typeTag = $("input[name='type']").clone();

                                formObj.empty();
                                formObj.append(pageNumTag);
                                formObj.append(amountTag);
                                formObj.append(startNumTag);
                                formObj.append(keywordTag);
                                formObj.append(typeTag);

                            }
                            formObj.submit();

                        });
                    });
                </script>
                <%@include file="../includes/footer.jsp" %>