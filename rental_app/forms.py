from django import forms
from rental_app.models import Rooms

class AddRoomForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs.update({'class': 'form-control'})
            self.fields[field].widget.attrs.update({'style': 'width: 350px;'})
    class Meta:
        model = Rooms
        fields = ("room_number", "size", "room_type","rent","rate")
        
        '''widgets = {
                'size': forms.TextInput(attrs={'style': 'width: 350px;'}),
            }'''
        
        