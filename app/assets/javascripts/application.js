// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

/********************
 * processAjaxLinks
 ********************/
function processAjaxLinks( objLnk, dataType ) { // eventObject
  if ( typeof( objLnk.which ) !== 'undefined' ) { // Esto es para los a[william="true"]
    objLnk = this;
    //var dataType = objLnk.datatype; NO SE PUEDE
    var dataType = objLnk.getAttribute( 'datatype' );
    //var dataType = jQuery( this ).attr( 'datatype' );
    //var dataType = jQuery( this ).data( 'type' );
  }
  if ( typeof( dataType ) !== 'string' ) { dataType = 'html'; }
  
  var options = {
    url : objLnk.href,
    data : {},
    cache : false,
    dataType : dataType,
    success : function( data, textStatus, jqXHR ) {
      jQuery( '#results' ).html( data );
    },
    error : function( jqXHR, textStatus, errorThrown ) {
      console.log( textStatus + ' : ' + errorThrown );
    }
  };
  console.log(options);
  jQuery.ajax( options );
  
  return( false );
}

jQuery( document ).ready( function( $ ) {
  //jQuery( '[william="true"]' ).bind( 'click', {}, processAjaxLinks );
  jQuery( 'ul > li' ).on( 'click', 'a[enableAjax="true"]', {}, processAjaxLinks );
} );
