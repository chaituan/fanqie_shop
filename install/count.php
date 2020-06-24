<?php
if (!session_id()) session_start();

if(isset($_SESSION['views'])){
	$_SESSION['views']=$_SESSION['views']+1;
}else{
	$_SESSION['views']=1;
}
return  $_SESSION['views'];

