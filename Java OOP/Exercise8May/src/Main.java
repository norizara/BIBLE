
interface IDamageable {
	public int takeDamage (int damage, int defense);
}

interface IAttack {
	public void attack (IDamageable damageable);
}

interface IRecoverable {
	public void recover (int value);
}

interface IHeal {
	public void heal (int value);
}

public class Main {

	public static void main(String[] args) {
		Player player = new Player ("Admium", new HP(100), 10, 3);
		
		Enemy[] enemies = {
				new Enemy("Slime", new HP(10), 2, 0)
				, new Enemy("Goblin", new HP(20), 5, 2)
				, new Enemy("Golem", new HP(50), 5, 10)
		};
		
		player.attack(enemies[0]);
		enemies[0].showHP();
		
		enemies[0].attack(enemies[1]);
		enemies[1].showHP();
		
		enemies[0].attack(enemies[2]);
		enemies[2].showHP();
	}

}