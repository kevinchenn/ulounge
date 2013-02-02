
// Sets up the stars to match the data when the page is loaded.
$(function () {
    var checkedId = $('form.rating_ballot > input:checked').attr('id');
    $('form.rating_ballot > label[for=' + checkedId + ']').prevAll().andSelf().addClass('bright');
});

$(document).ready(function() {
    // Makes stars glow on hover.
    $('form.rating_ballot > label').hover(
        function() {    // mouseover
            $(this).prevAll().andSelf().addClass('glow');
        },function() {  // mouseout
            $(this).siblings().andSelf().removeClass('glow');
    });

    // Makes stars stay glowing after click.
    $('form.rating_ballot > label').click(function() {
        $(this).siblings().removeClass("bright");
        $(this).prevAll().andSelf().addClass("bright");
    });

    // Submits the form (saves data) after user makes a change.
    $('form.rating_ballot').change(function() {
        $('form.rating_ballot').submit();
    });
});
/*
//Waits until the page is loaded, then looks for a form with a class of "rating_ballot", 
//and after any change i made to that form it submit the form, just like if you had clicked the submit button
$(document).ready(function() {
    // Submits the form (saves data) after user makes a change.
    $('form.rating_ballot').change(function() {
        $('form.rating_ballot').submit();
    });
});
*/

