var popWindowHtml	=	'<div id="popWindow_bg" style="display:none;"></div>'+
						'<table id="popWindow" border="0" cellpadding="0" cellspacing="0" style="display:none;">'+
							'<tr>'+
								'<td class="top_a"></td>'+
								'<td class="top_b"></td>'+
								'<td class="top_c"><a id="popWindowClosed" href="javascript:c()"><img src="images/pop_window_closed.png" /></a></td>'+
							'</tr>'+
							'<tr>'+
								'<td class="middle_a"></td>'+
								'<td class="middle_b" id="popWindowContent">'+
								'</td>'+
								'<td class="middle_c"></td>'+
							'</tr>'+
							'<tr><td class="bottom_a"></td> <td class="bottom_b"></td><td class="bottom_c"></td></tr>'+
						'</table>';
						
document.write(popWindowHtml);

var loading = '<img src="../images/loading.gif" />';
var success = '<img src="../images/success.png" />';

function popWindow(Html){
	var obj		=	document.getElementById('popWindow');
	obj.style.display			= 		"";
	document.getElementById('popWindowContent').innerHTML		=		Html;
	
	// 浏览器整体高度和宽度
	var getWidth	=	document.documentElement.clientWidth;
	var getHeight	=	document.documentElement.clientHeight;
	
	// 设置弹出框的位置
	obj.style.left	=	(getWidth - obj.clientWidth)/2 + "px";
	obj.style.top	=	(getHeight - obj.clientHeight - 100)/2 + "px";
}

function closedPopWindow(){
	setTimeout("c()", 2000);
}

function c(){
	document.getElementById('popWindow').style.display	  = 'none';
	document.getElementById('popWindow_bg').style.display = 'none';
}

function openCloseButton(){
	document.getElementById("popWindowClosed").style.display = "";
}

function PopUp(){
	var Html	=	'有！';
	popWindow(Html);
}