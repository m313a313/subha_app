import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  setCount(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter2', value);
  }

  setRepetion(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('repetion', value);
  }

  setgoal(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('goal', value);
  }

  getCount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter2') ?? 0;
      repetion = prefs.getInt('repetion') ?? 0;
      goal = prefs.getInt('goal') ?? 33;
    });
  }

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    getCount();
  }

  int ColorHex = 0xffB1001c;
  int repetion = 0;
  int counter = 0;
  int total = 0;
  static int goal = 33;
  resetToZero({bool resetGoal=true}) {
    setCount(counter = 0);
    setgoal(resetGoal ? goal= 0: goal);
    setRepetion(repetion = 0);
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(ColorHex);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          resetToZero();
        },
        backgroundColor: mainColor,
        child: Icon(Icons.refresh_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      appBar: AppBar(
        centerTitle: true,
        title: Text('حيــــدر علي الشاطري'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.color_lens))],
        backgroundColor: mainColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(color: mainColor),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "الهدف",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                resetToZero(resetGoal: false);
                                 if(goal>0)                             
                                goal -= 1;
                                setgoal(goal);
                                setState(() {
                                  goal;
                                });
                              });
                            },
                            icon: Icon(Icons.remove_circle),
                            color: Colors.white),
                      ),
                      Text(
                        '$goal',
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              resetToZero(resetGoal: false);
                              goal += 1;
                              setgoal(goal);
                              setState(() {});
                            });
                          },
                          icon: Icon(Icons.add_circle),
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          resetToZero(resetGoal: false);
                          setgoal(goal += 1000);
                          setState(() {
                            goal;
                          });
                        },
                        child: countContainer(
                          numb: '1000+',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          resetToZero(resetGoal: false);
                          setgoal(goal += 100);
                          setState(() {
                            goal;
                          });
                        },
                        child: countContainer(
                          numb: '100+',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          resetToZero(resetGoal: false);
                          setgoal(goal = 100);
                          setState(() {
                            goal;
                          });
                        },
                        child: countContainer(
                          numb: '100',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          resetToZero(resetGoal: false);
                          setgoal(goal = 33);
                          setState(() {
                            goal;
                          });
                        },
                        child: countContainer(
                          numb: '33',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          resetToZero(resetGoal: false);
                          setgoal(goal = 0);
                          setState(() {
                            goal;
                          });
                        },
                        child: countContainer(
                          numb: '0',
                        ),
                      ),
                    ],
                  )
                ]),
          ),
          Column(
            children: [
              SizedBox(
                height: 0,
              ),
              Text(
                'التسبيح',
                style: TextStyle(color: mainColor, fontSize: 22),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '$counter',
                style: TextStyle(color: mainColor, fontSize: 22),
              ),
              SizedBox(
                height: 1,
              ),
              new CircularPercentIndicator(
                radius: 80.0,
                lineWidth: 5.0,
                percent: counter / goal,
                center: IconButton(
                  icon: Icon(Icons.touch_app),
                  iconSize: 50.0,
                  color: mainColor,
                  onPressed: () {
                    setState(() {
                      if (counter >= goal) {
                        counter = 1;
                        repetion++;
                        setCount(counter);
                        setRepetion(repetion);
                      } else {
                        counter++;
                      }
                    });
                  },
                ),
                backgroundColor: mainColor.withOpacity(.2),
                progressColor: mainColor,
              ),
              SizedBox(
                height: 1,
              ),
              Text(
                'مرات التكرار: $repetion',
                style: TextStyle(color: mainColor, fontSize: 22),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'المجموع: ${counter + goal * repetion}',
                style: TextStyle(color: mainColor, fontSize: 22),
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              Radio(
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => Color(0xffB1001c)),
                  value: 0xffB1001c,
                  groupValue: ColorHex,
                  onChanged: (val) {
                    setState(() {
                      ColorHex = val!;
                    });
                  }),
              Radio(
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => Color(0xff14212A)),
                  value: 0xff14212A,
                  groupValue: ColorHex,
                  onChanged: (val) {
                    setState(() {
                      ColorHex = val!;
                    });
                  }),
              Radio(
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => Color(0xff63349F)),
                  value: 0xff63349F,
                  groupValue: ColorHex,
                  onChanged: (val) {
                    setState(() {
                      ColorHex = val!;
                    });
                  }),
            ],
          )
        ],
      ),
    );
  }
}

class countContainer extends StatelessWidget {
  countContainer({
    super.key,
    required this.numb,
  });
  final String numb;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Text(numb),
    );
  }
}
