<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/octicons/3.3.0/octicons.min.css"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=714989160c4bbb672f636a880c6c8328"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>

<style>
/* 헤더 및 sideBar 부분 스타일 - 건들지 말것 */
* {
	box-sizing: border-box;
	padding: 0px;
}

.body {
	margin: auto;
}

.sideList {
	border: 1px solid black;
}

/* 하단부터 메인부분 스타일 작성 요망 */
/* #map {
    width:100%;
    height: 40vw;
} */

</style>
</head>
<body>
	<div class="container-fluid themed-container m-0 g-0">
		<!-- 헤더부분 건들지 말것 -->
		<jsp:include page="/page/header.jsp" flush="false"></jsp:include>



		<!-- body 부분 row div 건들지 말것 -->
		<div class="row g-0 justify-content-center body">
			<!-- sideBar부분 건들지 말것 -->
			<jsp:include page="/page/sideBar.jsp" flush="false"></jsp:include>

			<div class="col-12 col-lg-9 g-0 themed-grid-col bodyContents">
				<!-- Main 내용 부분 하단부터 수정 요망 -->
				<form id="addForm" action="/register.store" method="post"  enctype="multipart/form-data">
					<div class="row">
						<div class="col-12">
							이미지 등록
							<button type="button" id="btn_image_add" class="btn btn-outline-secondary">+</button>
						</div>
						<div class="col-12">
							<fieldset>
								<legend>image list</legend>
								<!-- 여기에 name이 image0, image1 식의 name으로 file input 추가됨. 보내기 직전 name 태그 붙이기 시작. -->
								<div id="img_field"></div>
								<!-- <input type="text" name="imgLength" style="display: none;"> -->
							</fieldset>
						</div>
					</div>
					<div class="row contents">
						<div class="col-12 col-lg-4">
							<div class="row">
								<div class="col-12">지도 마커 설정</div>
								<div class="col-12 content">
									<div id="map" class="ratio ratio-1x1"></div>
									<div class="mapInfo">
										<input type="text" name="mapLat" style="display:none;" readonly>
                                        <input type="text" name="mapLng" style="display:none;" readonly>
										<div class="row">
											<div class="col-12">
												<div class="input-group">
													<span class="input-group-text">거리(M)</span>
													<input type="text" name="mapDistance" class="form-control" readonly>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12 col-lg-8">
							<div class="row">
								<div class="col-12">
									<fieldset>
										<legend>가게 상세 정보 입력</legend>
										<div class="row">
											<div class="col-12">
												<div class="input-group">
													<span class="input-group-text">가게 이름</span>
													<input type="text" class="form-control" name="storeName" placeholder="가게 이름을 입력해주세요">
												</div>
											</div>
											<div class="col-12">
												<div class="input-group">
													<span class="input-group-text">가게 주소</span>
													<input type="text" class="form-control" name="storeAddress" placeholder="가게 주소를 입력해주세요">
												</div>
											</div>
											<div class="col-12">
												<div class="input-group">
													<span class="input-group-text">가게 카테고리</span>
													<select type="text" class="form-select" name="storeCategory">
														<option>한식</option>
														<option>양식</option>
														<option>중식</option>
														<option>일식</option>
														<option>아시안</option>
														<option>디저트</option>
														<option>음료</option>
														<option>패스트푸드</option>
														<option>기타</option>
													</select>
												</div>
											</div>
											<div class="col-12">가게 소개</div>
											<div class="col-12">
												<textarea id="editor" name="storeIntroduction"></textarea>
											</div>
										</div>
									</fieldset>
								</div>
							</div>
						</div>
					</div>
					<button class="btn btn-secondary" type="submit">완료</button>
				</form>

				<script>
					//에디터 관리
					ClassicEditor
						.create(document.querySelector("#editor"),{
                            toolbar:['heading', '|', 'bold', 'italic', 'bulletedList', 'numberedList','insertTable', 'blockQuote', 'undo', 'redo', ]
                        })
						.then(function (editor) {
							const toolbarElement = editor.ui.view.toolbar.element;
						})
						.catch(error => { console.error(error) });


                //지도 관리
                let isMapAdded = false;
                let mapContainer = document.getElementById("map");
                let options = {
                    center: new kakao.maps.LatLng(37.567944388923316, 126.98295041529863),
                    level: 3
                };
                let map = new kakao.maps.Map(mapContainer, options);
                let marker = null;
                kakao.maps.event.addListener(map, "click", function (e) {
                	if(marker != null){
                		marker.setMap(null);
                	}
                    if(!isMapAdded){
                        isMapAdded=true;
                    }
                    let pos = e.latLng;
                    marker = new kakao.maps.Marker({
                        position: pos
                    });
                    let lat = pos.toString().split(',')[0].split('(')[1],
                        lng = pos.toString().split(',')[1].split(')')[0];
                    $("input[name=mapLat]").val(lat);
                    $("input[name=mapLng]").val(lng);
                    marker.setMap(map);

                    let dLat = (37.567944388923316 - lat) * (Math.PI/180);
                    let dLng = (126.98295041529863 - lng) * (Math.PI/180);
                    let a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(37.567944388923316 * (Math.PI/180)) * Math.cos(lat * (Math.PI/180)) * Math.sin(dLng/2) * Math.sin(dLng/2);
                    let c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
                    let d = 6371 * c;
                    $("input[name=mapDistance]").val(Math.round(d * 1000));
                });


                //이미지 관리
                let imgs = [];
                let imgs_length = 5;
                let imgForms = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
                $("#btn_image_add").click(function () {
                    if (imgs.length < imgs_length) {
                        let div = $("<div>"),
                            fileInput = $("<input type='file' accept='image/*'>"),
                            btn_cancel = $("<button>");
                        div.addClass("input-group");
                        fileInput.addClass("form-control");
                        btn_cancel.addClass("btn");
                        btn_cancel.addClass("btn-outline-secondary")
                        btn_cancel.append("x");
                        div.append(fileInput, btn_cancel);
                        $("#img_field").append(div);
                        imgs.push(div);

                        btn_cancel.click(function () {
                            imgs.splice(imgs.indexOf(div), 1);
                            div.remove();
                        });
                    }
                });

                $("#addForm").submit(function (e) {
                    // $("input[name=imgLength]").val(imgs.length);
                    for (let i = 0; i < imgs.length; i++) {
                        // if (imgs[i].children("input").val() == "" || imgs[i].children("input").val() == null) {
                        //     alert("이미지 첨부 파일을 빈 상태로 두실 수 없습니다.")
                        //     return false;
                        //} else
                        if (!imgs[i].children("input").val().match(imgForms)) {
                            alert("이미지 파일만 업로드 가능합니다.");
                            return false;
                        }
                        imgs[i].children("input").attr("name", "image" + i);
                    }

                    if(!isMapAdded){
                        alert("마커를 설정해주셔야 합니다.");
                        return false;
                    }
                })
				</script>

				<!-- body main 수정 여기까지, 하단 건들지 말것. -->
			</div>
		</div>

		<jsp:include page="/page/footer.jsp" flush="false"></jsp:include>
	</div>

</body>
</html>