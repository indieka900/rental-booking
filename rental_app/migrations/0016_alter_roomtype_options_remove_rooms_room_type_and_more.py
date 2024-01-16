# Generated by Django 4.1.13 on 2024-01-16 21:03

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('rental_app', '0015_alter_booking_history_options_alter_rooms_options'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='roomtype',
            options={'ordering': ('room_type',)},
        ),
        migrations.RemoveField(
            model_name='rooms',
            name='room_type',
        ),
        migrations.AddField(
            model_name='rooms',
            name='type',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='rental_app.roomtype', verbose_name='Room-Type'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='roomtype',
            name='room_type',
            field=models.CharField(max_length=200, unique=True, verbose_name='Room Type'),
        ),
    ]
