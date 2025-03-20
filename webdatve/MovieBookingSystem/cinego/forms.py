from django import forms
from django.contrib.auth import authenticate
from .models import NguoiDung

class LoginForm(forms.Form):
    email = forms.EmailField(label="Email hoặc số điện thoại")
    password = forms.CharField(label="Mật khẩu", widget=forms.PasswordInput)

    def clean(self):
        cleaned_data = super().clean()
        email = cleaned_data.get("email")
        password = cleaned_data.get("password")

        if email and password:
            user = authenticate(username=email, password=password)
            if not user:
                raise forms.ValidationError("Email hoặc mật khẩu không đúng")
        return cleaned_data
