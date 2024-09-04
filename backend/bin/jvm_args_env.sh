-Xms1g
-Xmx1g
-Xmn512m

-XX:+IgnoreUnrecognizedVMOptions
-XX:+PrintGCDateStamps
-XX:+PrintGCDetails
-Xloggc:gc.log

-XX:-OmitStackTraceInFastThrow
-XX:+ExitOnOutOfMemoryError
-XX:+HeapDumpOnOutOfMemoryError
-XX:HeapDumpPath=dump.hprof

#-Duser.timezone=${SPRING_JACKSON_TIME_ZONE}