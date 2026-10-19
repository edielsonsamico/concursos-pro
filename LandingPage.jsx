import React from 'react';

export default function LandingPage() {
  return (
    <div className="min-h-screen bg-white text-slate-900 font-sans">
      {/* NAV */}
      <nav className="flex justify-between items-center px-6 py-4 max-w-7xl mx-auto">
        <div className="text-2xl font-black text-blue-600">CONCURSOS<span className="text-slate-900">PRO</span></div>
        <div className="hidden md:flex gap-8 font-medium text-slate-600">
          <a href="#beneficios" className="hover:text-blue-600 transition">Benefícios</a>
          <a href="#como-funciona" className="hover:text-blue-600 transition">Como Funciona</a>
          <a href="#precos" className="hover:text-blue-600 transition">Preços</a>
        </div>
        <button className="bg-blue-600 text-white px-6 py-2 rounded-full font-bold hover:bg-blue-700 transition">
          Começar Agora
        </button>
      </nav>

      {/* HERO SECTION */}
      <section className="px-6 py-20 max-w-7xl mx-auto text-center">
        <div className="inline-block px-4 py-1.5 mb-6 text-sm font-bold tracking-wide text-blue-600 uppercase bg-blue-100 rounded-full">
          🚀 A evolução do estudo para concursos
        </div>
        <h1 className="text-5xl md:text-7xl font-black mb-8 leading-tight">
          Pare de estudar errado. <br />
          <span className="text-blue-600">Passe na sua prova.</span>
        </h1>
        <p className="text-xl text-slate-600 mb-10 max-w-2xl mx-auto leading-relaxed">
          A única plataforma que utiliza ciência de dados e gamificação para identificar seus pontos fracos e acelerar sua aprovação.
        </p>
        <div className="flex flex-col sm:flex-row justify-center gap-4">
          <button className="bg-blue-600 text-white px-10 py-4 rounded-2xl font-bold text-lg hover:bg-blue-700 transition shadow-xl shadow-blue-200">
            Criar minha conta gratuita
          </button>
          <button className="bg-white border border-slate-200 px-10 py-4 rounded-2xl font-bold text-lg hover:bg-slate-50 transition">
            Ver demonstração
          </button>
        </div>
        <div className="mt-16 relative">
            <div className="absolute -inset-1 bg-gradient-to-r from-blue-600 to-purple-600 rounded-3xl blur opacity-20"></div>
            <img src="https://via.placeholder.com/1200x600" alt="Dashboard Preview" className="relative rounded-3xl shadow-2xl border border-slate-200" />
        </div>
      </section>

      {/* BENEFÍCIOS */}
      <section id="beneficios" className="py-24 bg-slate-50 px-6">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-bold mb-4">Por que o Concursos Pro?</h2>
            <p className="text-slate-600">Tudo o que você precisa para sair da teoria e ir para a posse.</p>
          </div>
          <div className="grid md:grid-cols-3 gap-8">
            <div className="bg-white p-8 rounded-3xl border border-slate-200 hover:shadow-xl transition">
              <div className="text-4xl mb-4">🎯</div>
              <h3 className="text-xl font-bold mb-3">Simulados Reais</h3>
              <p className="text-slate-600">Interface idêntica à prova, com cronômetro e pressão real para você não ter surpresas no dia.</p>
            </div>
            <div className="bg-white p-8 rounded-3xl border border-slate-200 hover:shadow-xl transition">
              <div className="text-4xl mb-4">📊</div>
              <h3 className="text-xl font-bold mb-3">Analytics de Erros</h3>
              <p className="text-slate-600">Não perca tempo estudando o que já sabe. Foque exatamente nas matérias onde seu desempenho está baixo.</p>
            </div>
            <div className="bg-white p-8 rounded-3xl border border-slate-200 hover:shadow-xl transition">
              <div className="text-4xl mb-4">🔥</div>
              <h3 className="text-xl font-bold mb-3">Gamificação</h3>
              <p className="text-slate-600">Sistema de XP e Streaks que transforma o estudo cansativo em um hábito viciante e prazeroso.</p>
            </div>
          </div>
        </div>
      </section>

      {/* PROVA SOCIAL / NUMEROS */}
      <section className="py-20 bg-blue-600 text-white px-6 text-center">
        <div className="max-w-7xl mx-auto grid grid-cols-2 md:grid-cols-4 gap-8">
          <div>
            <div className="text-4xl font-black mb-2">50k+</div>
            <div className="text-blue-100 text-sm">Alunos Ativos</div>
          </div>
          <div>
            <div className="text-4xl font-black mb-2">1M+</div>
            <div className="text-blue-100 text-sm">Questões Resolvidas</div>
          </div>
          <div>
            <div className="text-4xl font-black mb-2">12k+</div>
            <div className="text-blue-100 text-sm">Aprovações</div>
          </div>
          <div>
            <div className="text-4xl font-black mb-2">4.9/5</div>
            <div className="text-blue-100 text-sm">Avaliação Média</div>
          </div>
        </div>
      </section>

      {/* CTA FINAL */}
      <section className="py-24 px-6 text-center max-w-4xl mx-auto">
        <h2 className="text-4xl md:text-6xl font-black mb-8 leading-tight">
          Pronto para conquistar sua <span className="text-blue-600">estabilidade financeira?</span>
        </h2>
        <p className="text-xl text-slate-600 mb-10">
          Junte-se a milhares de alunos que trocaram a ansiedade pela confiança.
        </p>
        <button className="bg-blue-600 text-white px-12 py-5 rounded-2xl font-bold text-xl hover:bg-blue-700 transition shadow-2xl shadow-blue-200">
          Quero ser aprovado agora!
        </button>
        <p className="mt-6 text-slate-400 text-sm">7 dias de teste grátis. Sem compromisso.</p>
      </section>

      <footer className="py-12 border-t border-slate-100 text-center text-slate-500 text-sm">
        &copy; 2026 Concursos Pro. Todos os direitos reservados.
      </footer>
    </div>
  );
}
