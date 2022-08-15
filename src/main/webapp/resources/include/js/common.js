function chkSubmit(item, msg) {
	if (item.val().replace(/\s/g, "") == "") {
		alert(msg + "입력해 주세요.");
		item.val("");
		item.focus();
		return false;
	} else { return true; }
}

//함수명: chkSubmit(유효성 체크 대상, 메시지 내용)
//출력영역: alert
//예시: if(!chkSubmit($('#keyword'), "검색어를")) return;*/

function chkData(item, msg) {
	if ($(item).val().replace(/\s/g, "") == "") {
		alert(msg + "입력해 주세요.");
		$(item).val("");
		$(item).focus();
		return false;
	} else { return true; }
}

function chkDataFile(item, msg) {
	if ($(item).val().replace(/\s/g, "") == "") {
		alert(msg);
		$(item).val("");
		$(item).focus();
		return false;
	} else { return true; }
}

//유효성 체크 대상, 출력 영역, 메시지 내용
function dataCheck(item, out, msg) {
	if ($(item).val().replace(/\s/g, "") == "") {
		$(out).html(msg + "입력해 주세요");
		$(item).val("");
		return false;
	} else { return true; }
}

//유효성 체크 대상, 출력 영역, 메시지 내용
function formCheck(main, item, msg) {
	if ($(main).val().replace(/\s/g, "") == "") {
		$(item).css("color","#000099").html(msg + "입력해 주세요");
		$(main).val("");
		return false;
	} else { return true; }
}
//이미지 파일 여부를 확인하기 위해 확장자 확인
//배열내의 값을 찾아서 인덱스를 반환(요소가 없을 경우 -1)
//jQuery.inArray(찾을 값, 검색 대상의 배열)
function chkFile(item){
	let ext = item.val().split('.').pop().toLowerCase();
	if(jQuery.inArray(ext,['gif','png','jpg','jpeg']) == -1){
		alert('gif, png, jpg, jpeg 파일만 업로드 할 수 있습니다.');
		item.val("");
		return false;
	}else{return true;}
}

function checkForm(item,msg){
	let message ="";
	if($(item).val().replace(/\s/g,"")==""){
		message =msg +"입력해 주세요";
		$(item).attr("placeholder",message);
		return false;
	}else{
		return true;
	}	
}
