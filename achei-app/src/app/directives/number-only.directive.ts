import { Directive, ElementRef, HostListener } from '@angular/core';

/**
 * Permite apenas números
 *
 * @directive appNumberOnly
 */
@Directive({
  selector: '[appNumberOnly]'
})
export class NumberOnlyDirective {

  /**
   * Expressão regular responsável pela validação do input
   */
  protected regex: RegExp = new RegExp('^[0-9]*$');

  /**
   * Allow key codes for special events. Reflect :
   * Backspace, tab, end, home
   */
  protected specialKeys: Array<string> = ['Backspace', 'Tab', 'End', 'Home', '-'];

  /**
   * @param el Elemento html a ser validado
   */
  constructor(protected el: ElementRef) { }

  @HostListener('keydown', ['$event'])
  onKeyDown(event: KeyboardEvent) {
    // Allow Backspace, tab, end, and home keys
    if (this.specialKeys.indexOf(event.key) !== -1) {
      return;
    }
    const current: string = this.el.nativeElement.value;
    const next: string = current.concat(event.key);
    if (next && !String(next).match(this.regex)) {
      event.preventDefault();
    }
  }
}

/**
 * Diretiva que permite apenas números positivos entre 0 e 24
 *
 * @directive appHourValue
 * @extends NumberOnlyDirective
 */
@Directive({
  selector: '[appHourValue]'
})
export class HoursValueDirective extends NumberOnlyDirective {

  constructor(el: ElementRef) {
    super(el);
    this.regex = new RegExp('^0*([0-9]|1[0-9]|2[0-4])$');
  }
}

/**
 * Diretiva que permite apenas números positivos entre 0 e 59
 *
 * @directive appMinuteValue
 * @extends NumberOnlyDirective
 */
@Directive({
  selector: '[appMinuteValue]'
})
export class MinutesValueDirective extends NumberOnlyDirective {

  constructor(el: ElementRef) {
    super(el);
    this.regex = new RegExp('^0*([0-9]|[1-4][0-9]|5[0-9])$');
  }
}
