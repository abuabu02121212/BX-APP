var forExample = 'For Example:';
var tw1 = '1. Direct Team:';

String getTw2({isOri = true}) => '${isOri ? '(1)' : '\\(1\\)'} B1, B2, B3 Contribute to A:';

String getTw3({isOri = true}) => '${isOri ? '(2)' : '\\(2\\)'} C1 and C2 Contribute to B1:';

String getTw4({isOri = true}) => '${isOri ? '(3)' : '\\(3\\)'} C3 Contributes to B3:';
var tw5 = '2. Other teams:';

String getTw6({isOri = true}) => '${isOri ? '(1)' : '\\(1\\)'} From C1 and C2:';

String getTw7({isOri = true}) => '${isOri ? '(2)' : '\\(2\\)'} From C3:';
var tw8 = 'C1 and C2 contribute to A:';
var tw9 = 'C3 Contributes to A:';
var tw10 = '3. Summary Description:';
var whiteBoldArr = [
  tw1,
  getTw2(isOri: false),
  getTw3(isOri: false),
  getTw4(isOri: false),
  tw5,
  getTw6(isOri: false),
  getTw7(isOri: false),
  tw8,
  tw9,
  tw10,
];
var num1 = '1260';
var num2 = '455';
var num3 = '21000';
var num4 = '0';

var yellowList = [
  num1,
  num2,
  num3,
  num4,
];

String getIllustrateEnglish() {
  return '''
  $forExample
      <p>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In this website the agent bonus is calculate by wagers. For example, the wagers are 10-200,000, then the corresponding bonus rate will be 35/10,000, and if wagers over 3000,000, the agent bonus is 70/10,000. A is the agent of the website, he recruits B1, B2 and B3 be his agents and B1 also recruits C1 and C2 be his agents. B2 has no agents and B3 only one agent C3.<p>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;After a few days, B1’s valid bets are 120,000, B2’s valid bets are 40,000, and B3’s valid bets are 20,000. C1’s valid bets are 100,000, C2’s valid bets are 30,000 and C3’s valid bets are 3000,000, therefore, B1’s total performance is C1+C2=130,000, and agent bonus rate is 35/10000. B2 has no agents, so B2’s total performance is 0. B3’s total performance is C3 - 3000,000, so the bonus rate is 70/10,000. A’s total performance from direct team is 180,000+Sub agent 3130,000=3310,000, so the bonus rate is 70/10,000. 
      </br></br>So their bonus calculate show as follow:</br>
$tw1 refers to the members of vertical development, which are collectively called direct team.</br>
${getTw2()} (120,000+40,000+20,000)x70/10,000=$num1.</br>
${getTw3()}</br>
(100,000+30,000)x35/10,000=$num2.</br>
${getTw4()}</br>
 3 million x 70/10,000=$num3.
</br></br>
$tw5  refers to the members of the development of subordinates, subordinates, subordinates, etc., which are collectively called other teams; because this system can develop subordinates indefinitely, for the convenience of explanation, this article only takes A 2-level structure is illustrated as an example.
(1) From C1 and C2:
</br>
Because B1's total performance is 130,000, it only enjoys a rebate ratio of 35/10,000, while A's total performance is 3.31 million, and it enjoys a 70/10,000 rebate ratio. Then the rebate difference between A and B1 is: 70-35=35/10,000, this difference is the part contributed by C1 and C2 to A, so  $tw8 (100,000+30,000)×35/10,000=455.
${getTw7()}
</br>
Since B3 has a total performance of 3 million and enjoys a rebate ratio of 70/10,000, while A has a total performance of 3.31 million and also enjoys a rebate ratio of 70/10,000, then the rebate difference between A and B3 is: 70-70=0/10,000. $tw9 3 million x0/10,000=$num4.
</br>
</br>
$tw10
(1) Because C3 is powerful, all of A's performance indirectly enjoys the highest rebate ratio.
(2) If B2 is lazy and does not develop subordinates, there will be no earnings.
(3) Although B3 joined relatively late and belongs to A's subordinates, its subordinate C3 is powerful, allowing B3 to directly enjoy the highest rebate ratio, so when B3 joins, whose position it is, no matter what level he is in, their benefits will never be affected, they will no longer suffer the losses of other subordinates, and their development will not be restricted.
(4) This is an absolutely fair and just agency model, and it will not be trampled on forever because of who joins late.''';
}
