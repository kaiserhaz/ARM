/* led.c */

/* Fonction led_Init qui initialise les LEDs à utiliser
 */

void led_Init(int led_conf)
{
	GPIO_Init(led_conf);

}

/* Fonction led_Blink qui réalise le clignottement des LEDs
 */

void led_Blink()
{
	int i;
	
	int conf = (~GPIO_Read());

	while(1)
	{
		GPIO_Write(conf);
		//for(i=0; i<300000; i++); /* Boucle de retard */
	}
}