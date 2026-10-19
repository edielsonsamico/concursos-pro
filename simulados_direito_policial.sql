-- ============================================================================
-- SEED DE CONTEÚDO: DIREITO PARA CARREIRAS POLICIAIS (PM, PC, PRF, PF)
-- ============================================================================

-- Garantir disciplinas
INSERT INTO subjects (name, category) VALUES
('Direito Constitucional', 'Jurídica'),
('Direito Administrativo', 'Jurídica'),
('Direito Penal', 'Jurídica'),
('Direito Processual Penal', 'Jurídica')
ON CONFLICT DO NOTHING;

DO $$
DECLARE
    v_const_id INTEGER; v_adm_id INTEGER; v_pen_id INTEGER; v_proc_id INTEGER;
BEGIN
    SELECT id INTO v_const_id FROM subjects WHERE name = 'Direito Constitucional' LIMIT 1;
    SELECT id INTO v_adm_id FROM subjects WHERE name = 'Direito Administrativo' LIMIT 1;
    SELECT id INTO v_pen_id FROM subjects WHERE name = 'Direito Penal' LIMIT 1;
    SELECT id INTO v_proc_id FROM subjects WHERE name = 'Direito Processual Penal' LIMIT 1;

    -- 1. DIREITO CONSTITUCIONAL (Foco: Art. 5º e 144)
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_const_id, 'CESPE', 2023, 'No que tange aos direitos e garantias fundamentais, a casa é asilo inviolável do indivíduo, ninguém nela podendo penetrar sem consentimento do morador, SALVO:', 'medium', 'A inviolabilidade domiciliar admite exceções: flagrante delito, desastre, para prestar socorro, ou, durante o dia, por determinação judicial.');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, 'Apenas durante a noite com ordem judicial', false FROM questions WHERE statement LIKE 'No que tange aos direitos%' LIMIT 1 UNION ALL
    SELECT id, 'Durante o dia, por determinação judicial', true FROM questions WHERE statement LIKE 'No que tange aos direitos%' LIMIT 1 UNION ALL
    SELECT id, 'A qualquer hora, independente de ordem', false FROM questions WHERE statement LIKE 'No que tange aos direitos%' LIMIT 1 UNION ALL
    SELECT id, 'Apenas com consentimento do proprietário', false FROM questions WHERE statement LIKE 'No que tange aos direitos%' LIMIT 1;

    -- 2. DIREITO ADMINISTRATIVO (Foco: Improbidade e Atos)
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_adm_id, 'FGV', 2024, 'O ato administrativo que apresenta vício sanável, podendo a administração corrigi-lo para manter a validade, é passível de:', 'medium', 'A convalidação é o ato administrativo que supre vício sanável de um ato anterior.');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, 'Anulação', false FROM questions WHERE statement LIKE 'O ato administrativo que apresenta vício sanável%' LIMIT 1 UNION ALL
    SELECT id, 'Revogação', false FROM questions WHERE statement LIKE 'O ato administrativo que apresenta vício sanável%' LIMIT 1 UNION ALL
    SELECT id, 'Convalidação', true FROM questions WHERE statement LIKE 'O ato administrativo que apresenta vício sanável%' LIMIT 1 UNION ALL
    SELECT id, 'Cassação', false FROM questions WHERE statement LIKE 'O ato administrativo que apresenta vício sanável%' LIMIT 1;

    -- 3. DIREITO PENAL (Foco: Tipicidade e Crimes contra Adm)
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_pen_id, 'VUNESP', 2023, 'O crime de Peculato ocorre quando o funcionário público se apropria de dinheiro ou bem móvel de que tem a posse em razão do cargo. Esse crime é classificado como:', 'easy', 'Crime próprio, pois exige a qualidade de funcionário público.');
    INSERT INTO options (question_id, text, is_//correct)
    SELECT id, 'Crime comum', false FROM questions WHERE statement LIKE 'O crime de Peculato ocorre%' LIMIT 1 UNION ALL
    SELECT id, 'Crime próprio', true FROM questions WHERE statement LIKE 'O crime de Peculato ocorre%' LIMIT 1 UNION ALL
    SELECT id, 'Crime culposo', false FROM questions WHERE statement LIKE 'O crime de Peculato ocorre%' LIMIT 1 UNION ALL
    SELECT id, 'Crime impossível', false FROM questions WHERE statement LIKE 'O crime de Peculato ocorre%' LIMIT 1;

    -- 4. DIREITO PROCESSUAL PENAL (Foco: Inquérito)
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_proc_id, 'CESPE', 2022, 'O Inquérito Policial (IP) possui a característica da indisponibilidade, o que significa que:', 'medium', 'O Delegado de Polícia não pode mandar arquivar autos de inquérito (Art. 17 CPP).');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, 'O MP pode arquivá-lo a qualquer momento', false FROM questions WHERE statement LIKE 'O Inquérito Policial (IP) possui%' LIMIT 1 UNION ALL
    SELECT id, 'A autoridade policial não pode mandar arquivar o IP', true FROM questions WHERE statement LIKE 'O Inquérito Policial (IP) possui%' LIMIT 1 UNION ALL
    SELECT id, 'O juiz arquiva obrigatoriamente sem ouvir o MP', false FROM questions WHERE statement LIKE 'O Inquérito Policial (IP) possui%' LIMIT 1 UNION ALL
    SELECT id, 'O investigado pode pedir o arquivamento direto', false FROM questions WHERE statement LIKE 'O Inquérito Policial (IP) possui%' LIMIT 1;

END $$;
