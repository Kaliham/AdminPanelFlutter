# Generated by Django 3.1.1 on 2021-03-16 09:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('restcomplaints', '0006_admin'),
    ]

    operations = [
        migrations.AlterField(
            model_name='admin',
            name='is_admin',
            field=models.BooleanField(default=False),
        ),
    ]
