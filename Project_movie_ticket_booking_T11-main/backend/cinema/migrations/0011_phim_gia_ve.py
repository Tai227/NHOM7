# Generated by Django 5.1.7 on 2025-04-11 17:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cinema', '0010_remove_thanh_toan_soluong_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='phim',
            name='gia_ve',
            field=models.FloatField(blank=True, null=True),
        ),
    ]
