# Generated by Django 2.0.2 on 2019-04-06 18:24

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('paciente', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Alergia',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('principio_ativo', models.CharField(max_length=120)),
                ('descricao', models.CharField(max_length=120)),
                ('grau_risco', models.IntegerField()),
            ],
            options={
                'db_table': 'alergia',
            },
        ),
        migrations.CreateModel(
            name='PacienteTemAlergia',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('consulta_id', models.IntegerField()),
                ('alergia', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='alergia.Alergia')),
                ('paciente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='paciente.Paciente')),
            ],
            options={
                'db_table': 'paciente_tem_alergia',
            },
        ),
    ]
