import { Item } from './item.interface';
import { Status } from './status.enum';
import { Usuario } from '../../interfaces/usuario.interface';

export declare interface Situacao {
    id: number;
    itensCompativeis: Item[];
    status: Status;
    usuario: Usuario;
}

export declare interface SituacaoPerda extends Situacao {
    itensPerdidos: Item[];
    dataInicio: Date;
    dataFim: Date;
}

export declare interface SituacaoPerda extends Situacao {
    itensAchados: Item[];
    dataEncontro: Date;
}
