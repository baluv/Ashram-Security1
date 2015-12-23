<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>





<script src="../security/jquery-1.6.2.js"></script>

<script type="text/javascript">
    var index=1;
    var flag=5;//because i have only 5 rows initially,so the counter for 6th onwards
    $(document).ready(function()
     {
    	$("[id^=text]").datepick();
    });
     $(document).ready(function()
     {
    	$("[id^=text1]").datepick();
    });
     $(document).ready(function()
     {
    	$("[id^=text2]").datepick();
    });
    </script>

<script type="text/javascript" src="../security/jquery.datepick.js"></script>
<style type="text/css">
@import "../security/jquery.datepick.css";


.font {
	color: red;
}
</style>
<link href="../security/main.css" rel="stylesheet" type="text/css">

 
</head>
<table align="center" width="30%" border="0">

		<tr>
			<td>Reporting Date and Time</td>
			<td><form:input  path="reporting_date_time" id="text2"/></td>
			<!-- <td><form:select path="reporting_date_time">
			<form:option value="none">--hours--</form:option>
			<form:option value="1">1</form:option>
			<form:option value="2">2</form:option>
			<form:option value="3">3</form:option>
			<form:option value="4">4</form:option>
			<form:option value="5">5</form:option>
			<form:option value="6">6</form:option>
			<form:option value="7">7</form:option>
			<form:option value="8">8</form:option>
			<form:option value="9">9</form:option>
			<form:option value="10">10</form:option>
			<form:option value="11">11</form:option>
			<form:option value="12">12</form:option>
			<form:option value="13">13</form:option>
			<form:option value="14">14</form:option>
			<form:option value="15">15</form:option>
			<form:option value="16">16</form:option>
			<form:option value="17">17</form:option>
			<form:option value="18">18</form:option>
			<form:option value="19">19</form:option>
			<form:option value="20">20</form:option>
			<form:option value="21">21</form:option>
			<form:option value="22">22</form:option>
			<form:option value="23">23</form:option>
			<form:option value="24">24</form:option>
			</form:select></td>
			<td><form:select path="reporting_date_time">
			<form:option value="none">--minutes--</form:option>
			<form:option value="1">1</form:option>
			<form:option value="2">2</form:option>
			<form:option value="3">3</form:option>
			<form:option value="4">4</form:option>
			<form:option value="5">5</form:option>
			<form:option value="6">6</form:option>
			<form:option value="7">7</form:option>
			<form:option value="8">8</form:option>
			<form:option value="9">9</form:option>
			<form:option value="10">10</form:option>
			<form:option value="11">11</form:option>
			<form:option value="12">12</form:option>
			<form:option value="13">13</form:option>
			<form:option value="14">14</form:option>
			<form:option value="15">15</form:option>
			<form:option value="16">16</form:option>
			<form:option value="17">17</form:option>
			<form:option value="18">18</form:option>
			<form:option value="19">19</form:option>
			<form:option value="20">20</form:option>
			<form:option value="21">21</form:option>
			<form:option value="22">22</form:option>
			<form:option value="23">23</form:option>
			<form:option value="24">24</form:option>
			<form:option value="25">25</form:option>
			<form:option value="26">26</form:option>
			<form:option value="27">27</form:option>
			<form:option value="28">28</form:option>
			<form:option value="29">29</form:option>
			<form:option value="30">30</form:option>
			<form:option value="31">31</form:option>
			<form:option value="32">32</form:option>
			<form:option value="33">33</form:option>
			<form:option value="34">34</form:option>
			<form:option value="35">35</form:option>
			<form:option value="36">36</form:option>
			<form:option value="37">37</form:option>
			<form:option value="38">38</form:option>
			<form:option value="39">39</form:option>
			<form:option value="40">40</form:option>
			<form:option value="41">41</form:option>
			<form:option value="42">42</form:option>
			<form:option value="43">43</form:option>
			<form:option value="44">44</form:option>
			<form:option value="45">45</form:option>
			<form:option value="46">46</form:option>
			<form:option value="47">47</form:option>
			<form:option value="48">48</form:option>
			<form:option value="49">49</form:option>
			<form:option value="50">50</form:option>
			<form:option value="51">51</form:option>
			<form:option value="52">52</form:option>
			<form:option value="53">53</form:option>
			<form:option value="54">54</form:option>
			<form:option value="55">55</form:option>
			<form:option value="56">56</form:option>
			<form:option value="57">57</form:option>
			<form:option value="58">58</form:option>
			<form:option value="59">59</form:option>
			<form:option value="60">60</form:option>
			
			</form:select>
			
			</td>
			<td><form:select path="reporting_date_time">
			<form:option value="none">--select--</form:option>
			<form:option value="AM">AM</form:option>
			<form:option value="PM">PM</form:option>
			</form:select></td> -->
		</tr>
		<tr>
			<td>Items Lost</td>
			<td><form:textarea path="itemslost"/></td>
		</tr>
		<tr>
			<td>Place Of Lost</td>
			<td><form:input  path="placeoflost"/></td>
		</tr>
		<tr>
			<td>Approximate Value</td>
			<td><form:input  path="approx_value"/></td>
		</tr>
		<tr>
			<td>Receipt Number</td>
			<td><form:input  path="receipt_no"/></td>
		</tr>
		<tr>
			<td>Remark/Details of Action taken</td>
			<td><form:textarea  path="remarks"/></td>
		</tr>
		<tr>
			<td colspan="4" align="center"><input type="submit"
				value="submit" style="height:25px; width:100px"/></td>
			
		</tr>
		<tr>
			<th colspan="4" class="font">${msg}</th>
		</tr>
	</table>
</html>