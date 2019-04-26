export declare interface Item {
    id?: number;
    tags: Tag[];
    titulo: string;
    detalhe: string;
    imagem: string;
    regiao: Regiao;
    usuarioId: number;
    dataInicio: Date;
    dataFim: Date;
    hora: string;
}

export declare interface ItemPerdido extends Item {
    recuperado: boolean;
}

export declare interface ItemEncontrado extends Item {
    devolvido: boolean;
}

export declare interface Regiao {
    longitude: string;
    latitude: string;
}

export declare interface Tag {
    id?: number;
    nome: string;
}

export declare type tipoItem = 'achado' | 'perdido';
