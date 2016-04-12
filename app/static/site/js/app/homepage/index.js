function formatNumbers(value) {
    var formattedValue = "";
    var string = value.toString();
    for (var i = 0; i < string.length; i++) {
        var el = string[i];
        if ((i + 1) % 3 == 0 && el != " ") {
            formattedValue += " ";
        }
        formattedValue += el;
    }
    return formattedValue.trim();
}

function makeNumbers() {
    var text = "";
    var possible = "0123456789";

    for (var i = 0; i < 16; i++) {
        if (i % 4 == 0) {
            text += " ";
        }
        text += possible.charAt(Math.floor(Math.random() * possible.length));
    }

    return text.trim();
}

$(function () {
    var numbersInput = $('#id-numbers-input'),
        amountInput = $('#id-amount-input'),
        currentInput = null,
        lotterySelect = $('#id-lottery-select'),
        buttonAuto = $('.button-auto'),
        buttonReset = $('.button-reset'),
        buttonDel = $('.button-del'),
        buttonEnter = $('.button-enter'),
        buttonNext = $('.button-next'),
        buttonPrev = $('.button-prev'),
        buttonClear = $('.button-clear'),
        buttonUndo = $('.button-undo'),
        lotteryId = null,
        playsCount = $('#id-plays-count'),
        overallAmount = $('#id-overall-amount'),
        numberInputBtns = $('.number-input'),
        currentPlay = $('#id-current-play');

    lotterySelect.on('change', function (e) {
        lotteryId = $(this).val();
    });

    numberInputBtns.on('click', function (e) {
        e.preventDefault();
        var number = $(this).html();
        if (currentInput == null) {
            currentInput = numbersInput;
        }

        var currentValue = currentInput.val();
        currentValue += number;

        if (currentValue.length > 1 && currentInput == numbersInput) {
            currentInput.val(formatNumbers(currentValue));
        } else {
            currentInput.val(currentValue);
        }
    });

    numbersInput.on('focus', function () {
        currentInput = numbersInput;
    });

    amountInput.on('focus', function () {
        currentInput = amountInput;
    });

    buttonAuto.on('click', function (e) {
        e.preventDefault();
        var randomNumbers = makeNumbers();
        numbersInput.val(randomNumbers);
    });

    buttonReset.on('click', function (e) {
        e.preventDefault();
        numbersInput.val('');
        amountInput.val('');
    });

    buttonDel.on('click', function (e) {
        e.preventDefault();
        currentInput.val(currentInput.val().substring(0, currentInput.val().length - 1));
    });

    buttonClear.on('click', function (e) {
        e.preventDefault();
        $.ajax({
            url: "/ticket/clear-plays/",
            type: "POST",
            dataType: 'json'
        }).done(function (response) {
                window.location.reload();
            });
    });

    buttonUndo.on('click', function (e) {
        var currentPlayId = parseInt(currentPlay.val());
        if (currentPlayId == 0) {
            bootbox.alert('This is the first play');
        } else {
            buttonPrev.click();
            var playId = parseInt(currentPlay.val());
            $.ajax({
                url: "/ticket/delete-play/",
                type: "POST",
                dataType: 'json',
                data: {
                    play_id: playId
                }
            }).done(function (response) {
                    if (response.result == 'error') {
                        bootbox.alert(response.message);
                    } else {
                        playsCount.html(response.overall_plays_count);
                        overallAmount.html(response.overall_amount);
                    }
                });
        }
    });

    buttonNext.on('click', function (e) {
        e.preventDefault();
        var currentPlayId = parseInt(currentPlay.val());
        var currentPlaysCount = parseInt(playsCount.html());
        if (currentPlayId == currentPlaysCount - 1) {
            bootbox.alert('This is the last play');
        } else {
            $.ajax({
                url: "/ticket/get-play/",
                type: "GET",
                dataType: 'json',
                data: {
                    play_id: currentPlayId + 1
                }
            }).done(function (response) {
                    if (response.result == 'error') {
                        bootbox.alert(response.message);
                    } else {
                        numbersInput.val(response.play.number);
                        amountInput.val(response.play.amount);
                        lotterySelect.val(response.play.lottery_id);
                        currentPlay.val(response.play_id);
                    }
                });
        }
    });

    buttonPrev.on('click', function (e) {
        e.preventDefault();
        var currentPlayId = parseInt(currentPlay.val());
        if (currentPlayId == 0) {
            bootbox.alert('This is the first play');
        } else {
            $.ajax({
                url: "/ticket/get-play/",
                type: "GET",
                dataType: 'json',
                data: {
                    play_id: currentPlayId - 1
                }
            }).done(function (response) {
                    if (response.result == 'error') {
                        bootbox.alert(response.message);
                    } else {
                        numbersInput.val(response.play.number);
                        amountInput.val(response.play.amount);
                        lotterySelect.val(response.play.lottery_id);
                        currentPlay.val(response.play_id);
                    }
                });
        }
    });

    buttonEnter.on('click', function (e) {
        e.preventDefault();
        var numbers = numbersInput.val(),
            amount = amountInput.val();

        if (!numbers || !amount || !lotteryId) {
            bootbox.alert("Please input numbers, amount and choose lottery.");
        } else {
            if (numbers.replace(/\s/g, "").length % 2 != 0) {
                bootbox.alert("All numbers must contain 2 digits");
            } else {
                $.ajax({
                    url: "/ticket/save-play/",
                    type: "POST",
                    dataType: 'json',
                    data: {
                        numbers: numbers,
                        amount: amount,
                        lottery_ids: lotteryId
                    }
                }).done(function (response) {
                        if (response.result == 'error') {
                            bootbox.alert(response.message);
                        } else {
                            playsCount.html(response.overall_plays_count);
                            overallAmount.html(response.overall_amount);
                            numbersInput.val('');
                            amountInput.val('');
                            currentPlay.val(response.next_play_id);
                            numbersInput.focus();
                        }
                    });
            }
        }
    });
});