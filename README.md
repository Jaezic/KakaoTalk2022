# KakaoTalk 클론 코딩 2022
Gachon univeristy - 2022 Computer Network, Team Project : Clone Kakaotalk for UDP/TCP Communication
<br>
UDP/TCP Network를 이용한 카카오톡 서버, 클라이언트 만들기

## **JAVA Server**
### **MultiThread**
ExecutorService MultiThread를 이용해서 TCP/UDP 통신을 여러 Client와 진행할 수 있음.


### BroadCast 
Client와 Server가 연결이 되면 Server는 Client와 연결된 TCP Socket을 User ID로 관리한다.
한 Client가 특정 API를 요청하고, 해당 API가 다른 Client에게 API를 요청하도록 유도하기 위해 연결된 TCP Socket에 API BroadCast를 이용한다.
