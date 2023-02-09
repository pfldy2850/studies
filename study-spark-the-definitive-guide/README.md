# spark-the-definitive-guide

[개인 스터디] 스파크 완벽 가이드 공부

### 도커 이미지 빌드하기

```cmd
$ docker build . --tag stdg-spark:latest
```

### 도커 이미지 실행하기

비밀번호: `stdg1234`

```cmd
# windows
$ docker run -d --rm ^
    -p 8888:8888 -p 4040:4040 ^
    -v D:\Dev\spark-the-definitive-guide\jupyterlab:/home/jovyan ^
    -v D:\Dev\spark-the-definitive-guide\data:/data ^
    --name stdg-spark ^
    stdg-spark:latest ^
    start-notebook.sh --NotebookApp.password='argon2:$argon2id$v=19$m=10240,t=10,p=8$3tOM7HJK1FJkWdNMUEg8AA$RiUIo1/+5d8WgFDyRKZACJX8Gne6ASVINIM175e0lZs'

# mac
$ docker run -d --rm \
    -p 8888:8888 -p 4040:4040 \
    -v $(pwd)/jupyterlab:/home/jovyan \
    -v $(pwd)/data:/data \
    --name stdg-spark \
    stdg-spark:latest \
    start-notebook.sh --NotebookApp.password='argon2:$argon2id$v=19$m=10240,t=10,p=8$3tOM7HJK1FJkWdNMUEg8AA$RiUIo1/+5d8WgFDyRKZACJX8Gne6ASVINIM175e0lZs'
```

## 관련 블로그글

- Chapter 1. 빅데이터와 스파크 간단히 살펴보기 ([링크](https://dytis.tistory.com/41))
- Chapter 2. 구조적 API: DataFrame, SQL, Dataset ([링크](https://dytis.tistory.com/42))
