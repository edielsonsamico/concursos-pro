-- ============================================================================
-- SEED DE CONTEÚDO: 10 SIMULADOS DE RACIOCÍNIO LÓGICO
-- Este script popula o banco de dados com questões reais de Raciocínio Lógico.
-- ============================================================================

-- 1. Garantir que a disciplina existe
INSERT INTO subjects (name, category)
VALUES ('Raciocínio Lógico', 'Exatas')
ON CONFLICT DO NOTHING;

-- Variável para pegar o ID da disciplina
DO $$
DECLARE
    v_sub_id INTEGER;
BEGIN
    SELECT id INTO v_sub_id FROM subjects WHERE name = 'Raciocínio Lógico' LIMIT 1;

    -- SIMULADO 1: Lógica de Proposições (Conectivos e Tabela Verdade)
    -- Questão 1.1
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_sub_id, 'FGV', 2023, 'Se "Todo concurseiro é dedicado" e "Algum dedicado é feliz", podemos afirmar que "Algum concurseiro é feliz"?', 'medium', 'Falso. O fato de haver dedicados felizes não garante que os concurseiros estejam nesse grupo de felizes.');
    -- Alternativas para a 1.1
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, 'Sim, necessariamente', false FROM questions WHERE statement LIKE 'Se "Todo concurseiro é dedicado"%' LIMIT 1 UNION ALL
    SELECT id, 'Não, não necessariamente', true FROM questions WHERE statement LIKE 'Se "Todo concurseiro é dedicado"%' LIMIT 1 UNION ALL
    SELECT id, 'Apenas se todos forem felizes', false FROM questions WHERE statement LIKE 'Se "Todo concurseiro é dedicado"%' LIMIT 1 UNION ALL
    SELECT id, 'Não se pode determinar', false FROM questions WHERE statement LIKE 'Se "Todo concurseiro é dedicado"%' LIMIT 1;

    -- SIMULADO 2: Negações Lógicas (Leis de De Morgan)
    -- Questão 2.1
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_sub_id, 'CESPE', 2023, 'Qual a negação da frase: "Eu estudo e sou aprovado"?', 'easy', 'A negação de (P e Q) é (~P ou ~Q). Portanto: Não estudo ou não sou aprovado.');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, 'Eu não estudo e não sou aprovado', false FROM questions WHERE statement LIKE 'Qual a negação da frase%' LIMIT 1 UNION ALL
    SELECT id, 'Eu não estudo ou não sou aprovado', true FROM questions WHERE statement LIKE 'Qual a negação da frase%' LIMIT 1 UNION ALL
    SELECT id, 'Se eu não estudo, não sou aprovado', false FROM questions WHERE statement LIKE 'Qual a negação da frase%' LIMIT 1 UNION ALL
    SELECT id, 'Eu estudo mas não sou aprovado', false FROM questions WHERE statement LIKE 'Qual a negação da frase%' LIMIT 1;

    -- SIMULADO 3: Sequências Lógicas e Padrões
    -- Questão 3.1
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_sub_id, 'VUNESP', 2022, 'Observe a sequência: 2, 5, 10, 17, 26, ... Qual o próximo termo?', 'medium', 'A sequência segue o padrão n² + 1. (1²+1=2, 2²+1=5, 3²+1=10, 4²+1=17, 5²+1=26). O próximo é 6²+1 = 37.');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, '35', false FROM questions WHERE statement LIKE 'Observe a sequência%' LIMIT 1 UNION ALL
    SELECT id, '36', false FROM questions WHERE statement LIKE 'Observe a sequência%' LIMIT 1 UNION ALL
    SELECT id, '37', true FROM questions WHERE statement LIKE 'Observe a sequência%' LIMIT 1 UNION ALL
    SELECT id, '38', false FROM questions WHERE statement LIKE 'Observe a sequência%' LIMIT 1;

    -- SIMULADO 4: Conjuntos e Diagramas de Venn
    -- Questão 4.1
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_sub_id, 'FCC', 2023, 'Em um grupo de 100 pessoas, 60 gostam de café, 40 de chá e 20 de ambos. Quantas não gostam de nenhum?', 'medium', 'Total = (Café + Chá - Ambos) = (60 + 40 - 20) = 80. Portanto, 100 - 80 = 20 pessoas não gostam de nenhum.');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, '10 pessoas', false FROM questions WHERE statement LIKE 'Em um grupo de 100 pessoas%' LIMIT 1 UNION ALL
    SELECT id, '20 pessoas', true FROM questions WHERE statement LIKE 'Em um grupo de 100 pessoas%' LIMIT 1 UNION ALL
    SELECT id, '30 pessoas', false FROM questions WHERE statement LIKE 'Em um grupo de 100 pessoas%' LIMIT 1 UNION ALL
    SELECT id, '40 pessoas', false FROM questions WHERE statement LIKE 'Em um grupo de 100 pessoas%' LIMIT 1;

    -- SIMULADO 5: Equivalências Lógicas (Condicionais)
    -- Questão 5.1
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_sub_id, 'FGV', 2024, 'A frase "Se chove, então a rua fica molhada" é logicamente equivalente a:', 'easy', 'A equivalência de P -> Q é ~Q -> ~P (Contrapositiva) ou ~P v Q.');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, 'Se a rua está molhada, então choveu', false FROM questions WHERE statement LIKE 'A frase "Se chove%' LIMIT 1 UNION ALL
    SELECT id, 'Se a rua não está molhada, então não choveu', true FROM questions WHERE statement LIKE 'A frase "Se chove%' LIMIT 1 UNION ALL
    SELECT id, 'Chove e a rua não fica molhada', false FROM questions WHERE statement LIKE 'A frase "Se chove%' LIMIT 1 UNION ALL
    SELECT id, 'Não chove e a rua não fica molhada', false FROM questions WHERE statement LIKE 'A frase "Se chove%' LIMIT 1;

    -- SIMULADO 6: Probabilidade Básica
    -- Questão 6.1
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_sub_id, 'CESPE', 2022, 'Ao lançar um dado honesto de 6 faces, qual a probabilidade de sair um número primo?', 'easy', 'Números primos no dado: 2, 3, 5. Total = 3. Probabilidade = 3/6 = 0,5 ou 50%.');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, '33.3%', false FROM questions WHERE statement LIKE 'Ao lançar um dado%' LIMIT 1 UNION ALL
    SELECT id, '50%', true FROM questions WHERE statement LIKE 'Ao lançar um dado%' LIMIT 1 UNION ALL
    SELECT id, '66.6%', false FROM questions WHERE statement LIKE 'Ao lançar um dado%' LIMIT 1 UNION ALL
    SELECT id, '25%', false FROM questions WHERE statement LIKE 'Ao lançar um dado%' LIMIT 1;

    -- SIMULADO 7: Análise Combinatória (Arranjo vs Combinação)
    -- Questão 7.1
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_sub_id, 'FCC', 2023, 'De quantas formas podemos escolher 3 pessoas de um grupo de 10 para formar uma comissão (onde a ordem não importa)?', 'medium', 'Combinação de 10 tomados 3 a 3: C(10,3) = (10*9*8)/(3*2*1) = 120.');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, '720', false FROM questions WHERE statement LIKE 'De quantas formas podemos escolher 3 pessoas%' LIMIT 1 UNION ALL
    SELECT id, '120', true FROM questions WHERE statement LIKE 'De quantas formas podemos escolher 3 pessoas%' LIMIT 1 UNION ALL
    SELECT id, '30', false FROM questions WHERE statement LIKE 'De quantas formas podemos escolher 3 pessoas%' LIMIT 1 UNION ALL
    SELECT id, '240', false FROM questions WHERE statement LIKE 'De quantas formas podemos escolher 3 pessoas%' LIMIT 1;

    -- SIMULADO 8: Lógica de Argumentação (Silogismos)
    -- Questão 8.1
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_sub_id, 'FGV', 2021, 'Premissa 1: Todo A é B. Premissa 2: Todo B é C. Conclusão lógica:', 'easy', 'Se todo A está contido em B e todo B está contido em C, então todo A está necessariamente contido em C.');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, 'Algum A não é C', false FROM questions WHERE statement LIKE 'Premissa 1: Todo A é B%' LIMIT 1 UNION ALL
    SELECT id, 'Todo A é C', true FROM questions WHERE statement LIKE 'Premissa 1: Todo A é B%' LIMIT 1 UNION ALL
    SELECT id, 'Todo C é A', false FROM questions WHERE statement LIKE 'Premissa 1: Todo A é B%' LIMIT 1 UNION ALL
    SELECT id, 'Nenhum A é C', false FROM questions WHERE statement LIKE 'Premissa 1: Todo A é B%' LIMIT 1;

    -- SIMULADO 9: Verdades e Mentiras (Desafios Lógicos)
    -- Questão 9.1
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_sub_id, 'CESPE', 2023, 'Ana diz: "Bia mentiu". Bia diz: "Carla mentiu". Carla diz: "Ana e Bia mentiram". Quem está falando a verdade?', 'hard', 'Se Ana fala a verdade, Bia mente. Se Bia mente, Carla fala a verdade. Mas Carla diz que Ana mente. Contradição. Se Ana mente, Bia fala a verdade. Se Bia fala a verdade, Carla mente. Se Carla mente, a frase "Ana e Bia mentiram" é falsa (o que é verdade, pois Bia falou a verdade). Logo, Bia é a única que fala a verdade.');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, 'Ana', false FROM questions WHERE statement LIKE 'Ana diz: "Bia mentiu"%' LIMIT 1 UNION ALL
    SELECT id, 'Bia', true FROM questions WHERE statement LIKE 'Ana diz: "Bia mentiu"%' LIMIT 1 UNION ALL
    SELECT id, 'Carla', false FROM questions WHERE statement LIKE 'Ana diz: "Bia mentiu"%' LIMIT 1 UNION ALL
    SELECT id, 'Nenhuma delas', false FROM questions WHERE statement LIKE 'Ana diz: "Bia mentiu"%' LIMIT 1;

    -- SIMULADO 10: Raciocínio Matemático (Problemas de Idade/Lógica)
    -- Questão 10.1
    INSERT INTO questions (subject_id, agency, year, statement, difficulty, explanation)
    VALUES (v_//sub_id, 'VUNESP', 2022, 'Um pai tem 40 anos e o filho tem 10. Daqui a quantos anos o pai terá o dobro da idade do filho?', 'medium', '40+x = 2(10+x) -> 40+x = 20+2x -> x = 20. Daqui a 20 anos, o pai terá 60 e o filho 30.');
    INSERT INTO options (question_id, text, is_correct)
    SELECT id, '10 anos', false FROM questions WHERE statement LIKE 'Um pai tem 40 anos%' LIMIT 1 UNION ALL
    SELECT id, '15 anos', false FROM questions WHERE statement LIKE 'Um pai tem 40 anos%' LIMIT 1 UNION ALL
    SELECT id, '20 anos', true FROM questions WHERE statement LIKE 'Um pai tem 40 anos%' LIMIT 1 UNION ALL
    SELECT id, '25 anos', false FROM questions WHERE statement LIKE 'Um pai tem 40 anos%' LIMIT 1;

END $$;
