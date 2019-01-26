from django.urls import path
from experiment.views import *


urlpatterns = [
    path('example_response', example_response),
]
