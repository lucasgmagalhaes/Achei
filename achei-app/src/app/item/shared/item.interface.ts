export declare interface Item {
    id?: number;
    tags: string[];
    titulo: string;
    detalhe: string;
    imagens: string[];
    regiao: Regiao;
    usuarioId: number;
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
