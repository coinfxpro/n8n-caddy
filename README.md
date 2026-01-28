# n8n on Railway

Bu repo, [n8n](https://n8n.io)'i Railway üzerinde çalıştırmak için yapılandırılmıştır.

## Kurulum Adımları

1.  Bu repoyu GitHub hesabınıza fork'layın veya kopyalayın (şu an bunu yaptınız).
2.  [Railway.app](https://railway.app) hesabınıza gidin.
3.  "New Project" -> "Deploy from GitHub repo" diyerek bu repoyu seçin.
4.  Railway otomatik olarak `Dockerfile`'ı algılayıp build işlemine başlayacaktır.

## Değişkenler (Variables)

Railway'de projenizin "Variables" sekmesine gidip aşağıdaki ortam değişkenlerini eklemeniz önerilir:

- `N8N_ENCRYPTION_KEY`: Rastgele uzun bir string (şifrelerinizi şifrelemek için kullanılır). **Bunu asla kaybetmeyin!**
- `N8N_HOST`: Railway'in size verdiği domain (örneğin: `web-production-xxxx.up.railway.app`).
- `N8N_PORT`: `5678`
- `N8N_PROTOCOL`: `https`
- `WEBHOOK_URL`: `https://<SİZİN_RAILWAY_URL'İNİZ>/` (Sonunda slash olmasına dikkat edin bazen gerekebilir, genellikle n8n bunu otomatik de algılayabilir ama set etmek iyidir).

## Kalıcılık (Persistence)

n8n verilerinizin (workflowlar, kullanıcılar) silinmemesi için Railway'de bir "Volume" eklemeniz gerekir.
Railway projenizde servisinize tıklayın -> "Volumes" -> "Add Volume" diyerek `/home/node/.n8n` yoluna bir volume bağlayın.

## Workflow Önerisi

Borsa takibi ve video promptu oluşturmak için n8n içinde şu node'ları kullanacağız:
1.  **Schedule Trigger**: Saat başı çalışması için.
2.  **HTTP Request**: Borsa verilerini çekmek için (TradingView veya benzeri bir API).
3.  **OpenAI (ChatGPT)**: Gelen veriyi yorumlayıp video promptu yazması için.
4.  **Telegram**: Promptu size göndermesi için.
