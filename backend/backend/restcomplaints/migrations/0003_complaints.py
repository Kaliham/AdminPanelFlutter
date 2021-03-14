# Generated by Django 3.1.1 on 2021-03-14 16:06

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('restcomplaints', '0002_auto_20210314_1439'),
    ]

    operations = [
        migrations.CreateModel(
            name='Complaints',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100)),
                ('description', models.TextField()),
                ('rating', models.IntegerField()),
                ('gender', models.CharField(max_length=10)),
                ('type_data', models.CharField(max_length=10)),
                ('occurrence', models.IntegerField(max_length=3)),
                ('platforms', models.TextField()),
                ('account', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='restcomplaints.account')),
            ],
        ),
    ]
