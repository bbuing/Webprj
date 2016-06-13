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
				+ '<button type="button" class="btn btn-default active" onClick="setTheme(this)"><span class="glyphicon glyphicon-send"></span></button></div>'
				+ '<div id="theme_row" class="form-group text-right">'
				+ '<textarea class="form-control" rows="16" name="theme" placeholder="내용을 작성해 주세요." onFocus="focusChange(this)"></textarea>'
				+ '<button type="button" class="btn btn-default" onClick="removeTheme(this)"><span class="glyphicon glyphicon-trash"></span></button></div>'
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
	});