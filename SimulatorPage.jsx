import React, { useState, useEffect } from 'react';

// Mock de Dados para funcionamento imediato
const MOCK_QUESTIONS = [
  {
    id: 'q1',
    statement: 'De acordo com a Constituição Federal, a administração pública direta e indireta obedecerá aos seguintes princípios, EXCETO:',
    options: [
      { id: 'a', text: 'Legalidade', isCorrect: false },
      { id: 'b', text: 'Impessoalidade', isCorrect: false },
      { id: 'c', text: 'Subjetividade', isCorrect: true },
      { id: 'd', text: 'Moralidade', isCorrect: false },
    ],
    explanation: 'Os princípios expressos no caput do art. 37 da CF são: Legalidade, Impessoalidade, Moralidade, Publicidade e Eficiência (LIMPE).'
  },
  {
    id: 'q2',
    statement: 'Qual a principal característica de um ato administrativo vinculado?',
    options: [
      { id: 'a', text: 'O administrador tem liberdade de escolha.', isCorrect: false },
      { id: 'b', text: 'A lei estabelece todos os requisitos, sem margem de escolha.', isCorrect: true },
      { id: 'c', text: 'Depende exclusivamente da vontade do agente.', isCorrect: false },
      { id: 'd', text: 'Não precisa de amparo legal.', isCorrect: false },
    ],
    explanation: 'No ato vinculado, a lei não deixa margem de escolha para o administrador.'
  }
];

export default function ConcursoPlatform() {
  const [currentIndex, setCurrentIndex] = useState(0);
  const [answers, setAnswers] = useState({});
  const [timeLeft, setTimeLeft] = useState(3600); // 1 hora
  const [showResult, setShowResult] = useState(false);

  useEffect(() => {
    if (timeLeft <= 0) {
      setShowResult(true);
      return;
    }
    const timer = setInterval(() => setTimeLeft(prev => prev - 1), 1000);
    return () => clearInterval(timer);
  }, [timeLeft]);

  const formatTime = (s) => {
    const m = Math.floor(s / 60);
    const sec = s % 60;
    return `${m}:${sec.toString().padStart(2, '0')}`;
  };

  const handleOptionSelect = (optId) => {
    setAnswers({ ...answers, [currentIndex]: optId });
  };

  const calculateScore = () => {
    let correct = 0;
    MOCK_QUESTIONS.forEach((q, idx) => {
      const selectedId = answers[idx];
      const correctOpt = q.options.find(o => o.isCorrect);
      if (selectedId === correctOpt.id) correct++;
    });
    return correct;
  };

  if (showResult) {
    return (
      <div className="min-h-screen bg-slate-50 flex items-center justify-center p-4">
        <div className="bg-white p-8 rounded-3xl shadow-xl text-center max-w-md w-full border border-slate-200">
          <h1 className="text-3xl font-bold text-slate-800 mb-4">Resultado Final</h1>
          <div className="text-6xl font-black text-blue-600 mb-4">
            {calculateScore()} / {MOCK_QUESTIONS.length}
          </div>
          <p className="text-slate-500 mb-8">Seu desempenho foi de {(calculateScore()/MOCK_QUESTIONS.length*100).toFixed(1)}%</p>
          <button
            onClick={() => window.location.reload()}
            className="w-full py-3 bg-blue-600 text-white rounded-xl font-bold hover:bg-blue-700 transition"
          >
            Tentar Novamente
          </button>
        </div>
      </div>
    );
  }

  const q = MOCK_QUESTIONS[currentIndex];

  return (
    <div className="min-h-screen bg-slate-50 p-4 md:p-8 font-sans text-slate-900">
      {/* HEADER */}
      <div className="max-w-5xl mx-auto flex justify-between items-center mb-8 bg-white p-4 rounded-2xl shadow-sm border border-slate-200">
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 bg-blue-600 rounded-lg flex items-center justify-center text-white font-bold">CP</div>
          <h1 className="font-bold text-lg hidden sm:block">Concursos Pro</h1>
        </div>
        <div className="flex items-center gap-4">
          <div className="bg-red-50 text-red-600 px-4 py-2 rounded-full font-mono font-bold border border-red-100">
            ⏱️ {formatTime(timeLeft)}
          </div>
        </div>
      </div>

      <div className="max-w-5xl mx-auto grid grid-cols-1 lg:grid-cols-3 gap-8">
        {/* QUESTÃO */}
        <div className="lg:col-span-2 space-y-6">
          <div className="bg-white p-6 md:p-10 rounded-3xl shadow-sm border border-slate-200">
            <div className="flex justify-between items-center mb-6">
              <span className="px-3 py-1 bg-blue-100 text-blue-700 rounded-full text-xs font-bold uppercase">
                Questão {currentIndex + 1} de {MOCK_QUESTIONS.length}
              </span>
              <span className="text-slate-400 text-xs">Banca: FGV | 2024</span>
            </div>

            <p className="text-xl font-medium leading-relaxed mb-10 text-slate-800">
              {q.statement}
            </p>

            <div className="grid gap-4">
              {q.options.map((opt) => (
                <button
                  key={opt.id}
                  onClick={() => handleOptionSelect(opt.id)}
                  className={`group w-full text-left p-5 rounded-2xl border-2 transition-all flex items-center gap-4 ${
                    answers[currentIndex] === opt.id
                    ? 'border-blue-500 bg-blue-50 ring-4 ring-blue-100'
                    : 'border-slate-100 hover:border-blue-200 hover:bg-slate-50'
                  }`}
                >
                  <div className={`w-8 h-8 rounded-full border-2 flex items-center justify-center font-bold text-sm transition-colors ${
                    answers[currentIndex] === opt.id ? 'bg-blue-600 border-blue-600 text-white' : 'border-slate-300 text-slate-500 group-hover:border-blue-400'
                  }`}>
                    {opt.id.toUpperCase()}
                  </div>
                  <span className="text-slate-700 font-medium">{opt.text}</span>
                </button>
              ))}
            </div>
          </div>

          <div className="flex justify-between items-center">
            <button
              onClick={() => setCurrentIndex(prev => prev - 1)}
              disabled={currentIndex === 0}
              className="px-6 py-3 bg-white border border-slate-200 rounded-xl font-semibold disabled:opacity-30 hover:bg-slate-50 transition"
            >
              ← Anterior
            </button>
            <button
              onClick={() => setCurrentIndex(prev => prev + 1)}
              disabled={currentIndex === MOCK_QUESTIONS.length - 1}
              className="px-6 py-3 bg-blue-600 text-white rounded-xl font-semibold hover:bg-blue-700 shadow-lg shadow-blue-200 transition"
            >
              Próxima →
            </button>
          </div>
        </div>

        {/* SIDEBAR - MAPA DE PROVA */}
        <div className="space-y-6">
          <div className="bg-white p-6 rounded-3xl shadow-sm border border-slate-200">
            <h3 className="font-bold text-slate-800 mb-4 flex items-center gap-2">
              <span className="w-2 h-2 bg-blue-600 rounded-full"></span>
              Mapa da Prova
            </h3>
            <div className="grid grid-cols-5 gap-3">
              {MOCK_QUESTIONS.map((_, idx) => (
                <button
                  key={idx}
                  onClick={() => setCurrentIndex(idx)}
                  className={`w-10 h-10 rounded-lg text-sm font-bold transition-all ${
                    currentIndex === idx
                    ? 'ring-2 ring-blue-600 ring-offset-2 bg-blue-600 text-white'
                    : answers[idx] ? 'bg-green-500 text-white' : 'bg-slate-100 text-slate-400 hover:bg-slate-200'
                  }`}
                >
                  {idx + 1}
                </button>
              ))}
            </div>
            <button
              onClick={() => setShowResult(true)}
              className="w-full mt-8 py-4 bg-slate-900 text-white rounded-2xl font-bold hover:bg-black transition shadow-xl"
            >
              Finalizar Simulado
            </button>
          </div>

          <div className="bg-blue-600 p-6 rounded-3xl text-white shadow-lg shadow-blue-200">
            <h4 className="font-bold mb-2">Dica do Professor 💡</h4>
            <p className="text-sm text-blue-100 leading-relaxed">
              Sempre leia primeiro a alternativa "Exceto" ou "Incorreta" para não confundir o gabarito!
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}
