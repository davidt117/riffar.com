# coding: utf-8
from django import forms

from app.lottery.models import Lottery, WinningNumberLog


class LotteryForm(forms.ModelForm):
    class Meta:
        model = Lottery
        exclude = ['created_by', 'is_available']
        widgets = {
            'open_time': forms.TextInput(attrs={'data-role': 'datebox',
                                                'data-options': '{"mode":"timeflipbox", "overrideTimeOutput": "%H:%M", "overrideTimeFormat": "%H:%M"}'}),
            'close_time': forms.TextInput(attrs={'data-role': 'datebox',
                                                 'data-options': '{"mode":"timeflipbox", "overrideTimeOutput": "%H:%M", "overrideTimeFormat": "%H:%M"}'})
        }

    def clean(self):
        data = super(LotteryForm, self).clean()
        open_time = data.get('open_time')
        close_time = data.get('close_time')
        if open_time and close_time:
            if open_time >= close_time:
                raise forms.ValidationError(u"Lottery open time must be less than close time")
        return data


class LotteryEditForm(LotteryForm):
    class Meta(LotteryForm.Meta):
        exclude = ['created_by']


class StopNumbersForm(forms.Form):
    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request')
        lottery_choices = kwargs.pop('queryset')
        super(StopNumbersForm, self).__init__(*args, **kwargs)
        self.fields['lottery'].queryset = lottery_choices

    lottery = forms.ModelChoiceField(label=u"Lottery", queryset=None)
    numbers = forms.CharField(label=u"Comma-separated stop numbers")

    def clean_numbers(self):
        data = self.cleaned_data['numbers']
        try:
            cleaned_numbers = [int(n) for n in data.split(',')]

            for n in cleaned_numbers:
                if n < 10 or n > 99:
                    raise forms.ValidationError(u"Stop number must contain only 2 digits")

        except (ValueError, TypeError):
            raise forms.ValidationError(u"Stop numbers must be valid numbers")
        return cleaned_numbers


class WinningNumbersForm(forms.ModelForm):
    class Meta:
        model = WinningNumberLog
        fields = [
            'winning_numbers_first_place',
            'winning_numbers_second_place',
            'winning_numbers_third_place',
            'date_of_report'
        ]

    def clean_winning_numbers_first_place(self):
        fp_numbers = self.cleaned_data.get('winning_numbers_first_place', '')
        return fp_numbers.replace(' ', '')

    def clean_winning_numbers_second_place(self):
        sp_numbers = self.cleaned_data.get('winning_numbers_second_place', '')
        return sp_numbers.replace(' ', '')

    def clean_winning_numbers_third_place(self):
        tp_numbers = self.cleaned_data.get('winning_numbers_third_place', '')
        return tp_numbers.replace(' ', '')

    def clean(self):
        data = self.cleaned_data
        fp_numbers = self.cleaned_data.get('winning_numbers_first_place', '')
        sp_numbers = self.cleaned_data.get('winning_numbers_second_place', '')
        tp_numbers = self.cleaned_data.get('winning_numbers_third_place', '')
        if not all([fp_numbers, sp_numbers, tp_numbers]):
            raise forms.ValidationError(u"You must enter all 3 numbers")
        return data


class ReportForm(forms.Form):
    date_to = forms.DateField(label=u"Date To", required=False)
    date_from = forms.DateField(label=u"Date From", required=False)