/**
 * 	write.js
 */

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
            } catch (e) {
                // exception...
            }
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
        } else {
            // Safari5, ...
        }
    };
 
    // onchange
    $(this).change(function(){
        previewImage();
    });
};
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
				+ '<textarea class="form-control" rows="8" name="theme" placeholder="내용을 작성해 주세요."></textarea>'
				+ '<button type="button" class="btn btn-default" onClick="removeTheme(this)"><span class="glyphicon glyphicon-trash"></span></button></div>'
				+ '</div>';
		divTheme.appendChild(div);
		
		$("<span>", {
			addClass : "glyphicon glyphicon-send"
		}).appendTo($("#theme_order"));
		
	}
	function removeTheme(theme) {
		$(theme).parent().parent().remove();
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
	        img: $('#img_preview'),
	        w: 200,
	        h: 200
	    };
	    
		$('#title_img').setPreview(opt);
	});