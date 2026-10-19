export type Difficulty = 'easy' | 'medium' | 'hard';

export interface Option {
    id: string;
    text: string;
    isCorrect: boolean;
}

export interface Question {
    id: string;
    subject: string;
    agency: string;
    year: number;
    statement: string;
    difficulty: Difficulty;
    options: Option[];
    explanation: string;
}

export interface UserProgress {
    userId: string;
    questionId: string;
    selectedOptionId: string;
    isCorrect: boolean;
    completedAt: Date;
}
