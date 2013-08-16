/**
 * This class uses the same method as the "Central Randomizer" 
 * javascript function provided by Paul Houle on the following web page:
 * http://www.honeylocust.com/javascript/randomizer.html
 *
 * This class is licensed under Creative Commons Attribution 3.0 License:  
 * http://creativecommons.org/licenses/by/3.0/
 * Essentially you are free to use this class in any way you want, but anywhere
 * you list credits for a work which uses this class you need to also acknowledge
 * this classes author.
 *
 * @author Noel Billig (http://www.dncompute.com)
 */
package 
{
public class RandomSeed {

	/**
	 *	You can set the seed to any number in order to start your random number sequence
	 */
	var seed:Number;
	
	
	function RandomSeed1(seed:Number) {
			this.seed = seed;
	}
	
	
	/**
	 *	Returns a pseudo-random number n, where 0 <= n < 1
	 */
	function getRandom(l:int):Number {
				seed = (seed*9301+49297) % 233280;
		return seed/(233280.0);
		
	}
	
	
	/**
	 *	Utility method for getting real numbers in the provided range
	 *	The range is inclusive	 
	 */
	function getNumInRange(bottom:Number,top:Number):Number {
		var dif:Number = top-bottom+1;
		var num:Number;
		num = getRandom(1);
		return bottom+(dif*num);
	}
	
	
	/**
	 *	Utility method for getting integers numbers in the provided range
	 *	The range is inclusive
	 */
	function getIntInRange(bottom:Number,top:Number):Number {
		var dif:Number = top-bottom+1;
		var num:Number = getRandom(1);
		return Math.floor( bottom+(dif*num) );
	}
	
	
	function getBoolean(l:int):Boolean {
		return getRandom(1) < .5;
	}


}
}