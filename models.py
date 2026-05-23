from django.db import models

# Create your models here.
class login_table(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    type=models.CharField(max_length=100)


class forestdivision_table(models.Model):
    name=models.CharField(max_length=100)
    area=models.CharField(max_length=100)
    details=models.CharField(max_length=1000)


class foreststation_table(models.Model):
    station_name=models.CharField(max_length=100)
    DIVISION=models.ForeignKey(forestdivision_table,on_delete=models.CASCADE)
    place=models.CharField(max_length=100)
    post = models.CharField(max_length=100)
    pin = models.BigIntegerField()
    phone = models.BigIntegerField()
    email = models.CharField(max_length=100)
    longitude = models.BigIntegerField()
    latitude = models.BigIntegerField()


class animal_table(models.Model):
    animal_name = models.CharField(max_length=100)
    DIVISION = models.ForeignKey(forestdivision_table, on_delete=models.CASCADE)
    image = models.FileField()
    description = models.CharField(max_length=100)


class preservedanimal_table(models.Model):
    name = models.CharField(max_length=100)
    image = models.FileField()
    description = models.CharField(max_length=100)


class forestofficer_table(models.Model):
    LOGIN=models.ForeignKey(login_table, on_delete=models.CASCADE)
    officer_name = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    phone = models.BigIntegerField()
    image = models.FileField()
    id_proof = models.FileField()


class complaint_table(models.Model):
    complaint = models.CharField(max_length=1000)
    reply = models.CharField(max_length=100)
    date = models.DateField()
    LOGIN = models.ForeignKey(login_table, on_delete=models.CASCADE)


class camera_table(models.Model):
    camera_no = models.BigIntegerField()
    location = models.CharField(max_length=100)
    longitude = models.FloatField()
    latitude = models.FloatField()


class notification_table(models.Model):
    FOREST_OFFICER = models.ForeignKey(forestofficer_table, on_delete=models.CASCADE)
    date = models.DateField()
    notification = models.CharField(max_length=100)


class allocation_table(models.Model):
    FOREST_OFFICER = models.ForeignKey(forestofficer_table, on_delete=models.CASCADE)
    FOREST_station = models.ForeignKey(foreststation_table, on_delete=models.CASCADE)
    date = models.DateField()



class report_table(models.Model):
    FOREST_OFFICER = models.ForeignKey(forestofficer_table, on_delete=models.CASCADE)
    report = models.FileField()
    date = models.DateField()


class cameraalert_table(models.Model):
    notification = models.CharField(max_length=100)
    date = models.DateField()
    # ipconfig\
    #     =models.CharField(max_length=100)
    CAMERA=models.ForeignKey(camera_table, on_delete=models.CASCADE)
    image = models.FileField()


class contact_table(models.Model):
    contact_details=models.CharField(max_length=100)
    contact_no=models.BigIntegerField()


class emergencyalert_table(models.Model):
    alert=models.CharField(max_length=100)
    FOREST_OFFICER = models.ForeignKey(forestofficer_table, on_delete=models.CASCADE)
    longitude = models.FloatField()
    latitude = models.FloatField()


class user_table(models.Model):
    name = models.CharField(max_length=100)
    dob = models.DateField()
    place = models.CharField(max_length=100)
    gender = models.CharField(max_length=100)
    phone = models.BigIntegerField()
    email = models.CharField(max_length=100)
    LOGIN = models.ForeignKey(login_table, on_delete=models.CASCADE)
    image = models.FileField()



