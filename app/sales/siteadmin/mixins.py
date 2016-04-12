# coding: utf-8
class WinningReportCalculationMixin(object):
    def calculate_report(self, obj):
        lottery = obj.lottery
        d = obj.date_of_report
        calculations = {}

        fp_numbers = obj.winning_numbers_first_place.split(',')
        sp_numbers = obj.winning_numbers_second_place.split(',')
        tp_numbers = obj.winning_numbers_third_place.split(',')

        plays = lottery.lottery_plays.filter(date_created__day=d.day, date_created__month=d.month,
                                             date_created__year=d.year)
        report = []

        calculations['total_sold'] = 0
        calculations['total_commissions'] = 0
        calculations['total_won'] = 0

        for p in plays:
            calculations['total_sold'] += int(p.amount)
            play_numbers = p.number.split(' ')

            first_place = False
            second_place = False
            third_place = False

            winning_numbers = []

            for number in fp_numbers:
                if number in play_numbers:
                    first_place = True
                    winning_numbers.append(number)
                    break

            for number in sp_numbers:
                if number in play_numbers:
                    second_place = True
                    winning_numbers.append(number)
                    break

            for number in tp_numbers:
                if number in play_numbers:
                    third_place = True
                    winning_numbers.append(number)
                    break

            if first_place and not second_place and not third_place:
                # Single win, first place
                place = "1st"
            elif not first_place and second_place and not third_place:
                # Single win, second_place
                place = "2nd"
            elif not first_place and not second_place and third_place:
                # Single win, third place
                place = "3rd"
            elif first_place and second_place and not third_place:
                # Double win, first and second places
                place = "1st,2nd"
            elif first_place and not second_place and third_place:
                # Double win, first and third places
                place = "1st,3rd"
            elif not first_place and second_place and third_place:
                # Double win, second and third places
                place = "2nd,3rd"
            elif all([first_place, second_place, third_place]):
                # Triple win
                place = "1st,2nd,3rd"
            else:
                # No win
                place = None

            element = self.get_report_element(place, p, winning_numbers, lottery)
            report.append(element)
            calculations['total_commissions'] += element.get('commission_amount', 0)
            calculations['total_won'] += element.get('total_amount_wo_commission', 0)

        calculations['total_commissions'] *= -1
        calculations['total_won'] *= -1

        calculations['total_net'] = calculations['total_sold'] + calculations['total_commissions'] + calculations[
            'total_won']

        calculations['seller_commissions'] = {}
        calculations['win_amounts'] = {}
        for el in report:
            if el['seller'].email not in calculations['seller_commissions']:
                calculations['seller_commissions'][el['seller'].email] = 0
            calculations['seller_commissions'][el['seller'].email] += el['commission_amount']

            if el['place'] not in calculations['win_amounts']:
                calculations['win_amounts'][el['place']] = {}
                calculations['win_amounts'][el['place']]['amount'] = 0
                calculations['win_amounts'][el['place']]['numbers'] = []
            calculations['win_amounts'][el['place']]['amount'] += el.get('total_amount_wo_commission')
            if el.get('number') not in calculations['win_amounts'][el['place']]['numbers']:
                calculations['win_amounts'][el['place']]['numbers'].append(el.get('number'))

        calculations['report'] = report
        return calculations

    @staticmethod
    def get_report_element(place, play, number, lottery):
        payment_amount = {
            "1st": lottery.payment_amount_first_place,
            "2nd": lottery.payment_amount_second_place,
            "3rd": lottery.payment_amount_third_place,
            "1st,2nd": lottery.payment_amount_first_and_second_place,
            "1st,3rd": lottery.payment_amount_first_and_third_place,
            "2nd,3rd": lottery.payment_amount_second_and_third_place,
            "1st,2nd,3rd": lottery.payment_amount_triplets,
        }.get(place, 0)

        total_amount = int(play.amount) * payment_amount
        commission_amount = int(play.amount) * (play.ticket.user.commission_percent / 100)
        return {
            'place': place,
            'seller': play.ticket.user,
            'commission': play.ticket.user.commission_percent,
            'number': ','.join(number),
            'amount': play.amount,
            'payment_amount': payment_amount,
            'total_amount_wo_commission': total_amount,
            'total_amount_w_commission': total_amount - commission_amount,
            'commission_amount': commission_amount
        }