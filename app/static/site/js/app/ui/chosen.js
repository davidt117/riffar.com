$(function () {
    $('select[multiple=multiple]').chosen();

    var chosenContainer = $('.chosen-container');

    if (chosenContainer.length > 0) {
        chosenContainer.on('touchstart', function (e) {
            e.stopPropagation();
            e.preventDefault();
            $(this).trigger('mousedown');
        });
    }
});