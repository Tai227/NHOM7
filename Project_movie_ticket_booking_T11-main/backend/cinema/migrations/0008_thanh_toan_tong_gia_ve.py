# Generated by Django 5.1.7 on 2025-04-08 15:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cinema', '0007_remove_lich_chieu_gia'),
    ]

    operations = [
        migrations.AddField(
            model_name='thanh_toan',
            name='tong_gia_ve',
            field=models.FloatField(blank=True, null=True),
        ),
    ]
