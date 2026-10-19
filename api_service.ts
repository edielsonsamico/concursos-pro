// src/services/api.ts
import { createClient } from '@supabase/supabase-js';

// Essas chaves você pega no painel do seu projeto no Supabase
const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL || '';
const SUPABASE_ANON_KEY = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || '';

export const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

export const ConcursoService = {
    // 1. Buscar questões de uma disciplina específica
    async getQuestionsBySubject(subjectId: number) {
        const { data, error } = await supabase
            .from('questions')
            .select(`
                id, statement, agency, year, difficulty, explanation,
                options (id, text, is_correct)
            `)
            .eq('subject_id', subjectId);

        if (error) throw error;
        return data;
    },

    // 2. Salvar a resposta do aluno no banco de dados
    async saveResponse(userId: string, questionId: string, optionId: string) {
        // Primeiro verificamos se a opção é correta
        const { data: option } = await supabase
            .from('options')
            .select('is_correct')
            .eq('id', optionId)
            .single();

        const { error } = await supabase
            .from('user_responses')
            .insert({
                user_id: userId,
                question_id: questionId,
                option_id: optionId,
                is_correct: option?.is_correct || false
            });

        if (error) throw error;
        return { success: true };
    },

    // 3. Buscar estatísticas de desempenho do usuário
    async getUserStats(userId: string) {
        const { data, error } = await supabase
            .from('user_responses')
            .select(`
                is_correct,
                questions (subject_id, subjects (name))
            `)
            .eq('user_id', userId);

        if (error) throw error;
        return data;
    }
};
