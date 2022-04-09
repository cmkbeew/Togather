# Togather

맥에서 구동하게 되면 몇가지 xml 코드가 수정되야 하는 부분이 있어서 몇몇 xml파일들과  
서로 경로가 다르게 저장되는 Path.java GBPath.java 들은   
.gitignore에 추가해서 github에 반영되지 않음  



### 현재 gitignore에 추가되어있는 파일들  
root-context.xml  
application.properties    *(mac에서 설정하느라 만들어진 파일이라 나(대현)만 갖고있음)*  
log4jdbc.log4j2.properties  *(mac에서 설정하느라 만들어진 파일이라 나(대현)만 갖고있음)*  
logback.xml *(mac에서 설정하느라 만들어진 파일이라 나(대현)만 갖고있음)*  
webapp/META-INF  
Path.java  
GBPath.java  
webapp/WEB-INF/classes  
webapp/WEB-INF/spring  
webapp/WEB-INF/web.xml  


이외에도 본인이 따로 만들어뒀거나 서로 공유되면 설정이 바껴서 골치아픈 파일들은 gitignore에 추가해주기 바람!
