import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  @State messages: string = 'Hello World';

  // build() {
  //   RelativeContainer() {
  //     Text(this.messages)
  //       .id('HelloWorld')
  //       .fontSize(50)
  //       .fontWeight(FontWeight.Bold)
  //       .alignRules({
  //         center: { anchor: '__container__', align: VerticalAlign.Center },
  //         middle: { anchor: '__container__', align: HorizontalAlign.Center }
  //       })
  //   }
  //   .height('100%')
  //   .width('100%')
  // }

  build() {
    Row(){
      Column(){
        Text(this.messages).fontSize(50).fontWeight(FontWeight.Bold)
        Button(){
          Text('Next')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top:20
        })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
        .onClick(()=>{
          console.info('Succeeded in clicking the Next Button')
          router.pushUrl({url:'pages/Second'}).then(()=>{
            console.info('Succeeded in jumping to the Second page')
          }).catch((err:BusinessError)=>{
            console.error('Failed to jump to the second page. Code is ${err.code}, message is ${err.message}')
          })
        })
      }.width('100%')
    }.height('100%')
  }
}