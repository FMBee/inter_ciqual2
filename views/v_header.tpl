<!DOCTYPE html>
<html ~{if
	isset($smarty.session.__user_lang__)}~ lang="~{$smarty.session.__user_lang__}~"
	~{else}~ lang="fr"~{/if}~>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>~{$smarty.const.__APP_TITLE__}~</title>


<!-- Jquery, DataTables with Bootstrap style & extensions CSS -->
<link
	href="~{$smarty.const.__WEB_LIB_DATABOOT__}~datatables.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="~{$smarty.const.__WEB_LIB_THEME__}~css/new.css"	rel="stylesheet">

<link
	href="~{$smarty.const.__WEB_LIB_FORMVALID__}~dist/css/formValidation.min.css">

<!-- Select -->
<link
	href="~{$smarty.const.__WEB_LIB_SELECT__}~dist/css/bootstrap-select.css"
	rel="stylesheet" type="text/css">

<!-- DateTimePicker CSS -->
<link
	href="~{$smarty.const.__WEB_ROOT__}~bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">

<!-- TouchSpin -->
<link
	href="~{$smarty.const.__WEB_ROOT__}~bootstrap-touchspin/dist/jquery.bootstrap-touchspin.css"
	rel="stylesheet" type="text/css">

<!-- Switch -->
<link href="~{$smarty.const.__WEB_LIB_SWITCH__}~docs/css/highlight.css"
	rel="stylesheet">
<link
	href="~{$smarty.const.__WEB_LIB_SWITCH__}~dist/css/bootstrap3/bootstrap-switch.css"
	rel="stylesheet">
<link href="~{$smarty.const.__WEB_LIB_SWITCH__}~docs/css/main.css"
	rel="stylesheet">

<!-- Owl Carousel Assets  -->
<link
	href="~{$smarty.const.__WEB_LIB_CAROUSEL__}~owl-carousel/owl.carousel.css"
	rel="stylesheet">
<link
	href="~{$smarty.const.__WEB_LIB_CAROUSEL__}~owl-carousel/owl.theme.css"
	rel="stylesheet">

<!-- <link href="~{$smarty.const.__VIEWS_IMG__}~application.css" rel="stylesheet"> -->

<!-- Custom Fonts -->
<link
	href="~{$smarty.const.__WEB_LIB_THEME__}~fonts/font-awesome.min.css"
	rel="stylesheet" type="text/css">


<style type="text/css">

.autocomplete-suggestions {
	border: 1px solid #999;
	background: #FFF;
	overflow: auto;
}
.autocomplete-suggestion {
	padding: 2px 5px;
	white-space: nowrap;
	overflow: hidden;
}
.autocomplete-selected {
	background: #F0F0F0;
}
.autocomplete-suggestions strong {
	font-weight: normal;
	color: #3399FF;
}
.autocomplete-group {
	padding: 2px 5px;
}
.autocomplete-group strong {
	display: block;
	border-bottom: 1px solid #000;
}

#cssmenu > ul > li {
    width: 270px;
    height: 130px;
    padding-top: 16px;
}
/* #cssmenu > ul > li > a { */
/*     height: 100px; */
/* } */
#cssmenu > ul > li > a > i {
    font-size: 18px;
    font-weight: bold;
}
#cssmenu > ul > li > a > i > img {
	width: 80px; 
	height: 80px;
}	
	 
.panel-warning .panel-heading {
  color: white;
  background: #e9841d;
}
.user-avatar2 {
  border: 1px solid #333333;
  -webkit-border-radius: 100%;
  -moz-border-radius: 100%;
  border-radius: 100%; 
  width: 25px;
  height: 25px;
}
.my_button {
	background: #e9841d;
	color: white;
	text-align: center;
}
span.filter-option {
	font-size: 120%;
	background: #e9841d;
	font-weight: bold;
}
.dropdown-menu > .active > a {
 	background: #e9841d;
}
.pagination > .active > a {
 	background: #e9841d;
	border-color: #e9841d;
}
.btn-primary {
 	background: #e9841d !important;
	border-color: #e9841d !important;
}

</style>

</head>

~{if $onSession === true}~
<body>
~{else}~
<body style="background: gray">
~{/if}~