-- ============================================================================
-- SCHEMA PARA PLATAFORMA DE CONCURSOS
-- Compatível com PostgreSQL / Supabase
-- ============================================================================

-- 1. Disciplinas (ex: Direito Constitucional, Português)
CREATE TABLE subjects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) -- Jurídica, Exatas, Geral
);

-- 2. Questões
CREATE TABLE questions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    subject_id INTEGER REFERENCES subjects(id) ON DELETE CASCADE,
    agency VARCHAR(50), -- FGV, CESPE, VUNESP
    year INTEGER,
    statement TEXT NOT NULL,
    difficulty VARCHAR(20) CHECK (difficulty IN ('easy', 'medium', 'hard')),
    explanation TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 3. Alternativas
CREATE TABLE options (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    question_id UUID REFERENCES questions(id) ON DELETE CASCADE,
    text TEXT NOT NULL,
    is_correct BOOLEAN DEFAULT false
);

-- 4. Respostas dos Usuários (Histórico para Analytics)
CREATE TABLE user_responses (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL, -- ID do usuário vindo do Auth
    question_id UUID REFERENCES questions(id),
    option_id UUID REFERENCES options(id),
    is_correct BOOLEAN,
    answered_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================================================
-- DADOS DE EXEMPLO (SEED)
-- ============================================================================

INSERT INTO subjects (name, category) VALUES
('Direito Administrativo', 'Jurídica'),
('Língua Portuguesa', 'Geral'),
('Raciocínio Lógico', 'Exatas');

-- Inserindo uma questão de exemplo
DO $$
DECLARE
    v_subject_id INTEGER;
    v_question_id UUID;
BEGIN
    SELECT id INTO v_subject_id FROM subjects WHERE name = 'Direito Administrativo' LIMIT 1;

    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_subject_id, 'FGV', 2024, 'Sobre os atos administrativos, é correto afirmar que a presunção de legitimidade é um atributo:', 'medium', 'A presunção de legitimidade presume que o ato foi editado em conformidade com a lei.')
    RETURNING id INTO v_question_id;

    INSERT INTO options (question_id, text, is_correct) VALUES
    (v_question_id, 'Relativa', true),
    (v_question_id, 'Absoluta', false),
    (v_question_id, 'Inexistente', false),
    (v_question_id, 'Opcional', false);
END $$;
