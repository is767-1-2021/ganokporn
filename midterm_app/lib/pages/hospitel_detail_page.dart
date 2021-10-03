import 'package:flutter/material.dart';
import 'package:midterm_app/pages/patient_list_page.dart';

class HospitelDetailPage extends StatelessWidget {
  final String image = "assets/quarantine-detail.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              foregroundDecoration: BoxDecoration(color: Colors.black26),
              height: 450,
              child: Image.asset(image, fit: BoxFit.cover)),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Hospitel Detail\nFor Patient",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(
                      width: 16.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        "8.4/85 Reviews",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.tealAccent.shade700,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.tealAccent.shade700,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.tealAccent.shade700,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.tealAccent.shade700,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.tealAccent.shade700,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.tealAccent.shade700,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "\$ 200",
                                style: TextStyle(
                                    color: Colors.tealAccent.shade700,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              Text(
                                "/Per night",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12.0),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.tealAccent.shade700,
                          ),
                          child: Text(
                            'Go to Home page',
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PatientListPage(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        "Description".toUpperCase(),
                      ),
                      Text(
                        "With increasing number of COVID-19 infected people, there is a need to manage health resources properly so as not to affect the health system. field hospital and hospitel are another option to reduce the burden of regular hospitals. Field hospitals are legally required to serve as temporary health care facilities. Guest must understand that 1. It is a place to treat infected patients only, and do not provide screening services. Screening service for COVID-19 is provided at hospitals only.  2. Infected people who are admitted to field hospital and hospitel are those who have no symptoms or a little symptom.  It is a state quarantine facility for infected people who are not required to be hospitalized, in order to reduce the risk of infecting by health professionals, healthcare workers and people in communities, and also reducing number of hospital beds occupancy. 3. Field hospitals and hospitels received only referred patients from hospitals.  Patients are not able to request to stay at a field hospital or hospitel by themselves, and 4. It is a 'an alternative' option. Field hospitals are not the only alternative to conventional medical facilities, since patients can choose to stay in hospitels.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 12.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "COVID-19 hospitel quarantine package in Bangkok. Get tested, isolated and monitored for symptoms comfortably. Enjoy peace of mind and quality care by our partner private hospitals.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 12.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "DETAIL",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
            ),
          ),
          /*Align(
            alignment: Alignment.bottomLeft,
            child: BottomNavigationBar(
              backgroundColor: Colors.white54,
              elevation: 0,
              selectedItemColor: Colors.lightBlue.shade800,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Setting'),
              ],
            ),
            
          ),

          */
        ],
      ),
    );
  }
}
