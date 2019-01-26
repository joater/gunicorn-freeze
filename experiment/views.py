from django.shortcuts import render
from django.http import HttpResponse


def get_n_chars(n):
    return 'a' * int(n)


chars_1000 = get_n_chars(1000)


def example_response(request):
    return HttpResponse(chars_1000)

