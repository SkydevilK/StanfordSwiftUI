# Model-View-ViewModel
    - "코드 구성" 아키텍처 설계 패러다임.
    SwiftUI가 작동하려면 MVVM을 따라야한다.
    UIKit(구식 iOS)에서 사용하는 MVC(Model View Controller)와 다르다.

![MVVM_description](./Image/MVVM_description.png)



![Model_View](./Image/Model_View.png)

## Model

- 모델은 UI 독립적이다.
    - 모델은 SwiftUI를 사용하지 않는다. (UIKit도)

- 모델은 데이터와 로직을 캡슐화 한다.
    - 앱이 수행하는 작업에 대한 데이터와 로직을 캡슐화함
    - 카드매칭 게임을 예로들면 카드 모델은 데이터이며 또한 로직이기도 하다
        - 카드를 선택하면?
        - 카드를 어떻게 매칭하는가?
        - 카드를 매칭했을때 포인트를 얼마나 획득하는가?
        - 미스매치일 경우 어떻게 되는가?
        - 모든 로직과 카드 데이터는 모델단에 속한다.
    - 모델은 진실되다.
        - 모든 데이터와 로직에 진실되어야 한다.
        - 우리는 데이터를 모델이 아닌 다른곳에 저장하지 않는다.

## View

- 뷰는 모델을 반영한다.
    - 데이터는 항상 모델에서 뷰로 향한다.
    - 우리는 항상 뷰가 모델처럼 보이기를 원한다.
    - 뷰는 모델의 데이터를 기반하여 구성된다.

- 뷰는 Stateless하다.
    - 상태(State)는 모델에 속하기 때문
    - 뷰는 별도의 상태를 가질 필요가 없다.
    - 뷰는 모델의 상태를 그대로 반영해 Display하는 것

- 뷰는 선언적(Declaritive)이다.
    - 뷰가 이렇게 보여야 한다는 선언만 해놓음
    - 뷰를 어떻게 바꿀지는 모델에서 결정
    - 선언형 vs 명령형

- 뷰는 반응형(Reactive)이다.
    - 모델이 변하면 뷰도 자동으로 변한다.

- MVVM은 MVC와 달리 ViewController를 View로 취급한다.
- 모든 UI 로직이 ViewModel에 있으므로 View/ViewController가 가벼워진다.(MVC에서보다)

![ViewModel](./Image/ViewModel.png)

## ViewModel

- 뷰모델은 뷰와 모델을 서로 바인딩한다.
    - 모델이 변화하면 뷰가 반영할 수 있도록 한다.
    
- 뷰모델은 인터프리터이다.
    - 뷰를 위해 모델을 Interpreting한다.
    - 뷰를 선언적으로 매우 심플하게 사용하기를 원한다.
    - 모델은 복잡한 비즈니스 로직을 포함하고 있다. (HTTP통신, DB 쓰기/읽어오기 등등)
    - 뷰 모델이 모델을 간소화, 추상화 하여 필요한 데이터만 뷰에게 전달할 수 있도록 한다.
    - 따라서 간결한 뷰 코드를 작성할 수 있다.


![MVVM_Structure](./Image/MVVM_Structure.png)

## 모델 > 뷰모델 > 뷰

### Notices Changes

- 뷰모델은 모델의 변화를 알아내고자 노력해야한다.

- 모델이 Struct타입이라면 쉽다.
    - Struct 타입의 훌륭한 feature 중 하나는 Struct가 변하면 Swift가 알 수 있다는 것이다.
    - 참고: Structs and mutation in Swift

### Interpret Data

- 모델 데이터의 변화를 감지했다면 뷰모델은 데이터를 Interpret할 수도 있다.

- 다른 Format으로 변화, 뷰에게 전달하기 쉽도록

### Publishes Something Changed

- 무언가 변경되었다는 것을 알린다(Publish)

- 뷰를 특정하여 데이터를 전달하는 것이 아닌 뷰모델의 Subscriber들이 알 수 있도록 알려주기만 함

- 뷰모델은 뷰와 다이렉트로 대화하지 않는다.

- 뷰모델을 구독하고 있는 뷰는 알림을 받으면 뷰모델에게 현재 상태를 물어보고 상태에 따라 뷰를 다시 그린다.
