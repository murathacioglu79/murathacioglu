// Tam ERC 20 Token standardı için soyut sözleşme
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
pragma sağlamlığı ^ 0 . 4 . 21 ;


sözleşme EIP20Interface {
    / * Bu, ERC20 temel standardında küçük bir değişikliktir.
    function totalSupply () sabit döndürür (uint256 arz);
    şununla değiştirilir:
    uint256 public totalSupply;
    Bu otomatik olarak totalSupply için bir alıcı işlevi oluşturur.
    Bu temel sözleşmeye taşınır çünkü genel alıcı işlevleri
    şu anda eşleşen özetin bir uygulaması olarak kabul edilmektedir
    derleyici tarafından işlev.
    * /
    /// toplam jeton miktarı
    uint256  public totalSupply;

    /// @param _owner Bakiyenin alınacağı adres
    /// @return Bakiye
    function balanceOf ( adres  _sahibi ) genel  görünüm  dönüşleri ( uint256  bakiyesi );

    /// @notice "_value" belirtecini "msg.sender" dan "_to" ya gönder
    /// @param _to Alıcının adresi
    /// @param _value Aktarılacak jeton miktarı
    /// @return Transferin başarılı olup olmadığı
    işlev aktarımı ( adres  _to , uint256  _value ) genel  dönüşler ( bool  başarısı );

    /// @notice, "_from" tarafından onaylanması koşuluyla "_from" dan "_to" ya "_değer" jetonunu gönder
    /// @param _from Gönderenin adresi
    /// @param _to Alıcının adresi
    /// @param _value Aktarılacak jeton miktarı
    /// @return Transferin başarılı olup olmadığı
    function transferFrom ( address  _from , address  _to , uint256  _value ) genel  dönüşler ( bool  başarısı );

    /// @notice "msg.sender", "_spender" in "_value" belirteçlerini harcamasını onaylar
    /// @param _spender Jetonları aktarabilen hesabın adresi
    /// @param _value Aktarım için onaylanacak jeton miktarı
    /// @return Onayın başarılı olup olmadığı
    function onaylama ( adres  _spender , uint256  _value ) genel  dönüşler ( bool  başarısı );

    /// @param _owner Jetonlara sahip hesabın adresi
    /// @param _spender Jetonları aktarabilen hesabın adresi
    /// @return Harcanmasına izin verilen kalan jeton miktarı
    fonksiyon izni ( adres  _sahibi , adres  _spender ) genel  görünüm  döndürür ( kalan uint256  );

    // solhint-disable-next-line no-simple-event-func-name
    Olay Transferi ( adres  endeksli  _from , adres  endeksli  _to , uint256  _value );
    olay Onayı ( adres  endeksli  _sahip , adres  endeksli  _spender , uint256  _value );
}
© 2021 GitHub, Inc.
