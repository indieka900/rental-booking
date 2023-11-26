from phonenumber_field.phonenumber import phonenumbers

phone_number = "0712 12345674"
# Enter the phone number without spaces
e164_phone_number = phone_number.as_e164()

# Display the phone number in E.164 format
print(e164_phone_number)