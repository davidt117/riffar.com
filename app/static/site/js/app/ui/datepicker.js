$(function () {
    $(".datetime").datetimepicker({format: 'mm/dd/yyyy hh:ii:ss', language: 'en', weekStart: 1, autoclose: true});
    $(".date").datetimepicker({format: 'mm/dd/yyyy', language: 'en', weekStart: 1, minView: 2, autoclose: true});
    $(".time").timepicker({ step: 15, timeFormat: 'H:i:s' });
});