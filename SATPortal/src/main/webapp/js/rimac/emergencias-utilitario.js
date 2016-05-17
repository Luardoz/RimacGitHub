	function validarIcon(){
		$("#" + CTE_FRM_EMERGENCIAS+ " select").change(function(){
			validation_formPaso1(this);
		});

		$("#" + CTE_FRM_EMERGENCIAS+ " input[type=text]").change(function(){
			validation_formPaso1(this);
		});
		
		$("#" + CTE_FRM_EMERGENCIAS+ " select").blur(function(){
			validation_formPaso1(this);
		});

		$("#" + CTE_FRM_EMERGENCIAS+ " input[type=text]").blur(function(){
			validation_formPaso1(this);
		});
		
		$("#" + CTE_FRM_EMERGENCIAS+ " select").change();
		$("#" + CTE_FRM_EMERGENCIAS+ " input[type=text]").change();

		
//		$("#" + CTE_FRM_EMERGENCIAS+ " select").blur();
//		$("#" + CTE_FRM_EMERGENCIAS+ " input[type=text]").blur();

		$(".icon-error").hide();
		$(".icon-check").hide();
		$(".icon-oblig").hide();
	}
	
	function validation_formPaso1(el){
		
		var value = el.value;
		var tagfor = $(el).attr("name");
		var element_check = "";
		var element_error = "";
		
		if (tagfor != undefined){
			tagfor = tagfor.replace('$','\\\$');
			tagfor = tagfor.replace('?','\\\?');
			tagfor = tagfor.replace('¿','\\\¿');
		}

		var element_oblig = $(".icon-oblig[for=oblig-" + tagfor + "]");
		
		if (element_oblig.length == 0){
			element_check = $(".icon-check[for=check-" + tagfor + "]");
			element_error = $(".icon-error[for=error-" + tagfor + "]");
		}else{
			element_check = $(".icon-check[for=check-" + tagfor + "]");
			element_error = $(".icon-oblig[for=oblig-" + tagfor + "]");
		}

		if(element_check != undefined && value != undefined && value != 0 && value != ""){
			element_error.hide();
			element_check.show();
		}else{
			element_error.show();
			element_check.hide();
		} 
	}