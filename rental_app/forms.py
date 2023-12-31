from django import forms
from rental_app.models import Rooms,Apartments

class RoomForm(forms.ModelForm):
    def __init__(self, apartment_id, *args, **kwargs):
        self.apartment_id = apartment_id
        super().__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs.update({'class': 'form-control'})
            self.fields[field].widget.attrs.update({'style': 'width: 350px;'})
            
    def clean_room_number(self):
        room_number = self.cleaned_data.get('room_number')
        apartment_initial = Apartments.objects.get(id=self.apartment_id).apartment_name[0].upper()

        # Ensure the room_number is not empty
        if not room_number:
            raise forms.ValidationError("Room number cannot be empty.")

        # Ensure the room_number is a valid format (e.g., "01" or "23")
        if not room_number.isdigit():
            raise forms.ValidationError("Room number must be a valid number.")

        # Concatenate the apartment initial and room number (e.g., "M-01" or "M-23")
        return f"{apartment_initial}-{room_number.zfill(2)}"
    class Meta:
        model = Rooms
        fields = ("room_number","booked", "size", "room_type","rent","rate","image")
        
        '''widgets = {
                'size': forms.TextInput(attrs={'style': 'width: 350px;'}),
            }'''
class UpdateRoomForm(forms.ModelForm):
    def __init__(self,  *args, **kwargs):
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
        
       
        
        