import React from 'react';

const PERFORMANCE_DATA = [
  { subject: 'Direito Administrativo', correct: 15, total: 20, color: 'bg-blue-500' },
  { subject: 'Língua Portuguesa', correct: 10, total: 15, color: 'bg-green-500' },
  { subject: 'Raciocínio Lógico', correct: 5, total: 12, color: 'bg-red-500' },
  { subject: 'Direito Constitucional', correct: 18, total: 20, color: 'bg-purple-500' },
];

export default function UserDashboard() {
  return (
    <div className="min-h-screen bg-slate-50 p-6 md:p-12">
      <div className="max-w-6xl mx-auto">
        <header className="mb-12">
          <h1 className="text-4xl font-black text-slate-900">Meu Desempenho 📈</h1>
          <p className="text-slate-500 mt-2">Acompanhe sua evolução e foque onde você mais precisa.</p>
        </header>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8 mb-12">
          {/* KPI Cards */}
          <div className="bg-white p-6 rounded-3xl border border-slate-200 shadow-sm">
            <div className="text-slate-500 text-sm font-medium">Total de Questões</div>
            <div className="text-3xl font-bold text-slate-900">1,240</div>
            <div className="text-green-500 text-xs mt-2 font-bold">↑ 12% desde ontem</div>
          </div>
          <div className="bg-white p-6 rounded-3xl border border-slate-200 shadow-sm">
            <div className="text-slate-500 text-sm font-medium">Taxa de Acerto Global</div>
            <div className="text-3xl font-bold text-slate-900">74.2%</div>
            <div className="text-blue-500 text-xs mt-2 font-bold">Média: 68% dos alunos</div>
          </div>
          <div className="bg-white p-6 rounded-3xl border border-slate-200 shadow-sm">
            <div className="text-slate-500 text-sm font-medium">Tempo Médio/Questão</div>
            <div className="text-3xl font-bold text-slate-900">1m 42s</div>
            <div className="text-slate-400 text-xs mt-2">Meta: 1m 20s</div>
          </div>
        </div>

        <h2 className="text-2xl font-bold mb-6 text-slate-800">Desempenho por Disciplina</h2>
        <div className="grid gap-6">
          {PERFORMANCE_DATA.map((item) => (
            <div key={item.subject} className="bg-white p-6 rounded-3xl border border-slate-200 shadow-sm">
              <div className="flex justify-between items-center mb-4">
                <span className="font-bold text-slate-700">{item.subject}</span>
                <span className="text-sm font-medium text-slate-500">
                  {item.correct} / {item.total} ({((item.correct/item.total)*100).toFixed(1)}%)
                </span>
              </div>
              <div className="w-full bg-slate-100 h-4 rounded-full overflow-hidden">
                <div
                  className={`h-full ${item.color} transition-all duration-1000`}
                  style={{ width: `${(item.correct/item.total)*100}%` }}
                ></div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
