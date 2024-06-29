# SwitUIStudy
SwiftUI Study 

## Combine 에서 subject 종류에 대해서 

1. PassthroughSubject

PassthroughSubject는 이벤트를 통과시키는 가장 기본적인 Subject입니다. 초기값이 없으며, 이벤트를 받아 그대로 구독자에게 전달합니다.

특징

    •    초기값이 없음
    •    이벤트를 받으면 즉시 구독자에게 전달
    •    주로 외부 이벤트를 처리할 때 사용

```Swift
let subject = PassthroughSubject<String, Never>()
subject.send("Hello, World!")
```

2. CurrentValueSubject

CurrentValueSubject는 항상 하나의 현재 값을 가지고 있으며, 새로운 구독자가 구독할 때 이 현재 값을 즉시 전달합니다. 이후에 발생하는 이벤트도 구독자에게 전달됩니다.

특징

    •    초기값이 필요함
    •    항상 최신 값을 유지
    •    구독자가 구독할 때 현재 값을 즉시 전달

```Swift
let subject = CurrentValueSubject<String, Never>("Initial Value")
subject.send("Updated Value")
```

3. ReplaySubject (iOS 16 이후)

ReplaySubject는 지정된 버퍼 크기만큼의 최신 이벤트를 저장하고, 새로운 구독자가 구독할 때 이 저장된 이벤트들을 모두 전달합니다. 이후에 발생하는 이벤트도 구독자에게 전달됩니다.

특징

    •    버퍼 크기만큼의 이벤트를 저장
    •    새로운 구독자에게 저장된 이벤트 모두 전달
    •    이후 발생하는 이벤트도 구독자에게 전달
    

```Swift
let subject = ReplaySubject<String, Never>(bufferSize: 2)
subject.send("First Value")
subject.send("Second Value")
```

Never: Subject가 실패하지 않음을 의미
커스텀 에러는 : Subject가 특정 에러를 방출 할수 있도로 정의

