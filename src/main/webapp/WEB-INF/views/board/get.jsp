<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

<style>
  .uploadResult {
    width: 100%;
  }
  .uploadResult ul {
    display: flex;
    flex-flow: row;
    justify-content: center;
    align-items: center;
  }
  .uploadResult ul li {
    list-style: none;
    padding: 10px;
    align-content: center;
    text-align: center;
  }
  .uploadResult ul li img {
    width: 100px;
  }
  .uploadResult ul li span {
    color: white;
  }
  .bigPictureWrapper {
    position: absolute;
    display: none;
    justify-content: center;
    align-items: center;
    top: 0%;
    width: 100%;
    height: 100%;
    background-color: gray;
    z-index: 100;
    background: rgba(255, 255, 255, 0.5);
  }
  .bigPicture {
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .bigPicture img {
    width: 600px;
  }
</style>

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

      <div class="panel-heading">Files</div>
      <!-- panel-heading -->
      <div class="panel-body">
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

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading">
        <i class="fa fa-commnets fa-fw"></i>Reply
        <button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">
          New Reply
        </button>
      </div>
      <div class="panel-body">
        <ul class="chat"></ul>
      </div>
      <div class="panel-footer"></div>
      <!-- end panel-body -->
    </div>
    <!-- end panel panel-default -->
  </div>
  <!-- end col-lg-12 -->
</div>
<!-- end row -->

<!-- modal -->

<!-- Modal -->
<div
  class="modal fade"
  id="myModal"
  tabindex="-1"
  role="dialog"
  aria-labelledby="myModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button
          type="button"
          class="close"
          data-dismiss="modal"
          aria-hidden="true"
        >
          &times;
        </button>
        <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label>Reply</label>
          <input class="form-control" name="reply" value="New Reply!!!!" />
        </div>
        <div class="form-group">
          <label>Replyer</label>
          <input class="form-control" name="replyer" value="replyer" />
        </div>
        <div class="form-group">
          <label>Reply Date</label>
          <input class="form-control" name="replyDate" value="" />
        </div>
      </div>
      <div class="modal-footer">
        <button
          type="button"
          id="modalModBtn"
          class="btn btn-warning"
          data-dismiss="modal"
        >
          Modify
        </button>
        <button type="button" id="modalRemoveBtn" class="btn btn-danger">
          Remove
        </button>
        <button
          type="button"
          id="modalRegisterBtn"
          class="btn btn-primary"
          data-dismiss="modal"
        >
          Register</button
        ><button
          type="button"
          id="modalCloseBtn"
          class="btn btn-default"
          data-dismiss="modal"
        >
          Close
        </button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
  $(document).ready(function () {
    (function () {
      var bno = '<c:out value="${board.bno}"/>';

      $.getJSON("/board/getAttachList", { bno: bno }, function (arr) {
        console.log(arr);

        var str = "";
        $(arr).each(function (i, attach) {
          //image type
          if (attach.fileType) {
            var fileCallPath = encodeURIComponent(
              attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName
            );
            str +=
              "<li data-path='" +
              attach.uploadPath +
              "' data-uuid='" +
              attach.uuid +
              "' data-filename='" +
              attach.fileName +
              "' data-type='" +
              attach.fileType +
              "'><div>";
            str += "<img src='/display?fileName=" + fileCallPath + "'>";
            str += "</div>";
            str + "</li>";
          } else {
            str +=
              "<li data-path='" +
              attach.uploadPath +
              "' data-uuid='" +
              attach.uuid +
              "' data-filename='" +
              attach.fileName +
              "' data-type='" +
              attach.fileType +
              "'><div>";
            str += "<span> " + attach.fileName + "</span><br/>";
            str += "<img src='/resource/img/attach.png'>";
            str += "</div>";
            str + "</li>";
          }
        });

        $(".uploadResult ul").html(str);
      }); //end getJSON
    })();
  });
</script>

<script>
  $(document).ready(function () {
    var bnoValue = '<c:out value="${board.bno}"/>';
    var replyUL = $(".chat");
    showList(1);
    //댓글리스트 보여주기 기능
    function showList(page) {
      
      replyService.getList(
        { bno: bnoValue, page: page || 1 },
        function (replyCnt, list) {
          
          var str = "";
          if (list == null || list.length == 0) {
            return;
          }
          for (var i = 0, len = list.length || 0; i < len; i++) {
            str += "<li class='left clearfix' data-rno ='" + list[i].rno + "'>";
            str +=
              "<div><div class='header'><strong class='primary-font'>" +
              list[i].replyer +
              "</strong>";
            str +=
              "       <small class='pull-right text-muted'>" +
              replyService.displayTime(list[i].replyDate) +
              "</small></div>";
            str += "     <p>" + list[i].reply + "</p></div><li>";
          }
          replyUL.html(str);
          showReplyPage(replyCnt);
          0;
        }
      ); // end function
    } // end showList

    var modal = $(".modal");
    var modalInputReply = modal.find("input[name='reply']");
    var modalInputReplyer = modal.find("input[name='replyer']");
    var modalInputReplyDate = modal.find("input[name='replyDate']");

    var modalModBtn = $("#modalModBtn");
    var modalRemoveBtn = $("#modalRemoveBtn");
    var modalRegisterBtn = $("#modalRegisterBtn");
    //댓글 누를시 등록
    $("#addReplyBtn").on("click", function (e) {
      modal.find("input").val("");
      modalInputReplyDate.closest("div").hide();
      modal.find("button[id !='modalCloseBtn']").hide();
      modalRegisterBtn.show();

      $(".modal").modal("show");
    });
    //댓글 등록버튼
    modalRegisterBtn.on("click", function (e) {
      var reply = {
        reply: modalInputReply.val(),
        replyer: modalInputReplyer.val(),
        bno: bnoValue,
      };
      replyService.add(reply, function (result) {
        alert(result);

        modal.find("input").val("");
        modal.modal("hide");
		
        showList(1);
      });
    });
    //댓글 조회버튼 누를시 조회후 수정,삭제버튼 보임
    $(".chat").on("click", "li", function (e) {
      var rno = $(this).data("rno");
      replyService.get(rno, function (reply) {
        modalInputReply.val(reply.reply);
        modalInputReplyer.val(reply.replyer);
        modalInputReplyDate
          .val(replyService.displayTime(reply.replyDate))
          .attr("readonly", "readonly");
        modal.data("rno", reply.rno);
        modal.find("button[id !='modalCloseBtn']").hide();
        modalModBtn.show();
        modalRemoveBtn.show();

        $(".modal").modal("show");
      });
    });
    //댓글 수정버튼 누를시 수정
    modalModBtn.on("click", function (e) {
      var reply = { rno: modal.data("rno"), reply: modalInputReply.val() };

      replyService.update(reply, function (result) {
        alert(result);
        modal.modal("hide");
        showList(pageNum);
      });
    });
    //댓글 삭제버튼 누를시 삭제
    modalRemoveBtn.on("click", function (e) {
      var rno = modal.data("rno");

      replyService.remove(rno, function (result) {
        alert(result);
        modal.modal("hide");
        showList(pageNum);
      });
      /*  alert("삭제되었습니다");
      modal.modal("hide");
      showList(pageNum); */
    });

    var pageNum = 1;
    var replyPageFooter = $(".panel-footer");
    //댓글 번호 표시 기능
    function showReplyPage(replyCnt) {
      var endNum = Math.ceil(pageNum / 10.0) * 10;
      var startNum = endNum - 9;
      var prev = startNum != 1;
      var next = false;

      if (endNum * 10 >= replyCnt) {
        endNum = Math.ceil(replyCnt / 10.0);
      }
      if (endNum * 10 < replyCnt) {
        next = true;
      }
      var str = "<ul class='pagination pull-right'>";
      if (prev) {
        str +=
          "<li class='page-item'><a class='page-link' href='" +
          (startNum - 1) +
          "'>Previous</a></li>";
      }
      for (var i = startNum; i <= endNum; i++) {
        var active = pageNum == i ? "active" : "";

        str +=
          "<li class='page-item " +
          active +
          "'><a class='page-link' href='" +
          i +
          "'>" +
          i +
          "</a></li>";
      }
      if (next) {
        str +=
          "<li class='page-item'><a class='page-link' href='" +
          (endNum + 1) +
          "'>Next</a></li>";
      }
      str += "</ul></div>";

      replyPageFooter.html(str);
    }
    //댓글 페이지 번호 누를시 이동
    replyPageFooter.on("click", "li a", function (e) {
      e.preventDefault();
      console.log("page click");

      var targetPageNum = $(this).attr("href");

      console.log("targetPageNum: " + targetPageNum);

      pageNum = targetPageNum;
      showList(pageNum);
    });
  });
</script>

<!--ajax 테스트-
<script type="text/javascript">
  console.log("===============");
  console.log("JS TEST");

  var bnoValue = '<c:out value="${board.bno}"/>';
  //for replyService add test
  replyService.add(
    { reply: "JS Test", replyer: "tester", bno: bnoValue },
    function (result) {
      alert("RESULT: " + result);
    }
  );

  replyService.getList({ bno: bnoValue, page: 1 }, function (list) {
    for (var i = 0, len = list.length || 0; i < len; i++) {
      console.log(list[i]);
    }
  });

  replyService.remove(
    3,
    function (count) {
      console.log(count);
      if (count === "success") {
        alert("removed");
      }
    },
    function (err) {
      alert("ERROR...");
    }
  );

  replyService.update(
    {
      rno: 22,
      bno: bnoValue,
      reply: "Modified Reply....",
    },
    function (result) {
      alert("수정완료...");
    }
  );

  replyService.get(10, function (data) {
    console.log(data);
  });
</script>-->

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
