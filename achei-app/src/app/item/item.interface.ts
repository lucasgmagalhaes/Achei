import { Usuario } from '../interfaces/usuario.interface';

export declare interface Item {
    id: number;
    tags: string[];
    titulo: string;
    descricao: string;
    imagens: string[];
    regiao: string;
    usuario: Usuario;
    recuperado: boolean;
}
