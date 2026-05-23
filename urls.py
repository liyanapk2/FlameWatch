
from django.contrib import admin
from django.urls import path, include

from myapp import views

urlpatterns = [
   path('',views.login),
   path('logout',views.logout),
   path('addanimal',views.addanimal),
   path('addcamera',views.addcamera),
   path('addemergencycontact',views.addemergencycontact),
   path('addforestdivision',views.addforestdivision),
   path('addforestfirenotification',views.addforestfirenotification),
   path('addforestofficer',views.addforestofficer),
   path('addforeststation',views.addforeststation),
   path('addpreserved',views.addpreserved),
   path('allocateofficer',views.allocateofficer),
   path('sendnotificationtoofficer',views.sendnotificationtoofficer),
   path('insert_loc',views.insert_loc),
   path('sendreplyforcomplaints/<id>', views.sendreplyforcomplaints),

   path('viewallocatedofficer',views.viewallocatedofficer),
   path('viewanimal', views.viewanimal),
   path('viewcamera', views.viewcamera),
   path('viewcomplaint', views.viewcomplaint),
   path('viewemergencycontact', views.viewemergencycontact),
   path('viewforestdivision', views.viewforestdivision),
   path('viewforestfirenoti', views.viewforestfirenoti),
   path('viewforestofficer', views.viewforestofficer),
   path('viewforeststation', views.viewforeststation),
   path('viewpreserved', views.viewpreserved),
   path('viewreport', views.viewreport),
   path('viewsendnotifitoofficer', views.viewsendnotifitoofficer),
   path('home', views.home),
   path('officerhome',views.officerhome),
   path('login_post',views.login_post),

   path('addforestdivision_post', views.addforestdivision_post),
   path('addanimal_post', views.addanimal_post),
   path('addcamera_post', views.addcamera_post),
   path('addemergencycontact_post', views.addemergencycontact_post),
   path('addforeststation_post', views.addforeststation_post),
   path('addforestofficer_post',views.addforestofficer_post),
   path('addpreserved_post',views.addpreserved_post),
   path('allocateofficer_post',views.allocateofficer_post),
   path('sendnotification_post', views.sendnotification_post),

   path('editanimal/<id>',views.editanimal),
   path('editanimal_post',views.editanimal_post),
   path('editcamera/<id>',views.editcamera),
   path('editcamera_post', views.editcamera_post),
   path('editloccamera_post',views.editloccamera_post),
   path('editforestdivision/<id>', views.editforestdivision),
   path('editforestdivision_post', views.editforestdivision_post),
   path('editforestofficer/<id>', views.editforestofficer),
   path('editforestofficer_post', views.editforestofficer_post),
   path('editforeststation/<id>', views.editforeststation),
   path('editforeststation_post', views.editforeststation_post),
   path('editpreserved/<id>', views.editpreserved),
   path('editpreserved_post', views.editpreserved_post),
   path('complaintreply_post', views.complaintreply_post),
   path('searchforestdivision', views.searchforestdivision),
   path('searchforeststation', views.searchforeststation),
   path('searchanimal', views.searchanimal),
   path('searchpreserved', views.searchpreserved),
   path('searchforestofficer', views.searchforestofficer),
   path('searchcomplaint', views.searchcomplaint),
   path('searchreport', views.searchreport),
   path('searchdateforestfire',views.searchdateforestfire),

   path('deletecamera/<id>', views.deletecamera),
   path('deleteforestdivision/<id>', views.deleteforestdivision),
   path('deleteforeststation/<id>', views.deleteforeststation),
   path('deleteanimal/<id>', views.deleteanimal),
   path('deletepreserved/<id>', views.deletepreserved),
   path('deleteforestofficer/<id>', views.deleteforestofficer),
   path('deletereport/<id>', views.deletereport),
   path('deletecontact/<id>', views.deletecontact),
   path('deleteallocate/<id>', views.deleteallocate),




   path('sendalerttouser',views.sendalerttouser),
   path('sendcomplaints', views.sendcomplaints),
   path('sendreport', views.sendreport),
   path('viewforestfirenotification', views.viewforestfirenotification),
   path('viewreply', views.viewreply),
   path('viewreportoffi', views.viewreportoffi),
   path('viewsendalerttouser', views.viewsendalerttouser),
   # path('viewhumanentry',views.viewhumanentry),
   path('viewnotifromadmin',views.viewnotifromadmin),
   path('officerprofile',views.officerprofile),


   path('sendcomplaints_post',views.sendcomplaints_post),
   path('sendreport_post',views.sendreport_post),
   path('sendalerttouser_post',views.sendalerttouser_post),
   # path('searchhumanentry',views.searchhumanentry),


   path('deletereportoffi/<id>',views.deletereportoffi),
   path('deletesendalerttouser/<id>',views.deletesendalerttouser),
   # path('deleteviewhumanentry/<id>',views.deleteviewhumanentry),




   path('logincode',views.logincode),
   path('userregistration',views.userregistration),
   path('viewprofile',views.viewprofile),
   path('sendcomplaint',views.sendcomplaint),
   path('viewreplyuser',views.viewreplyuser),
   path('viewcontact',views.viewcontact),
   path('viewnotification',views.viewnotification),
   path('view_userdivision',views.view_userdivision),
   path('view_useranimal',views.view_useranimal),
   path('view_firedetection',views.view_firedetection),
   path('view_humandetection',views.view_humandetection),
   path('view_animaldetection',views.view_animaldetection),
   path('insertnotification',views.insertnotification),
   path('inserthuman',views.inserthuman),
   path('insert_noti',views.insert_noti),

]
