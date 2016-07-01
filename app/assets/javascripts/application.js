// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require bootstrap
//= require moment
//= require moment/ja
//= require bootstrap-datetimepicker
//= require jquery_nested_form
//= require_tree .

$(function($){
	// datetimepicker フォーマット 時分
	$('.datetimepicker').datetimepicker({
		format : "HH:mm"
	});

	// datetimepicker フォーマット 年
	$('.yearpicker').datetimepicker({
		format : "YYYY"
	});

	// datetimepicker フォーマット 年月
	$('.datepicker').datetimepicker({
		format : "YYYY/MM"
	});

	// datetimepicker clicke 時 値初期化
	$('.datetimepicker').on('click', function(){
		$(this).val('');
	});

	// 祝日click時 初期化
	$('.holiday_text').on('click', function(){
		$(this).val('');
	});
});
