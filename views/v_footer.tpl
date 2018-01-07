
<!-- jQuery JS : placer en header -->
<script
	src="~{$smarty.const.__WEB_LIB_BOWER__}~jquery/dist/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script
	src="~{$smarty.const.__WEB_LIB_BOWER__}~bootstrap/dist/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script
	src="~{$smarty.const.__WEB_LIB_BOWER__}~metisMenu/dist/metisMenu.min.js"></script>

<!-- DataTables with Bootstrap style & extensions JavaScript -->
<script
	src="~{$smarty.const.__WEB_LIB_BOWER__}~datatables/datatables.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="~{$smarty.const.__WEB_LIB_THEME__}~dist/js/sb-admin-2.js"></script>
<!-- FormValidation plugin and the class supports validating Bootstrap form -->
<script
	src="~{$smarty.const.__WEB_LIB_FORMVALID__}~dist/js/formValidation.min.js"></script>
<!-- Don't confuse bootstrap(.min).js file provided by the Bootstrap framework with bootstrap(.min).js provided by FormValidation -->
<script
	src="~{$smarty.const.__WEB_LIB_FORMVALID__}~dist/js/framework/bootstrap.min.js"></script>
<!-- Mandatory addon -->
<script
	src="~{$smarty.const.__WEB_LIB_FORMVALID__}~dist/js/addons/mandatoryIcon.min.js"></script>
<!-- If you want to use the default message translated in the language package -->
<script
	src="~{$smarty.const.__WEB_LIB_FORMVALID__}~dist/js/language/fr_FR.js"></script>

<script
	src="~{$smarty.const.__WEB_LIB_SELECT__}~dist/js/bootstrap-select.js"></script>

<script
	src="./web/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"
	charset="UTF-8"></script>
<script
	src="./web/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.fr.js"
	charset="UTF-8"></script>

<script
	src="./web/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.js"></script>

<script
	src="~{$smarty.const.__WEB_LIB_SWITCH__}~dist/js/bootstrap-switch.js"></script>
<script src="~{$smarty.const.__WEB_LIB_SWITCH__}~docs/js/highlight.js"></script>
<script src="~{$smarty.const.__WEB_LIB_SWITCH__}~docs/js/main.js"></script>

<!-- Owl Carousel -->
<script
	src="~{$smarty.const.__WEB_LIB_CAROUSEL__}~owl-carousel/owl.carousel.js"></script>
~{* --> collapse.js en conflit avec metisMenu !!
<script
	src="~{$smarty.const.__WEB_LIB_CAROUSEL__}~assets/js/bootstrap-collapse.js"></script>
*}~
<script
	src="~{$smarty.const.__WEB_LIB_CAROUSEL__}~assets/js/bootstrap-transition.js"></script>
<script
	src="~{$smarty.const.__WEB_LIB_CAROUSEL__}~assets/js/bootstrap-tab.js"></script>

<!-- BootBox -->
<script src="~{$smarty.const.__WEB_LIB_BOOTBOX__}~bootbox.min.js"></script>

<!-- Autocomplete -->
<script
	src="~{$smarty.const.__WEB_LIB_AUTOCPL__}~dist/jquery.autocomplete.min.js"></script>



<script type="text/javascript">

		bootbox.addLocale(	'my_fr', 
							{
							    OK : 'OK',
							    CANCEL : 'Non',
							    CONFIRM : 'Oui'
							}
		);
	
		bootbox.setDefaults({
		  locale: "my_fr",
		  show: true,
		  backdrop: 'static',
		  closeButton: false,
		  animate: true
		});
		
		//message de retour des controller ou $_GET[paramalert]
		~{if !empty($ctrlMessage) }~
		
			bootbox.alert("~{$ctrlMessage}~");
		~{/if}~
		
	</script>

~{if isset($smarty.get.page)}~ 
	
	~{assign var=filename value=$smarty.const.__VIEWS_FOOTERS__|cat:"f_"|cat:$smarty.get.page|cat:".tpl"}~

	~{if file_exists($filename)}~ 

		~{include file="$filename"}~ 
	~{/if}~

~{/if}~

</body>

</html>