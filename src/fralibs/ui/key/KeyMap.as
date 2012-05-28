package fralibs.ui.key 
{
	/**
	 * ...
	 * @author Shuzo Kuwako
	 */
	public class KeyMap 
	{
		
		public function KeyMap() 
		{
			
		}
		
		public static function unicodeToAcii(str:String):int
		{
			switch(str) {
				case "0":
					return 48;
				case "1":
					return 49;
				case "2":
					return 50;
				case "3":
					return 51;
				case "4":
					return 52;
				case "5":
					return 53;
				case "6":
					return 54;
				case "7":
					return 55;
				case "8":
					return 56;
				case "9":
					return 57;
				case "a":
					return 65;
				case "b":
					return 66;
				case "c":
					return 67;
				case "d":
					return 68;
				case "e":
					return 69;
				case "f":
					return 70
				case "g":     
					return 71
				case "h":     
					return 72;
				case "i":     
					return 73;
				case "j":     
					return 74;
				case "k":     
					return 75;
				case "l":     
					return 76;
				case "m":     
					return 77;
				case "n":     
					return 78;
				case "o":     
					return 79;
				case "p":     
					return 80;
				case "q":     
					return 81;
				case "r":     
					return 82;
				case "s":     
					return 83;
				case "t":     
					return 84;
				case "u":     
					return 85;
				case "v":     
					return 86;
				case "w":     
					return 87;
				case "x":     
					return 88;
				case "y":     
					return 89;
				case "z":     
					return 90;
				default:
			}
			return -1;
		}
		
	}

}