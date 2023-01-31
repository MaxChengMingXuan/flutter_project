<?php
	if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
	}
	include_once("dbconnect.php");
	$userid = $_POST['userid'];
  $hsname= ucwords(addslashes($_POST['hsname']));
	$hsdesc= ucfirst(addslashes($_POST['hsdesc']));
	$hsprice= $_POST['hsprice'];
  $park= $_POST['park'];
  $pax= $_POST['pax'];
  $state= addslashes($_POST['state']);
  $local= addslashes($_POST['local']);
  $lat= $_POST['lat'];
  $lon= $_POST['lon'];
    $img01= $_POST["img01"];
	$img02= $_POST["img02"];
	$img03= $_POST["img03"];
	
	$sqlinsert = "INSERT INTO `tbl_homestays`(`user_id`, `homestay_name`, `homestay_desc`, `homestay_price`, `homestay_parking`, `homestay_pax`, `homestay_state`, `homestay_local`, `homestay_lat`, `homestay_lng`) VALUES ('$userid','$hsname','$hsdesc',$hsprice,$park,$pax,'$state','$local','$lat','$lon')";
	
  try {
		if ($conn->query($sqlinsert) === TRUE) {
			$decoded_string1 = base64_decode($img01);
			$decoded_string2 = base64_decode($img02);
			$decoded_string3 = base64_decode($img03);
			$filename = mysqli_insert_id($conn);
			$path1 = '../assets/homestayimages/'.$filename.'_1.png';
			$path2 = '../assets/homestayimages/'.$filename.'_2.png';
			$path3 = '../assets/homestayimages/'.$filename.'_3.png';
			file_put_contents($path1, $decoded_string1);
			file_put_contents($path2, $decoded_string2);
			file_put_contents($path3, $decoded_string3);
			$response = array('status' => 'success', 'data' => null);
			sendJsonResponse($response);
		}
		else{
			$response = array('status' => 'failed', 'data' => null);
			sendJsonResponse($response);
		}
	}
	catch(Exception $e) {
		$response = array('status' => 'failed', 'data' => null);
		sendJsonResponse($response);
	}
	$conn->close();
	
	function sendJsonResponse($sentArray)
	{
    header('Content-Type= application/json');
    echo json_encode($sentArray);
	}
?>