<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <title>예약페이지</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
      integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <link rel="stylesheet" href="../style/main.css" />
    <script src="../js/jquery-3.6.0.min.js"></script>

    <style>
      .main-navi {
        /* 화면상단에 붙어있는 포지션 */
        padding-right: 100px;
        position: sticky;
        top: 0;
        background-color: #f2bba7;
        width: 100%;
        height: 90px;
        padding: 5 70px;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }

      header {
        margin: 0px;
        padding: 0px;
      }
      .test {
        font-size: 100%;
        margin-left: 100px;
        margin-right: 100px;
      }

      .checkboxDescription {
        display: inline;
        font-size: 0.8em;
      }

      #paymentChoice {
        width: 400px;
        height: 30px;
      }
      #refund_notice {
        border: 1px solid black;
        width: 100%;
        height: 100px;
        overflow-y: scroll;
        font-size: 0.8em;
      }

      #charge_info {
        border: 1px solid black;
        width: 100%;
        height: 100px;
      }

      .agree {
        font-size: 0.8em;
      }

      #mandatory {
        font-size: 0.8em;
        color: blue;
      }

      #choice {
        font-size: 0.8em;
        color: gray;
      }
    </style>
  </head>
  <body>
    <nav class="main-navi">
      <div class="logo">
        <a href="index.html">
          <div class="logo">
            <img
              src="../img/logo.png"
              width="80px"
              height="80px"
              alt="잠자리"
              class="mx-2"
            />
          </div>
        </a>
      </div>
      <!-- <div class="search">
				  <button class="btn">
					  <div>검색 시작하기</div>
					  <div class="bicon">
						  <i class="fas fa-search"></i>
					  </div>
					  
				  </button>
			  </div> -->
    </nav>
    <div class="test">
      <br />
      <h2>예약정보</h2>
      <br />
      <p id="reservation_info">
        <b>날짜</b><br />
        입력받아온 데이터 필요<br /><br />
        <b>게스트</b><br />
        입력받아온 데이터 필요
      </p>
      <br />

      <hr />
      <br />
      <h2 style="display: inline">예약자 정보</h2>
      <p class="checkboxDescription">
        &nbsp;&nbsp;&nbsp;&nbsp;회원 정보와 일치할 시 체크
      </p>
      <!-- ☆ check시 회원정보 받아오는 기능 필요 -->
      <input type="checkbox" value="equalGuest_check" />

      <br /><br />
      <label>이름 : </label
      ><input
        type="text"
        name="name"
        placeholder="내용을 입력해주세요"
      /><br /><br />
      <label>휴대폰 번호 : </label
      ><input type="tel" name="tel" placeholder="내용을 입력해주세요" />
      <br /><br />

      <hr />
      <br />
      <h2>결제 수단</h2>
      <br />
      <form>
        <select id="paymentChoice">
          <!-- EditPayment design02 : 결제정보 수정 틀 디자인 -->
          <option value="card1">카드1</option>
          <option value="card2">카드2</option>
          <option value="card3">카드3</option>
        </select>
      </form>

      <br />
      <button onclick="discLink();">쿠폰/할인코드 입력</button>
      <br /><br />

      <hr />

      <br />
      <h2>환불정책</h2>
      <br />
      <div id="refund_notice">
        숙소 환불 정책<br />
        게스트가 전액 환불을 받을 수 있다고 할 때, '전액'은 숙박비를
        지칭합니다.에어비앤비 게스트 수수료 환불 여부는 여러 요인에 따라 달라질
        수 있습니다.<br />
        게스트가 체크인 전에 취소하면 호스트에게 청소비가 지급되지 않습니다.<br /><br />
        유연<br />
        게스트는 체크인 24시간 전까지 예약을 취소할 경우 전액 환불받을 수
        있으며, 호스트에게는 대금이 지급되지 않습니다.<br />
        그 후에 취소하는 경우, 이미 숙박한 일수와 하루치의 숙박비 전액이
        호스트에게 지급됩니다.<br /><br />
        일반<br />
        게스트가 체크인 5일 전까지 예약을 취소한다면 전액 환불받을 수 있으며,
        호스트에게는 대금이 지급되지 않습니다.<br />
        그 후에 취소하는 경우, 이미 숙박한 일수와 하루치의 숙박비 전액 및 남은
        숙박 일수에 대한 숙박비 50%가 호스트에게 지급됩니다.<br /><br />
        비교적 엄격<br />
        게스트는 체크인까지 30일 이상 남은 시점에 취소해야 전액 환불을 받을 수
        있습니다.<br />
        체크인까지 7~30일이 남은 시점에 예약을 취소하면, 숙박비 50%가 호스트에게
        지급됩니다.<br />
        체크인까지 7일이 채 남지 않은 시점에 예약을 취소하면, 숙박비 전액이
        호스트에게 지급됩니다.<br />
        또한 게스트가 예약 후 48시간 이내에 취소하는 경우, 체크인까지 14일 이상
        남았다면 전액 환불받을 수 있습니다<br /><br />
        엄격<br />
        게스트는 예약 후 48시간 이내에 취소하고 체크인까지 14일 이상이 남은
        경우에만 전액 환불을 받을 수 있습니다.<br />
        체크인까지 7~14일이 남은 시점에 예약을 취소하면, 숙박비 50%가 호스트에게
        지급됩니다.<br />
        그 후에 취소하는 경우, 숙박 대금 전액이 호스트에게 지급됩니다.<br /><br />
        장기 숙박<br />
        28박 이상의 예약에는 숙소의 표준 환불 정책이 아닌 에어비앤비 장기 숙박
        환불 정책이 적용됩니다.<br />
        <br />
        게스트는 예약 후 48시간 이내에 취소하고 체크인까지 28일 이상이 남은
        경우에만 전액 환불을 받을 수 있습니다.<br />
        그 후에 예약을 취소하는 경우, 이미 숙박한 날짜의 숙박비 전액과 추가
        30일에 대한 숙박비가 호스트에게 지급됩니다.<br />
        게스트가 예약을 취소하는 시점에 남은 숙박 일수가 30일 미만이라면, 남은
        숙박일 전체에 대한 숙박비가 호스트에게 지급됩니다.<br /><br />
        환불 불가 옵션<br />
        일부 호스트는 수입 증대를 위해 숙소에 환불 불가 옵션을 적용하기도
        합니다.<br />
        <br />
        매우 엄격 30일 및 매우 엄격 60일<br />
        이 정책은 특수한 경우에 에어비앤비가 허용하는 호스트만 사용할 수
        있습니다.
      </div>
      <br />
      <p class="checkboxDescription">취소 및 환불규칙에 동의</p>
      <input type="checkbox" value="refund_check" />
      <br /><br />

      <hr />
      <br />
      <h2>요금 세부 정보</h2>
      <br />
      <!-- 이부분 수정 필요 -->
      <div id="charge_info">
        숙박비<br />
        할인<br />
        <hr />
        총 합계
      </div>
      <br />

      <hr />

      <br />

      <!-- ★ [필수]/[선택]을 뒤에 바로 붙이고싶은데 잘 안되네요ㅠㅠ -->
      <input type="checkbox" id="all" onclick="selectAll();" /> 전체동의
      <hr width="50%" align="left" />
      <input type="checkbox" id="age14" name="agree" onclick="selectOne();" />만
      14세 이상 이용 동의
      <p id="mandatory">[필수]</p>
      <br />
      <input
        type="checkbox"
        id="personalInfo_collect"
        name="agree"
        onclick="selectOne();"
      />
      개인정보 수집 및 이용 동의
      <p id="mandatory">[필수]</p>
      <br />
      <input
        type="checkbox"
        id="3rdPartyConsent"
        name="agree"
        onclick="selectOne();"
      />
      개인정보 제 3자 제공 동의
      <p id="mandatory">[필수]</p>
      <br />
      <input
        type="checkbox"
        id="Accommodation_use"
        name="agree"
        onclick="selectOne();"
      />
      숙소 이용 규칙 동의
      <p id="mandatory">[필수]</p>
      <br />
      <input
        type="checkbox"
        id="eventSms"
        name="agree"
        onclick="selectOne();"
      />
      이메일 알림 메일 및 SMS수신
      <p id="choice">[선택]</p>
      <br />
      <br />

      <button onclick="reservationPayment()">확인 및 결제</button>

      <script>
        var all = document.getElementById("all");
        var agree = document.getElementsByName("agree");

        function selectAll() {
          if (all.checked) {
            for (var i = 0; i < agree.length; i++) {
              agree[i].checked = true;
            }
          } else {
            for (var i = 0; i < agree.length; i++) {
              agree[i].checked = false;
            }
          }
        }

        function selectOne() {
          var count = 0;

          for (var i = 0; i < agree.length; i++) {
            if (agree[i].checked) {
              count++;
            }
          }

          if (count != 5) {
            all.checked = false;
          } else {
            all.checked = true;
          }
        }

        function discLink() {
          window.open("", "width=300, height=400");
        }

        function reservationPayment() {
          var result = window.confirm("예약을 완료하시겠습니까?");

          if (result) {
            alert("예약이 완료되었습니다.");
          } else {
            alert("예약이 취소되었습니다.");
          }
        }
      </script>
    </div>
  </body>
</html>
