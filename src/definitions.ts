export interface SharedContentsPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
