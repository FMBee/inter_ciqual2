
	~{if $onSession === true}~
        <footer>
	          <p><span class="text-black" style="font-size:140%">NUTRIVAL</span>&nbsp;&nbsp;&nbsp;© zest HACCP 2018-20</p>
	    </footer>
	~{/if}~

      </div>
      <!-- Container end -->
    </div>
    <!-- Dashboard Container end -->

<!-- Custom Theme JavaScript -->
<script src="~{$smarty.const.__WEB_LIB_THEME__}~js/jquery-ui-v1.10.3.js"></script>
<script src="~{$smarty.const.__WEB_LIB_THEME__}~js/menu.js"></script>
<script src="~{$smarty.const.__WEB_LIB_THEME__}~js/custom-index2.js"></script>

<!-- jQuery, Datatables, Bootstrap JS -->
<script
	src="~{$smarty.const.__WEB_LIB_DATABOOT__}~datatables.min.js"></script>

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
	src="~{$smarty.const.__WEB_ROOT__}~bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"
	charset="UTF-8"></script>
<script
	src="~{$smarty.const.__WEB_ROOT__}~bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.fr.js"
	charset="UTF-8"></script>

<script
	src="~{$smarty.const.__WEB_ROOT__}~bootstrap-touchspin/dist/jquery.bootstrap-touchspin.js"></script>

<script
	src="~{$smarty.const.__WEB_LIB_SWITCH__}~dist/js/bootstrap-switch.js"></script>
<script src="~{$smarty.const.__WEB_LIB_SWITCH__}~docs/js/highlight.js"></script>
<script src="~{$smarty.const.__WEB_LIB_SWITCH__}~docs/js/main.js"></script>

<!-- Owl Carousel -->
<script
	src="~{$smarty.const.__WEB_LIB_CAROUSEL__}~owl-carousel/owl.carousel.js"></script>
<script
	src="~{$smarty.const.__WEB_LIB_CAROUSEL__}~assets/js/bootstrap-collapse.js"></script>
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
							    OK : 'Ok',
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
		
			bootbox.alert("<span style='font-size:130%'>~{$ctrlMessage}~</span>");
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