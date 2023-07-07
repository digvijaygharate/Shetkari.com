/**
 * 
 */

const paymentstart=()=>
{
	console.log("payment startedddddddddddddddddddddddddddddd");
	var amount=$("#pay_filed").val();
	console.log(amount);
	
	if(amount==""||amount==null)
	{
		alert("amount is required");
		return;
	}
};