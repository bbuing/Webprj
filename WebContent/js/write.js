/**
 * 	write.js
 */
// 타이틀 이미지를 미리보기 하는 함수
$.fn.setPreview = function(opt){
    "use strict"
    var defaultOpt = {
        inputFile: $(this),
        w: 200,
        h: 200
    };
    $.extend(defaultOpt, opt);
 
    var previewImage = function(){
        if (!defaultOpt.inputFile || !defaultOpt.img) return;
 
        var inputFile = defaultOpt.inputFile.get(0);
        var img       = defaultOpt.img.get(0);
 
        // FileReader
        if (window.FileReader) {
            // image 파일만
            if (!inputFile.files[0].type.match(/image\//)) return;
 
            // preview
            try {
                var reader = new FileReader();
                reader.onload = function(e){
                    img.src = e.target.result;
                    img.style.width  = defaultOpt.w+'px';
                    img.style.height = defaultOpt.h+'px';
                    img.style.display = '';
                }
                reader.readAsDataURL(inputFile.files[0]);
            } catch (e){}
        // img.filters (MSIE)
        } else if (img.filters) {
            inputFile.select();
            inputFile.blur();
            var imgSrc = document.selection.createRange().text;
 
            img.style.width  = defaultOpt.w+'px';
            img.style.height = defaultOpt.h+'px';
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";            
            img.style.display = '';
        // no support
        } else { alert("미리보기 기능은 IE, Chrome만 제공됩니다.");}
    };
 
    // onchange
    $(this).change(function(){
        previewImage();
    });
};
	// 테마(본문)을 추가하는 함수
	function addTheme() {
		var divTheme = document.getElementById("addTheme");
		var div = document.createElement("div");
		div.innerHTML = '<div class="group_theme">'
				+ '<div class="btn-group">'
				+ '<button type="button" class="btn btn-default" onClick="setTheme(this)"><span class="glyphicon glyphicon-plane"></span></button>'
				+ '<button type="button" class="btn btn-default" onClick="setTheme(this)"><span class="glyphicon glyphicon-heart"></span></button>'
				+ '<button type="button" class="btn btn-default" onClick="setTheme(this)"><span class="glyphicon glyphicon-home"></span></button>'
				+ '<button type="button" class="btn btn-default active" onClick="setTheme(this)"><span class="glyphicon glyphicon-send"></span></button>'
				+ '<button type="button" class="btn btn-default" onClick="removeTheme(this)"><span class="glyphicon glyphicon-trash"></span></button></div>'
				+ '<div id="theme_row" class="form-group text-right">'
				+ '<textarea class="form-control" rows="16" name="theme" placeholder="내용을 작성해 주세요." onFocus="focusChange(this)"></textarea><br/>'
				+ '<button class="form-control form-group-lg" type="button" class="btn btn-default btn-lg btn-block" onClick="addTheme()">'
				+ '<span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>'
				+ '</div>'
				+ '</div>';
		divTheme.appendChild(div);
		
		$("<span>", {
			addClass : "glyphicon glyphicon-send"
		}).appendTo($("#theme_order"));
		
	}
	// 테마(본문)을 지우는 함수
	function removeTheme(theme) {
		$(theme).parent().parent().remove();
	}
	
	function focusChange(theme) {
		
	}
	
	/*function addCard() {
		var content = document.getElementById("content");
		var div = document.createElement("div");
		div.innerHTML = '<div id="card_content" class="col-md-4" style="border: 1px black solid; margin-top: 35px; padding:5px; width:390px; height:345px;">'
			+ '<ul class="nav nav-tabs nav-justified">' 
			+ '<li><input type="file" id="card_img" style="display: none" /><a class="btn btn-default" onclick="cardTab(this)"><span class="glyphicon glyphicon-picture"></span></a></li>' 
			+ '<li><a id="instaBtn" class="btn btn-default" onclick="cardTab(this)"><span class="glyphicon glyphicon-camera"></span></a></li>'
			+ '<li><a class="btn btn-default"onclick="cardTab(this)"><span class="glyphicon glyphicon-thumbs-up"></span></a></li>'
			+ '<li><a class="btn btn-default"onclick="cardTab(this)"><span class="glyphicon glyphicon-map-marker"></span></a></li>'
			+ '<li><a class="btn btn-default"onclick="cardTab(this)"><span class="glyphicon glyphicon-option-horizontal"></span></a></li>'
			+ '</ul>'
			+ '<div id="card">'
			+ '<div style="display: none;"><center><jsp:include page = "OwnPhotos.jsp"/></center></div>'
			+ '<div class="continaer" style="display: none;">'
			+ '<div id="instaPics" class="row"></div>'
			+ '</div>'
			+ '<div style="display: none;"></div>'
			+ '<div style="display: none;"><center><jsp:include page = "GoogleMap.jsp"/></center></div>'
			+ '</div>';
		content.appendChild(div);
	}*/

	function showCard() {
		$("#card_content").css("display", "inline");
	}
	// card의 탭 전환 함수
	function cardTab(tab) {
		var tab_type = $(tab).children().attr("class");	// span의 class, icon 이미지
		var tabs = $(tab).parent().parent().children(); // navbar의 탭들 <li>
		$(tabs).each(function(idx){
			if($(tabs).eq(idx).children().children().attr("class") == tab_type) {
				$(tabs).eq(idx).addClass("active");
				switch(idx) {
					case 0:
						$("#card").children().eq(idx).css("display", "inline");
						break;
					case 1:
						$("#card").children().eq(idx).css("display", "inline");
						break;
					case 2:
						$("#card").children().eq(idx).css("display", "inline");
						break;					
					case 3:
						$("#card").children().eq(idx).css("display", "inline");
						break;
					case 4:
						$("#card").children().eq(idx).css("display", "inline");
						break;
				}
			}
			else {
				$(tabs).eq(idx).removeClass("active");
				$("#card").children().eq(idx).css("display", "none");
			}
		})
	}
	// 인스타그램 인증후 유저의 이미지를 뿌려주는 callback 함수
	function callback() {
		var token = $("#token").val(); /* Access Tocken 입력 */  
	    var count = "16";
	    $.ajax({  
	        type: "GET",  
	        dataType: "jsonp",  
	        cache: false,  
	        url: "https://api.instagram.com/v1/users/self/media/recent/?access_token=" + token + "&count=" + count,  
	        success: function(response) {  
	         if ( response.data.length > 0 ) {
					var cnt=0;0.
					var insta = "";
					for(var i = 0; i < response.data.length; i++) {
						if(cnt % 4 == 0) {
							if(insta != "") {
								insta += "</div>";	
							}
							insta += '<div class="col-md-10">';
						}
	           	   		insta += '<img src="' + response.data[i].images.thumbnail.url + '" onClick="selectImg(this)" style="border:2px solid white; width:70px; height=70px;"/>';
	           	   		insta += '<input type="hidden" name="link" value=' + response.data[i].images.thumbnail.url + ' />'; 
	           	   		cnt++;
	                   //insta += "<a target='_blank' href='" + response.data[i].link + "'>";  
	                   //insta += "<div class='image-layer'>";  
	                   //insta += "<img src='" + response.data[i].images.thumbnail.url + "'>";  
	                   //console.log(response.data[i].caption.text);  
	                   //if ( response.data[i].caption !== null ) {  
	                     //   insta += "<div class='caption-layer'>";  
	                     //   if ( response.data[i].caption.text.length > 0 ) {  
	                       //      insta += "<p class='insta-caption'>" + response.data[i].caption.text + "</p>"  
	                       // }  
	                       // insta += "<span class='insta-likes'>" + response.data[i].likes.count + " Likes</span>";  
	                        //insta += "</div>";  
	                   //}  
	                   //insta += "</a>";  
	                   //insta += "</div>";    
	              } 
					insta += "</div>";
					$("#instaPics").append(insta);
	         }  
	        }  
	       });  
	}

	// 인스타그램에서 가져온 사진을 선택, 비선택 표시하는 함수
	function selectImg(i) {
		var check = $(i).is(".selected");
		if(check == true) {
			$(i).css("border", "2px solid white").removeClass("selected");
		}
		else {
			$(i).css("border","2px solid red").addClass("selected");
		}
	}
	// 테마의 주제 변경시 테마의 주제 아이콘과 작성순서의 아이콘을 변경하는 함수
	function setTheme(btn) { // btn : theme를 나타내는 버튼
		var index = $(btn).parent().parent().index(".group_theme")+1;
		var icon_btn = $(btn).parent().children();		// 한단계 상위로 올라갔다 내려오면서  btn그룹을 받아온다
		var icon_type = $(btn).children().attr("class");	// 현재 누른 버튼의 아이콘 모양
		var title_icon = $("#theme_order");
		
		$(icon_btn).each(function(btn_idx){	// 각각의 버튼을 돌면서 누른 버튼과 일치하면 active클래스 추가 아닐시 삭제
			if($(icon_btn).eq(btn_idx).children().attr("class") == icon_type) {
				$(icon_btn).eq(btn_idx).addClass("active");
				$(title_icon).children().eq(index).attr("class", icon_type);
			}
			else {
				$(icon_btn).eq(btn_idx).removeClass("active");
			}
		})
	}
	
	function submitTitle() {
			var data = new FormData();
			var file = $('#title_img')[0].files[0];
			data.append('file', file);
			$.ajax({
				url : 'Upload.jsp',
				data : data,
				type : 'POST',
				mimeType : 'multipart/form-data',
				processData : false,
				contentType : false,
				success : function(ret) {
					var rawFile = new XMLHttpRequest();
					rawFile.open("GET", file, false);
					rawFile.onreadystatechange = function() {
						if(rawFile.readyState == 4) {
							if(rawFile.status == 200) {
								var allText = rawFile.responseText;
								alert(allText);
							}
						}
					}
					rawFile.send(null);
				}
			});
		}
	jQuery(document).ready(function($){
	    var opt = {
	        img: $('#title_img_preview'),
	        w: 200,
	        h: 200
	    };
		$('#title_img').setPreview(opt);
		
		var opt = {
			img: $('#card_img_preview'),
	        w: 200,
	        h: 200
		}
		$('#card_img').setPreview(opt);
		// card탭에서 인스타그램 탭을 선택했을시 인증 진행
		$("#instaBtn").click(function(event){
			event.preventDefault();
			var token = $("#token").val();
			if(token != "") {
				$("#instaPics").empty();
				$("#instaPics").css("display","inline");
				$("#instaDesc").css("display","none");
				callback();
			}
			else {
				var win = window.open("https://api.instagram.com/oauth/authorize/?client_id=05496e57bdfa4b7494198b60c3a806d0&redirect_uri=http://localhost:8080/Webprj/Instagram.jsp&response_type=token&scope=likes+comments+relationships+basic","instaLogin", "left=400, top=300, width=600, height=350");
				var interval = window.setInterval(function(){
					try {
						if(win == null || win.closed) {
							window.clearInterval(interval);
							callback();
						}
					} catch(e){}
				}, 1000);	
			}
		})
		// insta에서 가져온 각각의 사진들의 썸네일을 생성, 그 후 설명을 달 수 있게 한다.
		$("#instaAdd").click(function(){
			var image = $("img[class=selected]");
			var size = image.size();
			for(var i=0; i<size; i++) {
				// 썸네일의 크기를 지정할 바깥 div
				var div = $("<div>",{
					addClass : "insta",
					css : {"width":"220px", "height":"220px", "text-align":"center"}
				});
				// 각각의 사진을 담을 썸네일 생성
				var thumbnail = $("<div>",{
					addClass : "thumbnail"
				});
				// 썸네일에 넣을 이미지
				thumbnail.append($("<img>",{
					src : image.get(i).src,
					css : {"width":"200px", "height":"200px"}
				}));
				// 각각의 썸네일에 caption으로 설명text와 button을 달아준다.
				var caption = $("<div>",{
					addClass : "caption"
				});
				// 두 번째 썸네일 부터는 이전 버튼을 달아준다.
				if(i > 0) {
					caption.append($("<button>",{
						type : "button",
						addClass : "btn btn-default",
						css : {"float":"left"},
						click : function() {
							$(this).parent().parent().parent().prev().css("display","inline");
							$(this).parent().parent().parent().css("display","none");
						}
					}).append($("<span>",{
						addClass : "glyphicon glyphicon-chevron-left"
					})));				
				}
				// 다음 버튼
				caption.append($("<input>",{
						type : "text",
						size : 12,
						placeholder : "설명"
					})).append($("<button>",{
						type : "button",
						addClass : "btn btn-default",
						css : {"float":"right"},
						click : function(){
							$(this).parent().parent().parent().css("display","none");
							if($(this).parent().parent().parent().next().size() == 0) {
								alert("저장되었습니다.");
							}
							$(this).parent().parent().parent().next().css("display","inline");
						}
					}).append($("<span>",{
						addClass : "glyphicon glyphicon-chevron-right"
					})));
				// 두 번째 이후 썸네일은 보이지 않게 한다.
				if(i > 0) {
					$(div).css("display","none");
				}
				else {
					$(div).css("display","inline");
				}
				$(thumbnail).append(caption);
				$(div).append(thumbnail);
				$("#instaDesc").append(div);
			}
			$("#instaPics").css("display","none");
			$("#instaAdd").css("display","none");
			$("#instaDesc").css("display","inline");
		});
	});