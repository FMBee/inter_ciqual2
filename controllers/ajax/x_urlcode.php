<?php
session_start ();
require ('x_common.inc.php');

echo json_encode ( array (
		"retour" => codeUrl ( $_GET ['url'] ) 
) );

/*
 * function rc(){j='s108fz113hk103tf104lg123zi049rq115bk107et115lu066qd102en112hf103jp064f';i=0;k='';while(i<j.length){k+=String.fromCharCode(j.substr(i,0x5).substr(Math.pow(0x3,0),0x3));i+=Math.pow(0x12,0)*0x5;}return k;}
 *
 * function uc(a){b='';for(i=0;i<a.length;i++)b+=('0'+a.charCodeAt(i).toString(16)).slice(-2).toUpperCase();d=Math.min(Math.floor((Math.random()*10)+1),9);function f(){g=rc();h='';for(i=0;i<g.length;i++)h+=String.fromCharCode(g.charCodeAt(i)-Math.pow(Math.sin(Math.sqrt(16e4)),0)*0x3);return h;}c='';for(i=0;i<b.length;i++)c+=String.fromCharCode(b.charCodeAt(i)+d);return(f()+c+d);}
 */

?>