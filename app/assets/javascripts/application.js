// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require twitter/bootstrap


$(document).on('turbolinks:load', function() {

    $(function() { 
        // for bootstrap 3 use 'shown.bs.tab', for bootstrap 2 use 'shown' in the next line
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            // save the latest tab; use cookies if you like 'em better:
            localStorage.setItem('lastTab', $(this).attr('href'));
        });

        // go to the latest tab, if it exists:
        var lastTab = localStorage.getItem('lastTab');
        if (lastTab) {
            $('[href="' + lastTab + '"]').tab('show');
            id = lastTab.replace('#', '');
            $("#category-changer").val(id);
        }
    });

    $(document).ready(function(){

        $('[data-toggle="popover"]').popover(); 

        var modal = document.getElementById('myModal');
        var span = document.getElementsByClassName("close")[0];
        var modal_content = document.getElementsByClassName("modal-content")[0];

        $('#category-changer').on('change', function(){
            $('#tabber-'+$(this).val()).tab('show');
        });

        $('.show_modal').on('click', function(){
            let id = $(this).attr('data-id');
            fetch('/detail/'+id)
                .then(function(resp){
                    return resp.text();
                })
                .then(function(content){
                   modal_content.innerHTML = content;
                }).then(function(content){
                   modal.style.display = "block";
                });
        });

        span.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

    });  

});


