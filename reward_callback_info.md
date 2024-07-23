# Adiscope에서 Reward Callback 수신하기

* 응답받을 Server는 [Adiscope Server Callback API](#adiscope-server-callback-api) 의 규격에 맞추어 생성합니다.
* 응답받을 Server의 URL은 Adiscope Admin Page에 **Callback을 등록합니다**. 외부 사용자는 Adiscope 담당자를 통해서 등록 해 주세요. (Admin에 등록되는 Server Callback의 형태는 *Adiscope Server Callback API* 문서의 Example를 참조해 주세요.)

<br/>

## Adiscope Server Callback API

| Methods      | GET                                                         |
|--------------|-------------------------------------------------------------|
| Content-Type | -                                                           |
| Accept       | -                                                           |
| URL Format   | http<span>s://m</span>y-server.com/anypath?{URL_PARAMETERS} |

* URL_PARAMETERS는 이하 [Adiscope Server Parameters](#adiscope-server-parameters) 를 참조합니다.
* Example
    * Placeholder의 값은 고정되어 있습니다. 이하 응답값에 대한 Key(userID, unit 등...)은 자유로운 포맷으로 사용할 수 있습니다.
    * http<span>s://</span>my-server.com/anypath/transctionID=[TRANSCTION_ID]&signature=[SIGNATURE]&unitID=[UNIT_ID]&userID=[USER_ID]&adid=[ADID]&unit=[REWARD_UNIT]&amount=[AMOUNT]

<br/><br/>

## Adiscope Server Parameters

| Name         | Placeholder   | Description                      |
|--------------|---------------|----------------------------------|
| transctionId | TRANSCTION_ID | 고유한 ID값. 중복호출 여부에 사용 할 수 있다.     |
| signature    | SIGNATURE     | Callback 유효성 검증에 사용되는 MD5 HASH 값 |
| unitId       | UNIT_ID       | 참여한 광고 UnitID                    |
| userId       | USER_ID       | Client에서 setUserID로 설정한 UserID   |
| adid         | ADID          | 광고 추적 ID(iOS: IDFA)              |
| currency     | REWARD_UNIT   | 보상 화폐 단위                         |
| amount       | REWARD_AMOUNT | 보상 지급 수량                         |

* signature의 검증은 Adiscope Admin Page에서 발급받은 **secretKey**와 Callback의 parameters을 통해 값을 검증하게 됩니다. 외부 사용자는 secretKey를 발급받기 위해서는 Adiscope 담당자를 통해서 발급받아 사용합니다.

<br/><br/>


## 재시도 정책
Adiscope 내 재시도 시간의 간격은 다음과 같습니다.
- 10초후에 재시도
- 1분후에 재시도
- 10분에 재시도
- 30분후에 재시도
- 1시간후에 재시도
- 6시간후에 재시도
- 6시간후에 재시도
- 12시간후에 재시도
- 12시간후에 재시도
- 12시간후에 재시도
- 재시도 하지 않는다.

<br/><br/>

## Sample Codes
```js
var express = require('express');
var crypto = require('crypto')
var secret = "YOUR_SECRET_KEY";

app.listen(process.env.PORT || 3412);

app.get('/', function (req, res) {
    var userId = req.query.userId;
    var rewardUnit = req.query.rewardUnit;
    var rewardAmount = req.query.rewardAmount;
    var transactionId = req.query.transactionId;
    var signature = req.query.signature;
    var plainText = makePlainText(userId, rewardUnit, rewardAmount, transactionId);
    var hmac = getHMAC(plainText, secret);

    console.log(hmac);
    console.log(signature);

    // Signatures checking
    if (hmac === signature) {
        // Check for duplicated transaction id here (whether player already has received the reward)
        if (!isDuplicatedReward(transactionId)) {  
            // If there's no duplicate - give virtual goods to player
            // and store the transaction id for duplicate checking.
            giveReward(transactionId);

            // On success, return 200 and include 'OK' in the HTTP body
            res.status(200).send('OK');
        } else {       
            // reward already received by user
            res.status(200).send('DUPLICATED');
        }
    } else {
        // signature error
        res.status(200).send('SIGNATURE_ERROR');
    }
});

function getHMAC(plainText, secret) {
    return crypto.createHmac('md5', secret).update(plainText).digest('hex');
}

function makePlainText(userId, rewardUnit, rewardAmount, transactionId) {
    return userId.concat(rewardUnit, rewardAmount, transactionId);
}

function isDuplicatedReward(transactionId) {
    // check transaction id is duplicated or not  
    return false;
}

function giveReward(transactionId) {
    // give reward to user
    // store transaction id for future checking
}
```
