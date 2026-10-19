# 🚀 MANUAL DE INSTALAÇÃO E LANÇAMENTO: CONCURSOS PRO

Este documento é o guia definitivo para colocar a plataforma de concursos no ar. Siga a sequência exata para evitar erros.

---

## 🛠️ FASE 1: O Cérebro (Banco de Dados - Supabase)
A plataforma usa o **Supabase** (PostgreSQL) para armazenar questões e usuários.

1. **Crie a conta:** Acesse [supabase.com](https://supabase.com) e crie um projeto gratuito.
2. **Execute o Setup:**
   - Vá em **SQL Editor** $\rightarrow$ **New Query**.
   - Execute os arquivos nesta ordem:
     1. `database_setup.sql` (Cria as tabelas)
     2. `simulados_raciocinio_logico.sql` (Adiciona questões de lógica)
     3. `simulados_portugues.sql` (Adiciona questões de português)
     4. `simulados_direito_policial.sql` (Adiciona questões de Direito)
     5. `simulados_informatica.sql` (Adiciona questões de informática)
3. **Pegue as Chaves:** 
   - Vá em **Settings** $\rightarrow$ **API**.
   - Copie a `Project URL` e a `anon public` key. Você precisará delas na Fase 3.

---

## 💻 FASE 2: O Corpo (Código Frontend)
O site foi construído com **Next.js, TypeScript e Tailwind CSS**.

1. **Repositório:** Crie um repositório no [GitHub](https://github.com) chamado `concursos-pro`.
2. **Arquivos:** Suba todos os arquivos gerados neste chat para o repositório:
   - `/src/types.ts`
   - `/src/services/api_service.ts`
   - `/src/app/simulator/page.tsx` (PremiumSimulator)
   - `/src/app/dashboard/page.tsx` (UserDashboard)
   - `/src/app/page.tsx` (LandingPage)
   - `vercel.json` (Configuração de rotas)

---

## ⚡ FASE 3: A Publicação (Vercel)
A Vercel hospeda o site e o torna acessível via link.

1. **Conexão:** Acesse [vercel.com](https://vercel.com), faça login com GitHub e clique em **"Add New Project"**.
2. **Importação:** Selecione o repositório `concursos-pro`.
3. **Variáveis de Ambiente (CRUCIAL):**
   - Antes de clicar em Deploy, procure **Environment Variables**.
   - Adicione: `NEXT_PUBLIC_SUPABASE_URL` $\rightarrow$ (Cole a URL do Supabase).
   - Adicione: `NEXT_PUBLIC_SUPABASE_ANON_KEY` $\rightarrow$ (Cole a Anon Key do Supabase).
4. **Deploy:** Clique em **Deploy**.

---

## 💰 FASE 4: Monetização e Crescimento (Marketing)
Agora que o site está no ar, siga a estratégia de crescimento:

1. **Isca Digital:** Divulgue o "Simulado de Diagnóstico Gratuito".
2. **Conteúdo Viral:** Use os 5 roteiros de Reels/TikTok fornecidos para atrair alunos.
3. **Funil de Vendas:** 
   - Anúncio/Vídeo $\rightarrow$ Landing Page $\rightarrow$ Simulado Grátis $\rightarrow$ Plano Premium.
4. **Preços Sugeridos:**
   - **Plano Mensal:** R$ 29,90 (Acesso total).
   - **Plano Anual:** R$ 197,00 (Melhor custo-benefício).

---

## ✅ CHECKLIST FINAL DE VERIFICAÇÃO
- [ ] O link da Vercel abre?
- [ ] As questões do Supabase carregam no simulador?
- [ ] O cronômetro funciona e finaliza a prova?
- [ ] O Dashboard mostra as porcentagens de acerto?
- [ ] A Landing Page convence o aluno a se cadastrar?

**PARABÉNS! VOCÊ AGORA É DONO DE UMA PLATAFORMA DE EDUCAÇÃO PROFISSIONAL.** 🏆
