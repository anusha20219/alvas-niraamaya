<?php
session_start();
error_reporting(0);
include('include/config.php');
include('include/checklogin.php');
check_login();
if(isset($_POST['submit']))
  {
    
    $vid=$_GET['viewid'];
    $bp=$_POST['bp'];
    $bs=$_POST['bs'];
    $weight=$_POST['weight'];
    $temp=$_POST['temp'];
   $pres=$_POST['pres'];
   
 
      $query.=mysqli_query($con, "insert   tblmedicalhistory(PatientID,BloodPressure,BloodSugar,Weight,Temperature,MedicalPres)value('$vid','$bp','$bs','$weight','$temp','$pres')");
    if ($query) {
    echo '<script>alert("Medicle history has been added.")</script>';
    echo "<script>window.location.href ='manage-patient.php'</script>";
  }
  else
    {
      echo '<script>alert("Something Went Wrong. Please try again")</script>';
    }

  
}

?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Doctor | Manage Patients</title>
		
		<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
		<link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
		<link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
		<link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet" media="screen">
		<link href="vendor/select2/select2.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-datepicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" media="screen">
		<link rel="stylesheet" href="assets/css/styles.css">
		<link rel="stylesheet" href="assets/css/plugins.css">
		<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
	</head>
  <style>
    ul {
  column-count: 2;
  column-gap: 2rem;
  list-style: none;
}

/* ADDITIONAL STYLING */

/* The container */
.container {
  display: block;
  font-family: Montserrat;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 15px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  left: 0;
  height: 20px;
  width: 20px;
  background-color: #eee;
}


/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #c90000;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
  left: 7px;
  top: 2px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 2px 2px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}
</style>
	<body>
		<div id="app">		
<?php include('include/sidebar.php');?>
<div class="app-content">
<?php include('include/header.php');?>
<div class="main-content" >
<div class="wrap-content container" id="container">
						<!-- start: PAGE TITLE -->
<section id="page-title">
<div class="row">
<div class="col-sm-8">
<h1 class="mainTitle">Doctor | Manage Patients</h1>
</div>
<ol class="breadcrumb">
<li>
<span>Doctor</span>
</li>
<li class="active">
<span>Manage Patients</span>
</li>
</ol>
</div>
</section>
<div class="container-fluid container-fullw bg-white">
<div class="row">
<div class="col-md-12">
<h5 class="over-title margin-bottom-15">Manage <span class="text-bold">Patients</span></h5>
<?php
                               $vid=$_GET['viewid'];
                               $ret=mysqli_query($con,"select * from tblpatient where ID='$vid'");
$cnt=1;
while ($row=mysqli_fetch_array($ret)) {
                               ?>
<table border="1" class="table table-bordered">
 <tr align="center">
<td colspan="4" style="font-size:20px;color:blue">
 Patient Details</td></tr>

    <tr>
    <th scope>Patient Name</th>
    <td><?php  echo $row['PatientName'];?></td>
    <th scope>Patient Email</th>
    <td><?php  echo $row['PatientEmail'];?></td>
  </tr>
  <tr>
    <th scope>Patient Mobile Number</th>
    <td><?php  echo $row['PatientContno'];?></td>
    <th>Patient Address</th>
    <td><?php  echo $row['PatientAdd'];?></td>
  </tr>
    <tr>
    <th>Patient Gender</th>
    <td><?php  echo $row['PatientGender'];?></td>
    <th>Patient Age</th>
    <td><?php  echo $row['PatientAge'];?></td>
  </tr>
  <tr>
    
    <th>Patient Medical History(if any)</th>
    <td><?php  echo $row['PatientMedhis'];?></td>
     <th>Patient Reg Date</th>
    <td><?php  echo $row['CreationDate'];?></td>
  </tr>
 
<?php }?>
</table>
<?php  

$ret=mysqli_query($con,"select * from tblmedicalhistory  where PatientID='$vid'");



 ?>
<table id="datatable" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
  <tr align="center">
   <th colspan="8" >Medical History</th> 
  </tr>
  <tr>
    <th>#</th>
<th>Blood Pressure</th>
<th>Weight</th>
<th>Blood Sugar</th>
<th>Body Temprature</th>
<th>Medical Prescription</th>
<th>Visit Date</th>
</tr>
<?php  
while ($row=mysqli_fetch_array($ret)) { 
  ?>
<tr>
  <td><?php echo $cnt;?></td>
 <td><?php  echo $row['BloodPressure'];?></td>
 <td><?php  echo $row['Weight'];?></td>
 <td><?php  echo $row['BloodSugar'];?></td> 
  <td><?php  echo $row['Temperature'];?></td>
  <td><?php  echo $row['MedicalPres'];?></td>
  <td><?php  echo $row['CreationDate'];?></td> 
</tr>
<?php $cnt=$cnt+1;} ?>
</table>

<p align="center">                            
 <button class="btn btn-primary waves-effect waves-light w-lg" data-toggle="modal" data-target="#myModal">Add Medical History</button></p>  

<?php  ?>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
     <div class="modal-content">
      <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Add Medical History</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                <table class="table table-bordered table-hover data-tables">

                                 <form method="post" name="submit">

      <tr>
    <th>Blood Pressure :</th>
    <td>
    <input name="bp" placeholder="Blood Pressure" class="form-control wd-450" required="true"></td>
  </tr>                          
     <tr>
    <th>Blood Sugar :</th>
    <td>
    <input name="bs" placeholder="Blood Sugar" class="form-control wd-450" required="true"></td>
  </tr> 
  <tr>
    <th>Weight :</th>
    <td>
    <input name="weight" placeholder="Weight" class="form-control wd-450" required="true"></td>
  </tr>
  <tr>
    <th>Body Temprature :</th>
    <td>
    <input name="temp" placeholder="Blood Sugar" class="form-control wd-450" required="true"></td>
  </tr>
                         
     <tr>
    <th>Prescription :</th>
    <td>
    <textarea name="pres" placeholder="Medical Prescription" rows="12" cols="14" class="form-control wd-450" required="true"></textarea></td>
  </tr>  
   
</table>
</div>
<div class="modal-footer">
 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
 <button type="submit" name="submit" class="btn btn-primary">Submit</button>
  
  </form>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div>
<h2 style="text-align: center; font-size: xx-large;">REQUISITION FORM</h2>  
    <form >  
     <fieldset>  
        <legend style="font-size: x-large;"><b>Haematology Test</b></legend>  
        
    <div class="row">
      <div class="col-12">
        <ul>
          
         <li>
            <label class="container">Complete Haemogram
              <input type="checkbox" checked="checked">
              <span class="checkmark"></span>
            </label>
         </li>
          
         <li>
            <label class="container">Haemoglobin
              <input type="checkbox">
              <span class="checkmark"></span>
            </label>
         </li>
          
         <li>
            <label class="container">Total WBC Count
              <input type="checkbox">
              <span class="checkmark"></span>
            </label>
         </li>
          
         <li>
            <label class="container">Differential Count
              <input type="checkbox">
              <span class="checkmark"></span>
            </label>
         </li>
          
          <li>
            <label class="container">ESR
              <input type="checkbox">
              <span class="checkmark"></span>
            </label>
         </li>
         <li>
            <label class="container">RBC Count
              <input type="checkbox">
              <span class="checkmark"></span>
            </label>
         </li>

         <li>
            <label class="container">Platelet Count
              <input type="checkbox">
              <span class="checkmark"></span>
            </label>
         </li>

         <li>
            <label class="container">A.E. Count
              <input type="checkbox">
              <span class="checkmark"></span>
            </label>
         </li>

         <li>
            <label class="container">Clotting Time
              <input type="checkbox">
              <span class="checkmark"></span>
            </label>
         </li>

         <li>
            <label class="container">Bleeding Time
              <input type="checkbox">
              <span class="checkmark"></span>
            </label>
         </li>

         <li>
            <label class="container">P.S. for M.P
              <input type="checkbox">
              <span class="checkmark"></span>
            </label>
         </li>
         <li>
            <label class="container">P.S. for M.F.
              <input type="checkbox">
              <span class="checkmark"></span>
            </label>
         </li>
         <li>
            <label class="container"> Blood Group & Rh
              <input type="checkbox">
              <span class="checkmark"></span>
            </label>
         </li>
         <li>
            <label class="container">Prothrombin Test
              <input type="checkbox">
              <span class="checkmark"></span>
            </label>
         </li>
         
           
         
  
         </ul>
      </div>
    </div>
  
</fieldset>  
<br>
<fieldset>  
    <legend style="font-size: x-large;"><b>Biochemistry Test</b></legend>  
    
<div class="row">
  <div class="col-12">
    <ul>
      
     <li>
        <label class="container">S.Glucoss (RBS/FBS/PPBS)
          <input type="checkbox" checked="checked">
          <span class="checkmark"></span>
        </label>
     </li>
      
     <li>
        <label class="container">Blood Urea
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
      
     <li>
        <label class="container">Serum Creatinine
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
      
     <li>
        <label class="container">Serum Cholesterol
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
      
      <li>
        <label class="container">HDL Cholesterol
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
     <li>
        <label class="container">LDL Cholesterol
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>

     <li>
        <label class="container">Triglecerides
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>

     <li>
        <label class="container">S.Uric Acid
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>

     <li>
        <label class="container">S. Calcium
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>

     <li>
        <label class="container">Electrolytes
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>

     <li>
        <label class="container">Serum Amylase
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
     <li>
        <label class="container">S. Total Protien
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
     <li>
        <label class="container"> S. Albumin
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
     <li>
        <label class="container">S. Globulin
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
     
     <li>
        <label class="container">S. S.A/G Ratio
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
     <li>
        <label class="container">S. Bilirubin
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
     <li>
        <label class="container">(Total/Direct/Indirect)
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
     <li>
        <label class="container">S. Alk Phosphatase
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
     <li>
        <label class="container">Serum S.G.P.T
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
     <li>
        <label class="container">Serum S.G.O.T
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
     <li>
        <label class="container">S.C.K.M.B
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
     <li>
        <label class="container">S.L.D.H
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
     <li>
        <label class="container">Thyroid Test(T3/T4/TSH)
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
     </ul>
  </div>
</div>

</fieldset>
<br>

<fieldset>  
    <legend style="font-size: x-large;"><b>Microbiology</b></legend>  
    
<div class="row">
  <div class="col-12">
    <ul>
      
     <li>
        <label class="container">WIDAL
          <input type="checkbox" checked="checked">
          <span class="checkmark"></span>
        </label>
     </li>
      
     <li>
        <label class="container">HIV
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
      
     <li>
        <label class="container">HBsAg
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
      
     <li>
        <label class="container">ASO Titre
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
      
      <li>
        <label class="container">RA Factor
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
     <li>
        <label class="container">V.D.R.L.
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>

     <li>
        <label class="container">C.R.P.
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>

     <li>
        <label class="container">Urine Analysis / Culture
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>

     <li>
        <label class="container">Semen Analysis
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>

     <li>
        <label class="container">Sputum for AFB
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>

     <li>
        <label class="container">Stool Analysis
          <input type="checkbox">
          <span class="checkmark"></span>
        </label>
     </li>
     </ul>
  </div>
</div>

</fieldset> 

<fieldset>
    <legend style="font-size: x-large;"><b>Any other Test</b></legend> 
    <input type="checkbox" name="othertests" id="xray">
    <label for="xray">X-ray</label>
    <input type="checkbox" name="othertests" id="usg">
    <label for="usg">U.S.G.</label>
    
</fieldset>

</form>  
</div>

<div>
<h2 style="text-align: center; font-size: xx-large; color: red;"><b>RADILOGY REQUISITION FORM</b></h2> 
        <form>
            <fieldset >
                <legend style="font-size: large;"><b>Clinic Details</b></legend> 
                <label for="clinicdetails"></label>
                <textarea rows="3" cols="100" name="clinicdetails" id="clinicdetails"></textarea>

            </fieldset>
            <br>
            <br>
            <fieldset>
                <legend style="font-size: large;"><b>X-RAY (Please specify the part)</b></legend> 
                <label for="xraydetails"></label>
                <textarea rows="3" cols="100" name="xraydetails" id="xraydetails"></textarea>

            </fieldset>
            <br>
            <br>

            <fieldset>  
                <legend style="font-size: large;"><b>USG</b></legend>  
                
            <div class="row">
              <div class="col-12">
                <ul>
                  
                 <li>
                    <label class="container">Abdomen
                      <input type="checkbox" checked="checked">
                      <span class="checkmark"></span>
                    </label>
                 </li>
                  
                 <li>
                    <label class="container">Thyroid
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                 </li>
                  
                 <li>
                    <label class="container">First trimester
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                 </li>
                  
                 <li>
                    <label class="container">Doppler - Arterial
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                 </li>
                  
                  <li>
                    <label class="container">Doppler - Venous
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                 </li>
                 <li>
                    <label class="container">Pelvis
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                 </li>
        
                 <li>
                    <label class="container">KUB
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                 </li>
        
                 <li>
                    <label class="container">Obstretic Doppler
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                 </li>
        
                 <li>
                    <label class="container">Third trimester
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                 </li>
        
                 <li>
                    <label class="container">Neck
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                 </li>
        
                 <li>
                    <label class="container">Breast
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                 </li>
                 <li>
                    <label class="container">Follicular Study
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                 </li>
                 <li>
                    <label class="container"> Neurosonogram
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                 </li>
                 <li>
                    <label class="container">NT
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                 </li>
                 
                 <li>
                    <label class="container">Anomaly
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                 </li>

                 <li>
                    <label class="container">Scrotum
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                 </li>
                 <li>
                    <label class="container">Carotic Doppler
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                 </li>
                 <li>
                    <label class="container">Others
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                 </li>
                   
                 
          
                 </ul>
              </div>
            </div>
          
        </fieldset>  

        <br>
        <br>
        <fieldset>
            <legend style="font-size: large;"><b>Small Parts - Please specify the region</b></legend> 
            <label for="spartdetails"></label>
            <textarea rows="3" cols="100" name="spartdetails" id="spartdetails"></textarea>

        </fieldset>
        </form>
</div>
			<!-- start: FOOTER -->
	<?php include('include/footer.php');?>
			<!-- end: FOOTER -->
		
			<!-- start: SETTINGS -->
	<?php include('include/setting.php');?>
			
			<!-- end: SETTINGS -->
		</div>
		<!-- start: MAIN JAVASCRIPTS -->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="vendor/modernizr/modernizr.js"></script>
		<script src="vendor/jquery-cookie/jquery.cookie.js"></script>
		<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
		<script src="vendor/switchery/switchery.min.js"></script>
		<!-- end: MAIN JAVASCRIPTS -->
		<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script src="vendor/maskedinput/jquery.maskedinput.min.js"></script>
		<script src="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
		<script src="vendor/autosize/autosize.min.js"></script>
		<script src="vendor/selectFx/classie.js"></script>
		<script src="vendor/selectFx/selectFx.js"></script>
		<script src="vendor/select2/select2.min.js"></script>
		<script src="vendor/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
		<script src="vendor/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<!-- start: CLIP-TWO JAVASCRIPTS -->
		<script src="assets/js/main.js"></script>
		<!-- start: JavaScript Event Handlers for this page -->
		<script src="assets/js/form-elements.js"></script>
		<script>
			jQuery(document).ready(function() {
				Main.init();
				FormElements.init();
			});
		</script>
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>
