import { WebPlugin } from '@capacitor/core';

import type { SharedContentsPlugin } from './definitions';

export class SharedContentsWeb
  extends WebPlugin
  implements SharedContentsPlugin
{
  async writeContents(options: { value: string, key: string, widget: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
