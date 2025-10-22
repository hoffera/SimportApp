# Configuração de Push Notifications para iOS

## Problema Resolvido
O erro "APNS token has not been received on the device yet" foi corrigido com as seguintes implementações:

## 1. Configurações no Xcode (IMPORTANTE)

### A. Capabilities
1. Abra o projeto no Xcode
2. Selecione o target "Runner"
3. Vá para a aba "Signing & Capabilities"
4. Clique em "+ Capability" e adicione:
   - **Push Notifications**
   - **Background Modes** (se não estiver presente)

### B. Background Modes
Com o Background Modes adicionado, marque as opções:
- ✅ **Background fetch**
- ✅ **Remote notifications**

### C. Bundle Identifier
Certifique-se de que o Bundle Identifier está correto e corresponde ao configurado no Firebase Console.

## 2. Configurações no Firebase Console

### A. APNS Authentication Key
1. No Firebase Console, vá para Project Settings > Cloud Messaging
2. Na seção "Apple app configuration", faça upload da sua APNS Authentication Key (.p8)
3. Certifique-se de que o Key ID e Team ID estão corretos

### B. App ID
1. Verifique se o App ID no Firebase corresponde ao Bundle Identifier do seu app
2. Para flavors diferentes, certifique-se de que cada flavor tem seu próprio projeto Firebase

## 3. Configurações de Build

### A. Script para Flavors (se usando)
Se você está usando flavors, certifique-se de que o script copia os arquivos corretos:
- `GoogleService-Info.plist` para cada flavor
- Configurações corretas para cada ambiente

### B. Provisioning Profile
1. Certifique-se de que o Provisioning Profile tem Push Notifications habilitado
2. Para desenvolvimento, use um profile de desenvolvimento
3. Para produção, use um profile de distribuição

## 4. Testando

### A. Dispositivo Real
- Push notifications só funcionam em dispositivos reais
- Certifique-se de que o dispositivo está conectado à internet
- Verifique se as notificações estão habilitadas nas configurações do dispositivo

### B. Logs
Monitore os logs para verificar:
- Se o token está sendo obtido corretamente
- Se há erros de configuração
- Se as permissões estão sendo solicitadas

## 5. Troubleshooting

### A. Erro "APNS token not set"
- Verifique se o APNS Authentication Key está configurado corretamente
- Confirme que o Bundle ID está correto
- Certifique-se de que o dispositivo está registrado para notificações

### B. Token sempre null
- Verifique as capabilities no Xcode
- Confirme que o Firebase está configurado corretamente
- Teste em um dispositivo real (não simulador)

### C. Notificações não chegam
- Verifique se o app tem permissão para notificações
- Confirme que o payload da notificação está correto
- Teste com diferentes tipos de notificação (foreground/background)

## 6. Código Implementado

As seguintes correções foram aplicadas:

1. **AppDelegate.swift**: Configuração correta do Firebase e notificações
2. **Info.plist**: Adicionadas configurações necessárias para APNS
3. **NotificationService.dart**: Implementado retry logic e tratamento de erros
4. **Método getTokenSafely()**: Método seguro para obter tokens

## 7. Próximos Passos

1. Execute `flutter clean`
2. Execute `cd ios && pod install`
3. Execute `flutter run` em um dispositivo real
4. Verifique os logs para confirmar que o token está sendo obtido
5. Teste o envio de notificações push

## 8. Verificação Final

Para confirmar que tudo está funcionando:
1. O app deve solicitar permissão para notificações
2. O token deve aparecer nos logs
3. Notificações de teste devem chegar ao dispositivo
4. Não deve haver erros relacionados ao APNS token
