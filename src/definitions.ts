export interface SharedContentsPlugin {
  writeContents(options: { value: string, key?: string, widget?: string }): Promise<{ value: string }>;
}
