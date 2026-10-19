-- ============================================================================
-- SEED DE CONTEÚDO: LÍNGUA PORTUGUESA (SIMULADOS 1-10)
-- ============================================================================

INSERT INTO subjects (name, category) VALUES ('Língua Portuguesa', 'Geral') ON CONFLICT DO NOTHING;

DO $$
DECLARE
    v_sub_id INTEGER;
BEGIN
    SELECT id INTO v_sub_id FROM subjects WHERE name = 'Língua Portuguesa' LIMIT 1;

    -- S1: Interpretação de Texto
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_sub_id, 'FGV', 2023, 'No texto "A era da informação", a tese principal do autor é que a tecnologia isola os indivíduos. Esse tipo de afirmação é classificada como:', 'medium', 'Trata-se de uma inferência textual baseada na análise do argumento central do autor.');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, 'Fato', false FROM questions WHERE statement LIKE 'No texto "A era da informação"%' LIMIT 1 UNION ALL
    SELECT id, 'Opinião/Tese', true FROM questions WHERE statement LIKE 'No texto "A era da informação"%' LIMIT 1 UNION ALL
    SELECT id, 'Paradoxo', false FROM questions WHERE statement LIKE 'No texto "A era da informação"%' LIMIT 1 UNION ALL
    SELECT id, 'Pleonasmo', false FROM questions WHERE statement LIKE 'No texto "A era da informação"%' LIMIT 1;

    -- S2: Sintaxe (Sujeito e Predicado)
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_sub_id, 'VUNESP', 2023, 'Na frase "Alugam-se casas", o sujeito é:', 'easy', 'Sujeito Paciente: "Casas são alugadas". A partícula "se" é apassivadora.', 'medium');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, 'Indeterminado', false FROM questions WHERE statement LIKE 'Na frase "Alugam-se casas"%' LIMIT 1 UNION ALL
    SELECT id, 'Oculto', false FROM questions WHERE statement LIKE 'Na frase "Alugam-se casas"%' LIMIT 1 UNION ALL
    SELECT id, 'Simples (Casas)', true FROM questions WHERE statement LIKE 'Na frase "Alugam-se casas"%' LIMIT 1 UNION ALL
    SELECT id, 'Inexistente', false FROM questions WHERE statement LIKE 'Na frase "Alugam-se casas"%' LIMIT 1;

    -- S3: Concordância Verbal
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_sub_id, 'FCC', 2022, 'Qual frase apresenta concordância verbal correta?', 'medium', 'O verbo "haver" no sentido de existir é impessoal e deve ficar no singular.');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, 'Houveram muitos erros na prova', false FROM questions WHERE statement LIKE 'Qual frase apresenta concordância verbal correta%' LIMIT 1 UNION ALL
    SELECT id, 'Havia muitas pessoas na fila', true FROM questions WHERE statement LIKE 'Qual frase apresenta concordância verbal correta%' LIMIT 1 UNION ALL
    SELECT id, 'Fazem dez anos que não o vejo', false FROM questions WHERE statement LIKE 'Qual frase apresenta concordância verbal correta%' LIMIT 1 UNION ALL
    SELECT id, 'Existiam muitos problemas, mas houve discussões', false FROM questions WHERE statement LIKE 'Qual frase apresenta concordância verbal correta%' LIMIT 1;

    -- S4: Regência Nominal e Verbal
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_sub_id, 'FGV', 2024, 'O verbo "assistir", no sentido de ver, exige qual preposição?', 'easy', 'Regência verbal: Assistir (ver) exige a preposição "a".');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, 'De', false FROM questions WHERE statement LIKE 'O verbo "assistir"%' LIMIT 1 UNION ALL
    SELECT id, 'Com', false FROM questions WHERE statement LIKE 'O verbo "assistir"%' LIMIT 1 UNION ALL
    SELECT id, 'A', true FROM questions WHERE statement LIKE 'O verbo "assistir"%' LIMIT 1 UNION ALL
    SELECT id, 'Para', false FROM questions WHERE statement LIKE 'O verbo "assistir"%' LIMIT 1;

    -- S5: Crase
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_sub_id, 'CESPE', 2023, 'O uso da crase é PROIBIDO em qual das seguintes opções?', 'medium', 'Não se usa crase antes de palavras masculinas.');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, 'Vou à escola', false FROM questions WHERE statement LIKE 'O uso da crase é PROIBIDO%' LIMIT 1 UNION ALL
    SELECT id, 'Entreguei o livro à professora', false FROM questions WHERE statement LIKE 'O uso da crase é PROIBIDO%' LIMIT 1 UNION ALL
    SELECT id, 'Andamos a pé', true FROM questions WHERE statement LIKE 'O uso da crase é PROIBIDO%' LIMIT 1 UNION ALL
    SELECT id, 'Chegamos à cidade', false FROM questions WHERE statement LIKE 'O uso da crase é PROIBIDO%' LIMIT 1;

    -- S6: Pontuação (Vírgula)
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_sub_id, 'VUNESP', 2023, 'A vírgula é obrigatória para separar:', 'medium', 'A vírgula deve separar o vocativo e o aposto.');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, 'O sujeito do predicado', false FROM questions WHERE statement LIKE 'A vírgula é obrigatória%' LIMIT 1 UNION ALL
    SELECT id, 'O objeto direto do verbo', false FROM questions WHERE statement LIKE 'A vírgula é obrigatória%' LIMIT 1 UNION ALL
    SELECT id, 'O vocativo', true FROM questions WHERE statement LIKE 'A vírgula é obrigatória%' LIMIT 1 UNION ALL
    SELECT id, 'O adjunto adnominal', false FROM questions WHERE statement LIKE 'A vírgula é obrigatória%' LIMIT 1;

    -- S7: Figuras de Linguagem
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_sub_id, 'FCC', 2022, 'A frase "O vento beijou meu rosto" apresenta qual figura de linguagem?', 'easy', 'Personificação ou Prosopopeia: atribuir características humanas a seres inanimados.');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, 'Metonímia', false FROM questions WHERE statement LIKE 'A frase "O vento beijou%' LIMIT 1 UNION ALL
    SELECT id, 'Hipérbole', false FROM questions WHERE statement LIKE 'A frase "O vento beijou%' LIMIT 1 UNION ALL
    SELECT id, 'Personificação', true FROM questions WHERE statement LIKE 'A frase "O vento beijou%' LIMIT 1 UNION ALL
    SELECT id, 'Ironia', false FROM questions WHERE statement LIKE 'A frase "O vento beijou%' LIMIT 1;

    -- S8: Verbos (Tempos e Modos)
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_sub_id, 'FGV', 2023, 'Qual frase está no Futuro do Pretérito?', 'medium', 'Futuro do Pretérito indica algo que aconteceria sob certa condição (terminação -ria).');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, 'Eu estudarei amanhã', false FROM questions WHERE statement LIKE 'Qual frase está no Futuro%' LIMIT 1 UNION ALL
    SELECT id, 'Eu estudava sempre', false FROM questions WHERE statement LIKE 'Qual frase está no Futuro%' LIMIT 1 UNION ALL
    SELECT id, 'Eu estudaria se tivesse tempo', true FROM questions WHERE statement LIKE 'Qual frase está no Futuro%' LIMIT 1 UNION ALL
    SELECT id, 'Eu estudei muito', false FROM questions WHERE statement LIKE 'Qual frase está no Futuro%' LIMIT 1;

    -- S9: Semântica (Sinônimos e Antônimos)
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_sub_id, 'CESPE', 2024, 'A palavra "Inexorável" significa:', 'hard', 'Inexorável é aquilo que não se move por súplicas, inflexível, inevitável.');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, 'Facilitado', false FROM questions WHERE statement LIKE 'A palavra "Inexorável"%' LIMIT 1 UNION ALL
    SELECT id, 'Inevitável', true FROM questions WHERE statement LIKE 'A palavra "Inexorável"%' LIMIT 1 UNION ALL
    SELECT id, 'Duvidoso', false FROM questions WHERE statement LIKE 'A palavra "Inexorável"%' LIMIT 1 UNION ALL
    SELECT id, 'Rápido', false FROM questions WHERE statement LIKE 'A palavra "Inexorável"%' LIMIT 1;

    -- S10: Coesão e Coerência (Conjunções)
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_//sub_id, 'VUNESP', 2023, 'A conjunção "Contudo" estabelece relação de:', 'easy', 'Contudo, porém, todavia, entretanto são conjunções adversativas (oposição).');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, 'Causa', false FROM questions WHERE statement LIKE 'A conjunção "Contudo"%' LIMIT 1 UNION ALL
    SELECT id, 'Conclusão', false FROM questions WHERE statement LIKE 'A conjunção "Contudo"%' LIMIT 1 UNION ALL
    SELECT id, 'Adição', false FROM questions WHERE statement LIKE 'A conjunção "Contudo"%' LIMIT 1 UNION ALL
    SELECT id, 'Adversidade', true FROM questions WHERE statement LIKE 'A conjunção "Contudo"%' LIMIT 1;

END $$;
