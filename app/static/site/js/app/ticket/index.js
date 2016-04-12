$(function () {
    var saveTicketButton = $('.save-ticket');

    saveTicketButton.on('click', function (e) {
        bootbox.alert("Ticket was successfully added", function () {
            document.location.href = '/';
        });
    });
});