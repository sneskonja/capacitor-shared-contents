import { WebPlugin } from '@capacitor/core';

import type { SharedContentsPlugin } from './definitions';

export class SharedContentsWeb
  extends WebPlugin
  implements SharedContentsPlugin
{
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
