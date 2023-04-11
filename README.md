# handle-FScalendar
### 팀 프로젝트 과정 중, 오픈라이브러리 FSCalendar 만져보기 <br>
#### + Custom NavigationBar, 사이드메뉴, Custom Alert 만들기 
<br>
<br>

### 디자인 패턴
---
#### MVC 패턴 
<br> 
<br>


### 제작 과정
--- 
#### Custom NavigationBar & 사이드메뉴 (햄버거 바) 
1. FSCalendar를 사용한 calendarView UI 제작
2. monthlyView의 headerView(customNavigationBar 역할) UI 제작
3. MonthlyVC에 [headerView, calendarView] stackView로 묶어서 올리기
4. 사이드메뉴(햄버거메뉴)와 monthlyView를 담을 containerView 생성
5. containerView - [사이드메뉴, MonthlyView] 순서로 쌓기
6. containerView - 객체에 enum 타입 속성 생성하여 사이드메뉴 open / closed 분기처리
<br>

#### Custom Alert 
1. UIView 생성
2. UIView 위에 customAlert창 역할을 할 view 생성
3. UIView 배경 색에 alpha값 줘서 반투명하게 만들기
4. customAlert UI 제작
5. calendarView 상의 오늘 날짜 누르면, customAlert present하기 
6. 화면 터치하면 customAlert dismiss 시키기 
<br>

### 결과
---
![Simulator Screen Recording - iPhone 14 - 2023-04-09 at 18 43 50](https://user-images.githubusercontent.com/126672733/230765894-a14eb1d5-ad7a-4a2d-b48b-378700d2c1b0.gif)
![Simulator Screen Recording - iPhone 14 - 2023-04-09 at 18 46 01](https://user-images.githubusercontent.com/126672733/230765993-e9399c04-1174-4836-812b-4432d7bd22fb.gif)
