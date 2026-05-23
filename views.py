import datetime
import json

from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render

# Create your views here.
from myapp.models import *


def login(request):
    return render(request,'index.html')

def login_post(request):
    username=request.POST['textfield']
    password=request.POST['textfield2']
    a=login_table.objects.filter(username=username,password=password)
    if a.exists():
        b= login_table.objects.get(username=username, password=password)
        request.session['lid']=b.id
        if b.type == 'admin':
            ob1=auth.authenticate(username="admin",password="admin")
            if ob1 is not None:
                auth.login(request,ob1)
            return HttpResponse('''<script>alert('admin logined successfully');window.location='/home'</script>''')
        elif b.type == 'officer':
            ob1 = auth.authenticate(username="admin", password="admin")
            if ob1 is not None:
                auth.login(request, ob1)
            return HttpResponse('''<script>alert('officer logined successfully');window.location='/officerhome'</script>''')

        else:
            return HttpResponse('''<script>alert('invalid');window.location='/'</script>''')
    else:
        return HttpResponse('''<script>alert('invalid user');window.location='/'</script>''')

def logout(request):
    auth.logout(request)
    return render(request,"index.html")

@login_required(login_url='/')
def addanimal(request):
    ob=forestdivision_table.objects.all()
    return render(request,'admin/add animal.html',{'data':ob})




@login_required(login_url='/')
def addanimal_post(request):
    name=request.POST['textfield']
    division=request.POST['select']
    image=request.FILES['file']
    description=request.POST['textfield2']

    fs=FileSystemStorage()
    fp=fs.save(image.name,image)

    ob=animal_table()
    ob.animal_name=name
    ob.DIVISION_id=division
    ob.image=fp
    ob.description=description
    ob.save()
    return HttpResponse('''<script>alert('added successgully');window.location='/viewanimal'</script>''')


@login_required(login_url='/')
def editanimal(request,id):
    aa=animal_table.objects.get(id=id)
    request.session['id']=id
    ob=forestdivision_table.objects.all()
    return render(request,'admin/edit animal.html',{'data':ob,'ani':aa})


@login_required(login_url='/')
def editanimal_post(request):
    name=request.POST['textfield']
    division=request.POST['select']
    description=request.POST['textfield2']




    ob=animal_table.objects.get(id=request.session['id'])
    if 'file' in request.FILES:
        fs = FileSystemStorage()
        image = request.FILES['file']

        fp = fs.save(image.name, image)
        ob.image = fp

    ob.animal_name=name
    ob.DIVISION_id=division
    ob.description=description
    ob.save()
    return HttpResponse('''<script>alert('edited successgully');window.location='/viewanimal'</script>''')

@login_required(login_url='/')
def addcamera(request):
    return render(request,'admin/map_start.html')

@login_required(login_url='/')
def editcamera(request,id):
    aa=camera_table.objects.get(id=id)
    request.session['id']=id
    return render(request,'admin/editcamera_map_start.html',{'cam':aa})


@login_required(login_url='/')
def editcamera_post(request):
    camera_no=request.POST['textfield']
    location=request.POST['textarea']
    # longitude=request.POST['textarea3']
    # latitude=request.POST['textarea2']

    ob=camera_table.objects.get(id=request.session['id'])
    ob.camera_no=camera_no
    ob.location=location
    # ob.longitude=0
    # ob.latitude=0
    ob.save()
    request.session['cid']=request.session['id']
    return render(request,"admin/editcamera_map_start.html",{"lon":ob.longitude,"lat":ob.latitude})
    return HttpResponse('''<script>alert('edited successgully');window.location='/viewcamera'</script>''')

@login_required(login_url='/')
def editloccamera_post(request):
    camera_no=request.POST['textfield']
    location=request.POST['textarea']
    longitude=request.POST['lon']
    latitude=request.POST['lat']

    ob=camera_table.objects.get(id=request.session['id'])
    ob.camera_no=camera_no
    ob.location=location
    ob.longitude=longitude
    ob.latitude=latitude
    ob.save()
    request.session['cid']=request.session['id']
    # return render(request,"admin/editcamera_map_start.html",{"lon":ob.longitude,"lat":ob.latitude})
    return HttpResponse('''<script>alert('edited successgully');window.location='/viewcamera'</script>''')


@login_required(login_url='/')
def addcamera_post(request):
    camera_no=request.POST['textfield']
    location=request.POST['textarea']
    # longitude=request.POST['textarea3']
    # latitude=request.POST['textarea2']

    ob=camera_table()
    ob.camera_no=camera_no
    ob.location=location
    ob.longitude=0
    ob.latitude=0
    ob.save()
    request.session['cid']=ob.id
    return render(request,"admin/map_start.html")

def insert_loc(request):
    print('000000')
    # print('111111111111', request.session['cid'])
    # ob = camera_table.objects.get(id=request.session[200])
    ob=camera_table()

    ob.camera_no=request.POST['textfield']
    ob.location = request.POST['textarea']
    ob.longitude = request.POST['lon']
    ob.latitude = request.POST['lat']
    ob.save()
    return HttpResponse('''<script>alert('added successgully');window.location='/viewcamera'</script>''')


@login_required(login_url='/')
def addemergencycontact(request):
    return render(request,'admin/add emergency contact.html')


@login_required(login_url='/')
def addemergencycontact_post(request):
    contact_details=request.POST['textarea']
    contact_no=request.POST['textfield']

    ob=contact_table()
    ob.contact_details=contact_details
    ob.contact_no=contact_no
    ob.save()
    return HttpResponse('''<script>alert('added successgully');window.location='/viewemergencycontact'</script>''')


@login_required(login_url='/')
def addforestdivision(request):
    return render(request,'admin/add forest division.html')

@login_required(login_url='/')
def addforestdivision_post(request):
    name=request.POST['textfield']
    area=request.POST['textarea']
    details=request.POST['textarea2']

    ob=forestdivision_table()
    ob.name=name
    ob.area=area
    ob.details=details

    ob.save()
    return HttpResponse('''<script>alert('added successgully');window.location='/viewforestdivision'</script>''')


@login_required(login_url='/')
def editforestdivision(request,id):
    aa=forestdivision_table.objects.get(id=id)
    request.session['id']=id
    return render(request,'admin/edit forest division.html',{'div':aa})


@login_required(login_url='/')
def editforestdivision_post(request):
    name=request.POST['textfield']
    area=request.POST['textarea']
    details=request.POST['textarea2']

    ob=forestdivision_table.objects.get(id=request.session['id'])
    ob.name=name
    ob.area=area
    ob.details=details

    ob.save()
    return HttpResponse('''<script>alert('edited successgully');window.location='/viewforestdivision'</script>''')


@login_required(login_url='/')
def addforestfirenotification(request):
    return render(request,'admin/add forest fire notification.html')

# def addforestfirenotification_post(request):
#     notification=request.POST['textarea']
#     date=request.POST['text']
#     type=request.POST['select']



@login_required(login_url='/')
def addforestofficer(request):
    return render(request,'admin/add forest officer.html')


@login_required(login_url='/')
def addforestofficer_post(request):
    officer=request.POST['textfield']
    email=request.POST['textfield2']
    phone=request.POST['textfield3']
    image=request.FILES['file']
    id_proof=request.FILES['file2']
    username=request.POST['textfield4']
    password=request.POST['textfield5']

    fs = FileSystemStorage()
    fp = fs.save(image.name, image)

    fs1 = FileSystemStorage()
    fp1 = fs1.save(id_proof.name, id_proof)

    ob1=login_table()
    ob1.username=username
    ob1.password=password
    ob1.type='officer'
    ob1.save()
    ob=forestofficer_table()
    ob.officer_name=officer
    ob.email=email
    ob.phone=phone
    ob.image=fp
    ob.id_proof=fp1
    ob.LOGIN=ob1
    ob.save()
    return HttpResponse('''<script>alert('added successgully');window.location='/viewforestofficer'</script>''')


@login_required(login_url='/')
def editforestofficer(request,id):
    aa=forestofficer_table.objects.get(id=id)
    request.session['id']=id
    return render(request,'admin/edit forest officer.html',{'offi':aa})


@login_required(login_url='/')
def editforestofficer_post(request):
    officer=request.POST['textfield']
    email=request.POST['textfield2']
    phone=request.POST['textfield3']
    ob=forestofficer_table.objects.get(id=request.session['id'])
    ob.officer_name=officer
    ob.email=email
    ob.phone=phone
    if 'file' in request.FILES:
        fs=FileSystemStorage()
        image=request.FILES['file']
        fp=fs.save(image.name, image)
        ob.image=fp


    if 'file2' in request.FILES:
        fs1=FileSystemStorage()
        id_proof=request.FILES['file2']
        fp1=fs1.save(id_proof.name, id_proof)
        ob.id_proof=fp1

    ob.save()
    return HttpResponse('''<script>alert('edited successgully');window.location='/viewforestofficer'</script>''')



@login_required(login_url='/')
def addforeststation(request):
    ob=forestdivision_table.objects.all()
    return render(request,'admin/add forest station.html',{'data':ob})


@login_required(login_url='/')
def addforeststation_post(request):
    name=request.POST['textfield']
    division=request.POST['select']
    place=request.POST['textfield1']
    post=request.POST['textfield2']
    pin=request.POST['textfield3']
    phone=request.POST['textfield4']
    email=request.POST['textfield5']
    longitude=request.POST['textfield7']
    latitude=request.POST['textfield6']

    ob=foreststation_table()
    ob.station_name=name
    ob.DIVISION_id=division
    ob.place=place
    ob.post=post
    ob.pin=pin
    ob.phone=phone
    ob.email=email
    ob.longitude=longitude
    ob.latitude=latitude
    ob.save()
    return HttpResponse('''<script>alert('added successgully');window.location='/viewforeststation'</script>''')


@login_required(login_url='/')
def editforeststation(request,id):
    ob=forestdivision_table.objects.all()
    aa = foreststation_table.objects.get(id=id)
    request.session['id']=id
    return render(request,'admin/edit forest station.html',{'data':ob,'sta':aa})



@login_required(login_url='/')
def editforeststation_post(request):
    name=request.POST['textfield']
    division=request.POST['select']
    place=request.POST['textfield1']
    post=request.POST['textfield2']
    pin=request.POST['textfield3']
    phone=request.POST['textfield4']
    email=request.POST['textfield5']
    longitude=request.POST['textfield7']
    latitude=request.POST['textfield6']

    ob=foreststation_table.objects.get(id=request.session['id'])
    ob.station_name=name
    ob.DIVISION_id=division
    ob.place=place
    ob.post=post
    ob.pin=pin
    ob.phone=phone
    ob.email=email
    ob.longitude=longitude
    ob.latitude=latitude
    ob.save()
    return HttpResponse('''<script>alert('edited successgully');window.location='/viewforeststation'</script>''')


@login_required(login_url='/')
def addpreserved(request):
    return render(request,'admin/add preserved animal.html')


@login_required(login_url='/')
def addpreserved_post(request):
    name=request.POST['textfield']
    image=request.FILES['file']
    description=request.POST['textarea']

    ob=preservedanimal_table()
    ob.name=name
    ob.image=image
    ob.description=description
    ob.save()
    return HttpResponse('''<script>alert('added successgully');window.location='/viewpreserved'</script>''')



@login_required(login_url='/')
def editpreserved(request,id):
    aa=preservedanimal_table.objects.get(id=id)
    request.session['id']=id
    return render(request,'admin/edit preserved animal.html',{'pre':aa})


@login_required(login_url='/')
def editpreserved_post(request):
    name=request.POST['textfield']
    description=request.POST['textarea']

    ob=preservedanimal_table.objects.get(id=request.session['id'])
    ob.name=name
    if 'file' in request.FILES:
        fs=FileSystemStorage()
        image=request.FILES['file']

        fp=fs.save(image.name,image)
        ob.image=fp
    ob.description=description
    ob.save()
    return HttpResponse('''<script>alert('edited successgully');window.location='/viewpreserved'</script>''')


@login_required(login_url='/')
def allocateofficer(request):
    ob=forestofficer_table.objects.all()
    ob1=foreststation_table.objects.all()
    return render(request,'admin/allocate forest officer.html',{'data':ob,"val":ob1})


@login_required(login_url='/')
def allocateofficer_post(request):
    station_name=request.POST['select']
    officer_name=request.POST['select2']
    kk=allocation_table.objects.filter(FOREST_OFFICER__id=officer_name)
    if len(kk) == 0:

        ob=allocation_table()
        ob.FOREST_OFFICER=forestofficer_table.objects.get(id=station_name)
        ob.FOREST_station=foreststation_table.objects.get(id=officer_name)
        ob.date=datetime.datetime.today()
        ob.save()
        return HttpResponse('''<script>alert('added successgully');window.location='/viewallocatedofficer'</script>''')
    else:
        return HttpResponse('''<script>alert('already assigned');window.location='/viewallocatedofficer'</script>''')


@login_required(login_url='/')
def deleteallocate(request,id):
    ob=allocation_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('deleted successgully');window.location='/viewallocatedofficer'</script>''')



@login_required(login_url='/')
def sendnotificationtoofficer(request):
    ob=forestofficer_table.objects.all()
    return render(request,'admin/send notification to forest officer.html',{'data':ob})


@login_required(login_url='/')
def sendnotification_post(request):
    notification=request.POST['textarea']
    officer=request.POST['select']
    ob=notification_table()
    ob.notification=notification
    ob.date=datetime.datetime.today()
    ob.FOREST_OFFICER_id=officer
    ob.save()
    return HttpResponse('''<script>alert('added successgully');window.location='/viewsendnotifitoofficer'</script>''')





@login_required(login_url='/')
def sendreplyforcomplaints(request,id):
    request.session['cid']=id
    ob=complaint_table.objects.get(id=id)
    return render(request,'admin/send reply for complaint.html',{'val':ob})


@login_required(login_url='/')
def complaintreply_post(request):
    reply=request.POST['textarea']

    ob=complaint_table.objects.get(id=request.session['cid'])
    ob.reply=reply
    ob.save()
    return HttpResponse('''<script>alert('added successgully');window.location='/viewcomplaint'</script>''')


@login_required(login_url='/')
def viewallocatedofficer(request):
    a=allocation_table.objects.all()
    return render(request,'admin/view allocated officer.html',{'data':a})


@login_required(login_url='/')
def viewanimal(request):
    a=animal_table.objects.all()
    return render(request,'admin/view animal.html',{'data':a})


@login_required(login_url='/')
def deleteanimal(request,id):
    ob=animal_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('deleted successgully');window.location='/viewanimal'</script>''')


@login_required(login_url='/')
def searchanimal(request):
    animal_name=request.POST['textfield']
    a=animal_table.objects.filter(animal_name__icontains=animal_name)
    return render(request,'admin/view animal.html',{'data':a,'animal_name':animal_name})


@login_required(login_url='/')
def viewcamera(request):
    a=camera_table.objects.all()
    return render(request,'admin/view camere.html',{'data':a})


@login_required(login_url='/')
def deletecamera(request,id):
    ob=camera_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('deleted successgully');window.location='/viewcamera'</script>''')

@login_required(login_url='/')
def viewcomplaint(request):
    a=complaint_table.objects.all()
    return render(request,'admin/view complaint.html',{'data':a})


@login_required(login_url='/')
def searchcomplaint(request):
    date=request.POST['textfield']
    a = complaint_table.objects.filter(date__icontains=date)
    return render(request,'admin/view complaint.html',{'data':a,'date':date})


@login_required(login_url='/')
def viewemergencycontact(request):
    a=contact_table.objects.all()
    return render(request,'admin/view emergency contact.html',{'data':a})


@login_required(login_url='/')
def deletecontact(request,id):
    ob=contact_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('deleted successgully');window.location='/viewemergencycontact'</script>''')



@login_required(login_url='/')
def viewforestdivision(request):
    a=forestdivision_table.objects.all()
    return render(request,'admin/view forest division.html',{'data':a})


@login_required(login_url='/')
def deleteforestdivision(request,id):
    ob=forestdivision_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('deleted successgully');window.location='/viewforestdivision'</script>''')



@login_required(login_url='/')
def searchforestdivision(request):
    area=request.POST['textfield']
    a = forestdivision_table.objects.filter(area__icontains=area)
    return render(request,'admin/view forest division.html',{'data':a,'area':area})


@login_required(login_url='/')
def viewforestfirenoti(request):
    a=cameraalert_table.objects.all()
    return render(request,'admin/view forest fire notificaton.html',{'data':a})

@login_required(login_url='/')
def searchdateforestfire(request):
    date=request.POST['textfield']
    ob=cameraalert_table.objects.filter(date__icontains=date)
    return render(request,'admin/view forest fire notificaton.html',{'data':ob,'date':date})


@login_required(login_url='/')
def viewforestofficer(request):
    a = forestofficer_table.objects.all()
    return render(request,'admin/view forest officer.html',{'data':a})



@login_required(login_url='/')
def searchforestofficer(request):
    officer_name=request.POST['textfield']
    a=forestofficer_table.objects.filter(officer_name__icontains=officer_name)
    return render(request,'admin/view forest officer.html',{'data':a,'officer_name':officer_name})


@login_required(login_url='/')
def deleteforestofficer(request,id):
    ob=forestofficer_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('deleted successgully');window.location='/viewforestofficer'</script>''')

@login_required(login_url='/')
def viewforeststation(request):
    a=foreststation_table.objects.all()
    return render(request,'admin/view forest station.html',{'data':a})



@login_required(login_url='/')
def searchforeststation(request):
    station_name=request.POST['textfield']
    a=foreststation_table.objects.filter(station_name__icontains=station_name)
    return render(request,'admin/view forest station.html',{'data':a,'station_name':station_name})



@login_required(login_url='/')
def deleteforeststation(request,id):
    ob=foreststation_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('deleted successgully');window.location='/viewforeststation'</script>''')


@login_required(login_url='/')
def viewpreserved(request):
    a=preservedanimal_table.objects.all()
    return render(request,'admin/view preserved animals.html',{'data':a})



@login_required(login_url='/')
def deletepreserved(request,id):
    ob=preservedanimal_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('deleted successgully');window.location='/viewpreserved'</script>''')



@login_required(login_url='/')
def searchpreserved(request):
    name=request.POST['textfield']
    a=preservedanimal_table.objects.filter(name__icontains=name)
    return render(request,'admin/view preserved animals.html',{'data':a,'name':name})

@login_required(login_url='/')
def viewreport(request):
    a=report_table.objects.all()
    return render(request,'admin/view report.html',{'data':a})


@login_required(login_url='/')
def searchreport(request):
    date=request.POST['textfield']
    a=report_table.objects.filter(date__icontains=date)
    return render(request,'admin/view report.html',{'data':a,'date':date})


@login_required(login_url='/')
def deletereport(request,id):
    ob=report_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('deleted successgully');window.location='/viewreport'</script>''')


@login_required(login_url='/')
def viewsendnotifitoofficer(request):
    a=notification_table.objects.all()
    return render(request,'admin/view send notification to officer.html',{'data':a})



@login_required(login_url='/')
def home(request):
    return render(request,'admin/index.html')

#officer
@login_required(login_url='/')
def officerhome(request):
    # return render(request,'officer/officerhome.html')
    return render(request,'officer/officerindex.html')


@login_required(login_url='/')
def sendalerttouser(request):
    return render(request,'officer/map_start_officer.html')


@login_required(login_url='/')
def sendalerttouser_post(request):
    alert=request.POST['alert']
    longitude=request.POST['lon']
    latitude=request.POST['lat']


    ob=emergencyalert_table()
    ob.alert=alert
    ob.longitude=longitude
    ob.latitude=latitude
    ob.FOREST_OFFICER=forestofficer_table.objects.get(LOGIN=request.session['lid'])
    ob.save()
    return HttpResponse('''<script>alert('send successfully');window.location='/viewsendalerttouser'</script>''')

@login_required(login_url='/')
def deletesendalerttouser(request,id):
    ob = emergencyalert_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('deleted successgully');window.location='/viewsendalerttouser'</script>''')



@login_required(login_url='/')
def sendcomplaints(request):
    return render(request, 'officer/send complaints.html')


@login_required(login_url='/')
def sendcomplaints_post(request):
    complaint=request.POST['textarea']

    ob=complaint_table()
    ob.LOGIN_id=request.session['lid']
    ob.complaint=complaint
    ob.date=datetime.datetime.now()
    ob.save()
    return HttpResponse('''<script>alert('added successfully');window.location='/viewreply'</script>''')


@login_required(login_url='/')
def sendreport(request):
    return render(request, 'officer/send report.html')


@login_required(login_url='/')
def sendreport_post(request):
    report=request.POST['file']

    ob=report_table()
    ob.report=report
    ob.date = datetime.datetime.now()
    ob.FOREST_OFFICER=forestofficer_table.objects.get(LOGIN=request.session['lid'])
    ob.save()
    return HttpResponse('''<script>alert('added successfully');window.location='/viewreportoffi'</script>''')


@login_required(login_url='/')
def deletereportoffi(request,id):
    ob=report_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('deleted successgully');window.location='/viewreportoffi'</script>''')



@login_required(login_url='/')
def viewforestfirenotification(request):
    a=cameraalert_table.objects.all()
    return render(request, 'officer/view forest fire notification.html',{'data':a})



@login_required(login_url='/')
def viewreply(request):
    a=complaint_table.objects.filter(LOGIN_id=request.session['lid'])
    return render(request,'officer/view reply.html',{'data':a})


@login_required(login_url='/')
def viewreportoffi(request):
    a=report_table.objects.all()
    return render(request,'officer/view report.html',{'data':a})


@login_required(login_url='/')
def viewsendalerttouser(request):
    a=emergencyalert_table.objects.all()
    return render(request,'officer/view send alert to user.html',{'data':a})

#
# @login_required(login_url='/')
# def viewhumanentry(request):
#     a=cameraalert_table.objects.all()
#     return render(request,'officer/view human entry notification.html',{'data':a})
#
#
# @login_required(login_url='/')
# def searchhumanentry(request):
#     date=request.POST['textfield']
#     a=cameraalert_table.objects.filter(date__icontains=date)
#     return render(request,'officer/view human entry notification.html',{'data':a,'date':date})
#
#
#
#
#
# @login_required(login_url='/')
# def deleteviewhumanentry(request,id):
#     ob=cameraalert_table.objects.get(id=id)
#     ob.delete()
#     return HttpResponse('''<script>alert('deleted successgully');window.location='/viewhumanentry'</script>''')


@login_required(login_url='/')
def viewnotifromadmin(request):
    a=notification_table.objects.all()
    return render(request,'officer/notification from admin.html',{'data':a})


@login_required(login_url='/')
def officerprofile(request):
    a=forestofficer_table.objects.get(LOGIN_id=request.session['lid'])
    return render(request,'officer/profile.html',{'data':a})


# ----------------------------------android-------------------------------------------------------------


def logincode(request):
    print(request.POST)
    un = request.POST['username']
    pwd = request.POST['password']
    print(un, pwd)
    try:
        ob = login_table.objects.get(username=un, password=pwd)

        if ob is None:
            data = {"task": "invalid"}
        else:
            print("in user function")
            data = {"task": "valid", "lid": ob.id,"type":ob.type}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)
    except:
        data = {"task": "invalid"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)


def userregistration(request):
    # name=request.POST["name"]
    name=request.POST.get("name", "")
    # dob=request.POST["dob"]
    dob = request.POST.get("dob", "")
    # place=request.POST["place"]
    place = request.POST.get("place", "")
    # gender=request.POST["gender"]
    gender = request.POST.get("gender", "")
    # phone=request.POST["phone"]
    phone = request.POST.get("phone", "")
    # email=request.POST["email"]
    email = request.POST.get("email", "")
    image=request.FILES["image"]
    username=request.POST["username"]
    password=request.POST["password"]

    fs=FileSystemStorage()
    fp=fs.save(image.name,image)

    obb=login_table()
    obb.username= username
    obb.password = password
    obb.type='user'
    obb.save()

    ob=user_table()
    ob.name=name
    ob.dob=dob
    ob.place=place
    ob.gender=gender
    ob.phone=phone
    ob.email=email
    ob.image=fp
    ob.LOGIN=obb
    ob.save()
    return JsonResponse({'task':'valid'})



def sendcomplaint(request):
    comp = request.POST['complaint']
    lid = request.POST['lid']
    lob = complaint_table()
    lob.LOGIN = login_table.objects.get(id=lid)
    lob.complaint = comp
    lob.date = datetime.datetime.today()
    lob.reply = 'pending'
    lob.save()
    return JsonResponse({'task': 'ok'})

def viewreplyuser(request):
    lid=request.POST["lid"]
    ob=complaint_table.objects.filter(LOGIN=lid)
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'complaint':i.complaint,'reply':i.reply,'date':str(i.date),'id':i.id}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})


def viewcontact(request):
    ob=contact_table.objects.all()
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'contactdetails':i.contact_details,'contact':i.contact_no,'id':i.id}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})


def viewnotification(request):
    ob=emergencyalert_table.objects.all()
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'alert':i.alert,'forestofficer':i.FOREST_OFFICER.officer_name,'longitude':i.longitude,'latitude':i.latitude,'id':i.id}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})

def viewprofile(request):
    lid=request.POST["lid"]
    ob=user_table.objects.get(LOGIN_id=lid)
    print(ob)
    return JsonResponse({'status':'ok','name':ob.name,'dob':ob.dob,'place':ob.place,'gender':ob.gender,'phone':ob.phone,'email':ob.email,'image':request.build_absolute_uri(ob.image.url),})


def view_userdivision(request):
    ob=forestdivision_table.objects.all()
    print(ob, "HHHHHHHHHHHHHHH")
    mdata = []
    for i in ob:
        data = {'name': i.name, 'area': i.area, 'details': i.details,'id': i.id}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status": "ok", "data": mdata})

def view_useranimal(request):
    did=request.POST["did"]
    ob = animal_table.objects.filter(DIVISION=did)
    print(ob, "HHHHHHHHHHHHHHH")
    mdata = []
    for i in ob:
        data = {'animal_name': i.animal_name, 'division': i.DIVISION.name,'image': str(i.image.url) if i.image else None, 'description': i.description,'id': i.id}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status": "ok", "data": mdata})

def view_firedetection(request):
    ob=cameraalert_table.objects.filter(notification='fire')
    print(ob, "HHHHHHHHHHHHHHH")
    mdata = []
    for i in ob:
        data = {'notification': i.notification, 'date': str(i.date),'image': request.build_absolute_uri(i.image.url) if i.image else None,'id': i.id}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status": "ok", "data": mdata})

def view_humandetection(request):
    ob=cameraalert_table.objects.filter(notification='human')
    print(ob, "HHHHHHHHHHHHHHH")
    mdata = []
    for i in ob:
        data = {'notification': i.notification, 'date': i.date,'type': i.type,'image': request.build_absolute_uri(i.image.url) if i.image else None,'id': i.id}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status": "ok", "data": mdata})

def view_animaldetection(request):
    ob=cameraalert_table.objects.filter(notification='animal')
    print(ob, "HHHHHHHHHHHHHHH")
    mdata = []
    for i in ob:
        data = {'notification': i.notification, 'date': i.date,'image': request.build_absolute_uri(i.image.url) if i.image else None,'id': i.id}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status": "ok", "data": mdata})



def insert_noti(request):
    from datetime import datetime
    cid = request.GET['cid']
    fn = request.GET['fn']

    ob = cameraalert_table()
    ob.CAMERA =camera_table.objects.get(id=cid)
    ob.image = fn
    ob.date = datetime.today()
    ob.notification = 'fire'
    ob.save()
    return JsonResponse({"task": "ok"})


def insertnotification(request):
    from datetime import datetime
    cid = request.GET['cida']
    fn = request.GET['fn']

    ob = cameraalert_table()
    ob.CAMERA = camera_table.objects.get(id=cid)
    ob.image = fn
    ob.date = datetime.today()
    ob.notification = 'animal'
    ob.save()
    return JsonResponse({"task": "ok"})

def inserthuman(request):
    from datetime import datetime
    cid = request.GET['cida']
    fn = request.GET['fn']

    ob = cameraalert_table()
    ob.CAMERA =camera_table.objects.get(id=cid)
    ob.image = fn
    ob.date = datetime.today()
    ob.notification = 'human'
    ob.save()
    return JsonResponse({"task": "ok"})
