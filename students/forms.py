from django import forms
from .models import Student

class StudentForm(forms.ModelForm):
    class Meta:
        model = Student
        fields = ['name', 'email', 'age', 'course']
        widgets = {
            'name': forms.TextInput(attrs={'placeholder': 'John Doe'}),
            'email': forms.EmailInput(attrs={'placeholder': 'john.doe@university.com'}),
            'age': forms.NumberInput(attrs={'placeholder': '21'}),
            'course': forms.TextInput(attrs={'placeholder': 'Business Administration'}),
        }
