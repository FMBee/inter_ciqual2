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

<!-- Bootstrap Core CSS -->
<link
	href="~{$smarty.const.__WEB_LIB_BOOTSTRAP__}~dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="~{$smarty.const.__WEB_LIB_BOWER__}~metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables with Bootstrap style & extensions CSS -->
<link
	href="~{$smarty.const.__WEB_LIB_BOWER__}~datatables/datatables.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="~{$smarty.const.__WEB_LIB_THEME__}~dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="~{$smarty.const.__WEB_LIB_BOWER__}~font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<link
	href="~{$smarty.const.__WEB_LIB_FORMVALID__}~dist/css/formValidation.min.css">

<!-- Select -->
<link
	href="~{$smarty.const.__WEB_LIB_SELECT__}~dist/css/bootstrap-select.css"
	rel="stylesheet" type="text/css">

<!-- DateTimePicker CSS -->
<link
	href="./web/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">

<!-- TouchSpin -->
<link
	href="./web/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.css"
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

<!-- Autocomplete -->
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
</style>

<style type="text/css">

.user-avatar, .user-avatar2 {
  border: 1px solid #333333;
  -webkit-border-radius: 100%;
  -moz-border-radius: 100%;
  border-radius: 100%; 
}
.user-avatar {
  width: 34px;
  height: 34px;
}
.user-avatar2 {
  width: 25px;
  height: 25px;
}
</style>

</head>

~{if $onSession === true}~
<body>
~{else}~
<body style="background: white url('~{$smarty.const.__VIEWS_IMG__|cat:$smarty.const.__LOG_IMG__}~') no-repeat center center fixed;">
~{/if}~