# Generated by Django 5.1.7 on 2025-03-13 08:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("cinego", "0002_phim_anh_phim_phim_dao_dien"),
    ]

    operations = [
        migrations.CreateModel(
            name="ChiNhanh",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("ten_chi_nhanh", models.CharField(max_length=100)),
                ("dia_chi", models.TextField()),
            ],
        ),
    ]
