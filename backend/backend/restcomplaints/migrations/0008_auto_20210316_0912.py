# Generated by Django 3.1.1 on 2021-03-16 09:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('restcomplaints', '0007_auto_20210316_0912'),
    ]

    operations = [
        migrations.AddField(
            model_name='account',
            name='is_admin',
            field=models.BooleanField(default=False),
        ),
        migrations.DeleteModel(
            name='Admin',
        ),
    ]