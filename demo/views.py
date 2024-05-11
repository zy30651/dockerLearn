from django import http
from django.views import View


# Create your views here.
class IndexView(View):
    def get(self, request):
        return http.JsonResponse({'code': 200, 'msg': "it is ok"})

