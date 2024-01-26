/// Enemy : Take Damage

if (other.Team == 1)
{
	if (Shield > 0) Shield = max(Shield - other.Damage, 0);
	else Hull = 0;
	ShieldRegen.Delay = 0;
	ShieldRegen.Time = ShieldRegen.MaxTime;	// regen 1 point instantly after delay ends

	instance_destroy(other);
}