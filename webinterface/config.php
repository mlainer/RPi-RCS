<?php
/*
 * Raspberry Remote
 * http://xkonni.github.com/raspberry-remote/
 *
 * configuration for the webinterface
 *
 */

/*
 * define ip address and port here
 */
$source = $_SERVER['SERVER_ADDR'];
$target = '127.0.0.1';
$port = 11337;

/*
 * specify configuration of sockets to use
 *   array("systemcode", "group" , "plug", "description");
 * use empty string to create empty box
 *   ""
 *
 */
$config=array(
  /*
   * Elro
   */
  array("1", "00000", "01", "01"),
  array("1", "00000", "02", "02"),
  array("1", "00000", "03", "03-Lampe"),
  array("1", "00000", "04", "04"),
  array("1", "00000", "05", "05")
  /*
   * Intertech
   
  array("2", "01", "01", "IT 1"),
  array("2", "01", "02", "IT 2"),
  array("2", "01", "03", "IT 3"),
  array("2", "01", "04", "IT 4"),
   */
  )
?>
