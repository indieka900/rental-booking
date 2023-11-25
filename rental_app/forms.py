from django import forms
from rental_app.models import Rooms,Apartments

class RoomForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs.update({'class': 'form-control'})
            self.fields[field].widget.attrs.update({'style': 'width: 350px;'})
    class Meta:
        model = Rooms
        fields = ("room_number","booked", "size", "room_type","rent","rate","image")
        
        '''widgets = {
                'size': forms.TextInput(attrs={'style': 'width: 350px;'}),
            }'''
        
class ApartmentForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs.update({'class': 'form-control'})
            self.fields[field].widget.attrs.update({'style': 'width: 350px;'})
    class Meta:
        model = Apartments
        fields = ("apartment_name", "description", "facilities","paid_for","location","image")
        
       
        
        