# Generated by Django 5.1.7 on 2025-04-08 00:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cinema', '0003_thanh_toan'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='thanh_toan',
            name='ngay_cap_nhat',
        ),
        migrations.AlterField(
            model_name='thanh_toan',
            name='trangthai',
            field=models.CharField(choices=[('chua thanh toan', 'Chưa thanh toán'), ('da thanh toan', 'Đã thanh toán'), ('dang xu ly', 'Đang xử lý')], default='chua thanh toan', max_length=20),
        ),
    ]
