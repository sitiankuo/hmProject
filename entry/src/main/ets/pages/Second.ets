import { BusinessError } from '@kit.BasicServicesKit';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct Second {
  @State message: string = 'Hi there';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('LastHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      Button(){
        Text('Back')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .type(ButtonType.Capsule)
      .margin({
        top:20
      })
      .backgroundColor('#0D9FFB')
      .width('40%')
      .height('5%').onClick(()=>{
        console.info(`Succeeded in clicking the 'Back' button.`)
        try {
          router.back()
        }catch (err){
          let code =(err as BusinessError).code;
          let message =(err as BusinessError).message;
          console.error(`Failed to return to the first page. Code is ${code}, message is ${message}`)
        }
      })
    }
    .height('100%')
    .width('100%')
  }
}