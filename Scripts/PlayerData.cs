using Godot;
using System;
using System.Collections.Generic;

// Global class to store player data, persists between scenes

public partial class PlayerData : Node
{
	public static PlayerData Instance { get; private set; }

	public int HighScore { get; set; }

	public int UpgradePoints { get; set; }

	public Dictionary<UpgradeType, Upgrade> Upgrades { get; set; }
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		Instance = this;
	}
}

// Used to store the upgrade data in a readable format
public enum UpgradeType
{
	PopSize,
	SheetCount,
	SheetSpeed,
	ShiftLength,
}

public class Upgrade
{
	public int Level { get; set; }
	public int Cost { get; set; }
	public int Value { get; set; }
}