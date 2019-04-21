export declare interface Item {
    id?: number;
    tags: ItemTag[];
    titulo: string;
    detalhe: string;
    imagens: string[];
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

export declare interface ItemTag {
    id?: number;
    tag: string;
    item?: Item;
}
