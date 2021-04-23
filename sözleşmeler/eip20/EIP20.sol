/ *
EIP20 belirteç standardını uygular: https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
. * /


pragma sağlamlığı ^ 0 . 4 . 21 ;

import  "./EIP20Interface.sol" ;


Sözleşme EIP20 olduğunu EIP20Interface {

    uint256 sabit  özel MAX_UINT256 =  2 ** 256  -  1 ;
    eşleme ( adres => uint256 ) kamu bakiyeleri;
    eşleme ( adres => eşleme (adres => uint256) ) herkese açık izinli;
    / *
    NOT:
    Aşağıdaki değişkenler İSTEĞE BAĞLI kibritlerdir. Bunları dahil etmek zorunda değilsiniz.
    Kişinin token sözleşmesini özelleştirmesine izin verir ve hiçbir şekilde temel işlevselliği etkilemez.
    Bazı cüzdanlar / arayüzler bu bilgilere bakma zahmetine bile girmeyebilir.
    * /
    dize  genel adı;                   // süslü ad: örneğin Simon Bucks
    uint8  genel ondalık;                // Kaç tane ondalık gösterilecek.
    dize  genel sembolü;                 // Bir tanımlayıcı: ör. SBX

    işlev EIP20 (
        uint256  _initialAmount ,
        string  _tokenName ,
        uint8  _decimalUnits ,
        string _tokenSymbol
    ) public {
        bakiyeler [ msg . gönderen ] = _initialAmount;               // İçerik oluşturucuya tüm başlangıç ​​jetonlarını verin
        totalSupply = _initialAmount;                        // Toplam tedariki güncelle
        name = _tokenName;                                   // Adı görüntüleme amaçları için ayarlayın
        ondalık = _decimalUnits;                            // Görüntüleme amaçlı ondalık sayı miktarı
        sembol = _tokenSymbol;                               // Sembolü görüntüleme amaçları için ayarlayın
    }

    işlev aktarımı ( adres  _to , uint256  _value ) genel  dönüşler ( bool  başarısı ) {
        gerektirir (bakiyeler [ Msg . gönderen ] > = _value);
        bakiyeler [ msg . gönderen ] - = _value;
        bakiyeler [_to] + = _value;
        yayarlar  Transferi ( Msg . gönderen , _to, _value); // solhint-disable-line girintisi, no-unused-vars
        return  true ;
    }

    function transferFrom ( address  _from , address  _to , uint256  _value ) genel  dönüşler ( bool  başarısı ) {
        uint256 ödeneği = izin verilen [_from] [ msg . gönderen ];
        gerektirir (bakiyeler [_from] > = _ değer && ödenek > = _ değer);
        bakiyeler [_to] + = _value;
        bakiyeler [_from] - = _value;
        eğer (ödenek < MAX_UINT256) {
            izin verilen [_fidan] [ msg . gönderen ] - = _value;
        }
        emit  Transfer (_from, _tan, _değer); // solhint-disable-line girintisi, no-unused-vars
        return  true ;
    }

    function balanceOf ( address  _owner ) genel  görünüm  getirileri ( uint256  bakiyesi ) {
        getiri bakiyeleri [_sahibi];
    }

    function onaylama ( address  _spender , uint256  _value ) genel  dönüşler ( bool  başarısı ) {
        izin verildi [ msg . gönderen ] [_ harcayan ] = _value;
        yayarlar  etmiş ( Msg . gönderen , _spender, _value); // solhint-disable-line girintisi, no-unused-vars
        return  true ;
    }

    function allowance ( address  _owner , address  _spender ) public  view  dönüşleri ( uint256  kaldı ) {
        iade izin verildi [_sahip] [_ harcayan];
    }
}
