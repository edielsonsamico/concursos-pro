import React, { useState, useEffect } from 'react';

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

export default function PremiumSimulator() {
  const [currentIndex, setCurrentIndex] = useState(0);
  const [answers, setAnswers] = useState({});
  const [timeLeft, setTimeLeft] = useState(3600);
  const [showResult, setShowResult] = useState(false);
  const [focusMode, setFocusMode] = useState(false);
  const [trainingMode, setTrainingMode] = useState(true); // Feedback instantâneo
  const [xp, setXp] = useState(0);
  const [streak, setStreak] = useState(5); // Ex: 5 dias estudando

  useEffect(() => {
    if (timeLeft <= 0) { setShowResult(true); return; }
    const timer = setInterval(() => setTimeLeft(prev => prev - 1), 1000);
    return () => clearInterval(timer);
  }, [timeLeft]);

  const handleOptionSelect = (optId) => {
    if (answers[currentIndex]) return; // Evita mudar resposta no modo treino

    setAnswers({ ...answers, [currentIndex]: optId });

    // Ganho de XP por responder
    setXp(prev => prev + 10);
  };

  const formatTime = (s) => {
    const m = Math.floor(s / 60);
    const sec = s % 60;
    return `${m}:${sec.toString().padStart(2, '0')}`;
  };

  if (showResult) {
    return (
      <div className="min-h-screen bg-slate-900 flex items-center justify-center p-4 text-white">
        <div className="bg-slate-800 p-10 rounded-3xl shadow-2xl text-center max-w-md w-full border border-slate-700">
          <div className="text-6xl mb-4">🏆</div>
          <h1 className="text-3xl font-bold mb-2">Simulado Concluído!</h1>
          <div className="text-5xl font-black text-blue-400 my-6">
            {Object.values(answers).filter((id, idx) =>
                MOCK_QUESTIONS[idx].options.find(o => o.id === id)?.isCorrect
            ).length} / {MOCK_QUESTIONS.length}
          </div>
          <p className="text-slate-400 mb-8">Você ganhou +{MOCK_QUESTIONS.length * 20} XP de experiência!</p>
          <button onClick={() => window.location.reload()} className="w-full py-4 bg-blue-600 rounded-2xl font-bold hover:bg-blue-500 transition">Voltar ao Início</button>
        </div>
      </div>
    );
  }

  const q = MOCK_QUESTIONS[currentIndex];
  const selectedOptionId = answers[currentIndex];
  const isCorrect = MOCK_QUESTIONS[currentIndex].options.find(o => o.id === selectedOptionId)?.isCorrect;

  return (
    <div className={`min-h-screen transition-colors duration-500 ${focusMode ? 'bg-slate-900 text-white' : 'bg-slate-50 text-slate-900'} p-4 md:p-8`}>

      {/* HEADER PREMIUM */}
      {!focusMode && (
        <div className="max-w-6xl mx-auto flex justify-between items-center mb-8 bg-white p-4 rounded-2xl shadow-sm border border-slate-200 text-slate-900">
          <div className="flex items-center gap-4">
            <div className="flex items-center gap-2 bg-orange-100 text-orange-600 px-3 py-1 rounded-full font-bold text-sm">
              🔥 {streak} Dias
            </div>
            <div className="flex items-center gap-2 bg-blue-100 text-blue-600 px-3 py-1 rounded-full font-bold text-sm">
              ⭐ {xp} XP
            </div>
          </div>
          <div className="flex items-center gap-4">
            <button
              onClick={() => setTrainingMode(!trainingMode)}
              className={`text-xs font-bold px-3 py-1 rounded-full transition ${trainingMode ? 'bg-green-100 text-green-600' : 'bg-slate-100 text-slate-500'}`}
            >
              {trainingMode ? 'Modo Treino: ON' : 'Modo Prova: ON'}
            </button>
            <div className="bg-red-50 text-red-600 px-4 py-2 rounded-full font-mono font-bold">
              ⏱️ {formatTime(timeLeft)}
            </div>
          </div>
        </div>
      )}

      <div className={`mx-auto ${focusMode ? 'max-w-3xl' : 'max-w-6xl'} grid grid-cols-1 lg:grid-cols-3 gap-8`}>

        {/* ÁREA DA QUESTÃO */}
        <div className={`lg:col-span-2 space-y-6 ${focusMode ? 'mt-10' : ''}`}>
          <div className={`${focusMode ? 'bg-slate-800 border-slate-700' : 'bg-white border-slate-200'} p-6 md:p-10 rounded-3xl shadow-sm border transition-all`}>
            <div className="flex justify-between items-center mb-6">
              <span className="px-3 py-1 bg-blue-600 text-white rounded-full text-xs font-bold uppercase">
                Questão {currentIndex + 1} / {MOCK_QUESTIONS.length}
              </span>
              <button
                onClick={() => setFocusMode(!focusMode)}
                className="text-xs font-medium opacity-50 hover:opacity-100 transition"
              >
                {focusMode ? 'Sair do Modo Foco' : 'Entrar no Modo Foco 🎯'}
              </button>
            </div>

            <p className={`text-xl md:text-2xl font-medium leading-relaxed mb-10 ${focusMode ? 'text-slate-100' : 'text-slate-800'}`}>
              {q.statement}
            </p>

            <div className="grid gap-4">
              {q.options.map((opt) => {
                const isSelected = selectedOptionId === opt.id;
                const showCorrect = trainingMode && selectedOptionId;

                let btnClass = "border-slate-100 hover:bg-slate-50 text-slate-700";
                if (isSelected) btnClass = "border-blue-500 bg-blue-50 text-blue-700 ring-2 ring-blue-100";
                if (showCorrect && opt.isCorrect) btnClass = "border-green-500 bg-green-50 text-green-700 ring-2 ring-green-100";
                if (showCorrect && isSelected && !opt.isCorrect) btnClass = "border-red-500 bg-red-50 text-red-700 ring-2 ring-red-100";

                return (
                  <button
                    key={opt.id}
                    onClick={() => handleOptionSelect(opt.id)}
                    disabled={trainingMode && selectedOptionId}
                    className={`group w-full text-left p-5 rounded-2xl border-2 transition-all flex items-center gap-4 ${focusMode ? 'bg-slate-700 border-slate-600 text-slate-200' : btnClass}`}
                  >
                    <div className={`w-8 h-8 rounded-full border-2 flex items-center justify-center font-bold text-sm ${
                      isSelected ? 'bg-blue-600 border-blue-600 text-white' : 'border-slate-300'
                    }`}>
                      {opt.id.toUpperCase()}
                    </div>
                    <span className="font-medium">{opt.text}</span>
                  </button>
                );
              })}
            </div>

            {/* EXPLICAÇÃO INSTANTÂNEA (MODO TREINO) */}
            {trainingMode && selectedOptionId && (
              <div className="mt-8 p-6 bg-blue-50 border-l-4 border-blue-500 rounded-r-2xl text-blue-800 animate-in fade-in slide-in-from-bottom-4">
                <h4 className="font-bold mb-2 flex items-center gap-2">💡 Explicação:</h4>
                <p className="text-sm leading-relaxed">{q.explanation}</p>
              </div>
            )}
          </div>

          <div className="flex justify-between items-center">
            <button onClick={() => setCurrentIndex(prev => prev - 1)} disabled={currentIndex === 0} className="px-6 py-3 bg-white border border-slate-200 rounded-xl disabled:opacity-30 font-semibold text-slate-600">← Anterior</button>
            <button onClick={() => setCurrentIndex(prev => prev + 1)} disabled={currentIndex === MOCK_QUESTIONS.length - 1} className="px-6 py-3 bg-blue-600 text-white rounded-xl font-semibold hover:bg-blue-700 shadow-lg transition">Próxima →</button>
          </div>
        </div>

        {/* SIDEBAR GAMIFICADA */}
        {!focusMode && (
          <div className="space-y-6">
            <div className="bg-white p-6 rounded-3xl shadow-sm border border-slate-200">
              <h3 className="font-bold text-slate-800 mb-4">Progresso da Prova</h3>
              <div className="grid grid-cols-5 gap-3">
                {MOCK_QUESTIONS.map((_, idx) => (
                  <button
                    key={idx}
                    onClick={() => setCurrentIndex(idx)}
                    className={`w-10 h-10 rounded-lg text-sm font-bold transition ${
                      currentIndex === idx ? 'bg-blue-600 text-white ring-4 ring-blue-100' :
                      answers[idx] ? 'bg-green-500 text-white' : 'bg-slate-100 text-slate-400'
                    }`}
                  >
                    {idx + 1}
                  </button>
                ))}
              </div>
              <button onClick={() => setShowResult(true)} className="w-full mt-8 py-4 bg-slate-900 text-white rounded-2xl font-bold hover:bg-black transition">Finalizar Simulado</button>
            </div>

            <div className="bg-gradient-to-br from-orange-400 to-red-500 p-6 rounded-3xl text-white shadow-lg">
              <h4 className="font-bold mb-1 flex items-center gap-2">🔥 Streak de {streak} dias!</h4>
              <p className="text-xs opacity-90">Você está no top 5% de estudantes hoje. Não pare agora!</p>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
