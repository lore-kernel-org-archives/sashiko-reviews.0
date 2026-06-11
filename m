Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB134C77DF
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 18:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781202609; cv=none; b=vCtJH3TsiGA4vzL66HbVmLcWaZPIGzRZF3o0j0igHsdcrU9oaJPgoyn+dFauYCetNoT5H48hvrHzEjUwFiCzQ6Statlm7AT5IoqQ+WAX2DgWMmDF9qAp3k8agUILQlblSwHY2ksb5efc7XyAD9s6/vtb6ZHu8IwXhKcxHvc6sT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781202609; c=relaxed/simple;
	bh=yk8gj4POIwSsvmW0MWmAGSwrG3oWaTWO93WVYRX4P18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HSuoj8wDcOQeE0vGnek1dHn/wNKDdAzaHHCDLR3ZJcC5YmIdD4vrjSKOXw901m8x63YmOB56KhWe0ko53/GyrI6Y1bsVQ8p9FZfssHFK7Enb4t84zgLD8donHcROXWdRzgMZJsq1WTjrI+VKQSfegIEVxF3t4KmXp3P/VRVR338=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMPWpjD+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMPWpjD+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298891F000E9;
	Thu, 11 Jun 2026 18:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781202605;
	bh=mUdMsvLpjD4bDeo9zF2p27HyJ781fK2RAxjZ/HWcvNs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lMPWpjD+jl3yplPYks0xMz3rgksD99nvDAyNjtKOFM72Rz5tvSdNTDLFdZ4zpUJ0K
	 iaLvqUSgoSVyxaPxBikGb35E/ueZutra41ruPs/vMxNYSyqlktZOr2TAdD9XK3C/G1
	 PBKy1bzYZuXphe1w11kebZXGmpKkS2htSrkaTm23uB4IgleuAKNuyB2XEeHg6BcsK5
	 qAAgLFXHOArlCRepSpBg9f71dk6G6XVNlmZW4QXoagAp4yipRUe0vebyz6bvIOtf2M
	 ls07mQg1HZf9UVdIho+DsM7/rUwBtTWaEwr1PQ3ewxrWN1MdGxxuTa7z+XRER7MFMS
	 ONJ4o0SK9leWg==
Message-ID: <0b01eebc-ba16-48ff-9b42-eec07dd372ef@kernel.org>
Date: Thu, 11 Jun 2026 21:30:01 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/17] i3c: renesas: Perform Dynamic Address Assignment
 on resume
To: sashiko-reviews@lists.linux.dev
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org,
 wsa+renesas@sang-engineering.com
References: <20260608201543.804902-7-claudiu.beznea@kernel.org>
 <20260608203648.CAC451F00893@smtp.kernel.org>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20260608203648.CAC451F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/8/26 23:36, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential issue(s) to consider:
> 
> New issues:
> - [Critical] `renesas_i3c_group_devs_in_slots()` crashes on free slots and fails to update the `free_pos` bitmask.
> - [Critical] Typo in array swapping logic duplicates I2C devices and corrupts driver state.
> - [High] Call to undefined function `i3c_master_reattach_i3c_dev_locked` and logically invalid usage of the reattach API.
> - [High] Bypassing `i3c_master_add_i3c_dev_locked()` on resume ignores UID arbitration order, breaking device isolation.
> - [High] Redundant and unsafe dereference of `->dev->desc` when retrieving master data.
> - [High] Stale `olddevs` mask corrupts DATBAS registers for relocated I2C devices.
> 
> Pre-existing issues:
> - [High] Integer underflow in `GENMASK` calculation in `renesas_i3c_daa()` causes undefined behavior.
> --
> 
> commit 3b3dbe672a58e6c80b4a3c7aad942c61076f9cd2
> Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> i3c: renesas: Perform Dynamic Address Assignment on resume
> 
> The patch modifies the Renesas I3C driver to run Dynamic Address Assignment
> (DAA) in the controller resume path to restore communication with I3C devices
> that lose power during suspend. It groups I2C and I3C devices during resume
> and re-runs ENTDAA for I3C devices.
> 
>> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
>> --- a/drivers/i3c/master/renesas-i3c.c
>> +++ b/drivers/i3c/master/renesas-i3c.c
> 
> [ ... ]
> 
>> +static u8 renesas_i3c_group_devs_in_slots(struct renesas_i3c *i3c)
>> +{
>> +	struct renesas_i3c_i2c_dev_data *new_i2c_data, *new_i3c_data;
>> +	struct renesas_i3c_addr i2c_addr, i3c_addr;
>> +	struct i3c_dev_desc *i3c_dev;
>> +	struct i2c_dev_desc *i2c_dev;
>> +	u8 i2c_pos = 0;
> 
> [ ... ]
> 
>> +	for (u8 pos = 0; pos < i3c->maxdevs; pos++) {
>> +		if (i3c->free_pos & BIT(pos))
>> +			continue;
>> +
>> +		if (!i3c->addrs[pos].is_i2c)
>> +			continue;
>> +
>> +		if (pos == i2c_pos) {
>> +			i2c_pos++;
>> +			continue;
>> +		}
>> +
>> +		/*
>> +		 * Swap the I3C device on i2c_pos slot with the I2C dev
>> +		 * on pos slot.
>> +		 */
>> +		i3c_addr = i3c->addrs[i2c_pos];
>> +		i3c_dev = i3c_addr.i3c_dev;
>> +
>> +		i2c_addr = i3c->addrs[pos];
> 
> [Severity: Critical]
> If i2c_pos points to a free slot because earlier iterations skipped free
> slots without advancing i2c_pos, won't i3c_dev be NULL?

Since, as of my code inspection, the detach could happen only though a 
re-attachment procedure, this should lead to continuous slots allocation in 
free_pos. Thus, at the point this code is executed there should be no gaps in 
free_pos, unless I'm missing something.

> 
> Furthermore, does this function need to update i3c->free_pos when swapping
> slots to ensure the bitmask stays synchronized with the array layout?

Since, as of my code inspection, the detach could happen only though a 
re-attachment procedure, this should lead to continuous slots allocation in 
free_pos. Thus, at the point this code is executed there should be no gaps in 
free_pos, swapping positions in i3c->addrs[] wouldn't need updating free_pos.

> 
>> +		i2c_dev = i2c_addr.i2c_dev;
>> +
>> +		new_i2c_data = i3c_dev_get_master_data(i3c_dev->dev->desc);
> 
> [Severity: High]
> Is the ->dev->desc dereference here safe?

At the point this code is executed the devices should have already been
properly allocated.

> Since i3c_dev is already a struct i3c_dev_desc *, the dev field might
> be NULL if the device was only partially attached or memory allocation failed,
> causing a crash. i3c_dev_get_master_data() can accept i3c_dev directly.
> 
>> +		new_i3c_data = i2c_dev_get_master_data(i2c_dev);
>> +
>> +		i3c->addrs[i2c_pos] = i3c->addrs[pos];
>> +		i3c->addrs[i2c_pos].is_i2c = true;
>> +		i3c->addrs[i2c_pos].i2c_dev = i2c_dev;
>> +
>> +		i3c->addrs[pos] = i2c_addr;
> 
> [Severity: Critical]
> Since i2c_addr was initialized to i3c->addrs[pos] above, doesn't this
> assign the entry to itself?

Indeed, this looks wrong.

> 
> This would duplicate the I2C device into both slots, destroy the original I3C
> device's dynamic address state, and cross-assign private data structures.
> Should i3c_addr be used instead?
> 
>> +		i3c->addrs[pos].is_i2c = false;
>> +		i3c->addrs[pos].i3c_dev = i3c_dev;
>> +
>> +		new_i2c_data->index = i2c_pos++;
>> +		new_i3c_data->index = pos;
>> +
>> +		i2c_dev_set_master_data(i2c_dev, new_i2c_data);
>> +		i3c_dev_set_master_data(i3c_dev, new_i3c_data);
> 
> [ ... ]
> 
>>   static int renesas_i3c_daa(struct i3c_master_controller *m)
>>   {
>>   	struct renesas_i3c *i3c = to_renesas_i3c(m);
>>   	struct renesas_i3c_cmd *cmd;
>>   	u32 olddevs, newdevs;
>>   	u8 last_addr = 0, pos;
>> +	u8 first_i3c_pos = 0;
>>   	int ret;
> 
> [ ... ]
> 
>> @@ -655,16 +732,25 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
>>   	olddevs = ~(i3c->free_pos);
>>   	i3c->internal_state = I3C_INTERNAL_STATE_CONTROLLER_ENTDAA;
>>   
>> +	if (i3c->resuming)
>> +		first_i3c_pos = renesas_i3c_group_devs_in_slots(i3c);
> 
> [Severity: High]
> Since olddevs is computed from i3c->free_pos before calling
> renesas_i3c_group_devs_in_slots(), which shuffles the array but doesn't
> update i3c->free_pos, is it possible for olddevs to be stale?

As of the current code base, the i2c slots in free_pos should be continuous
and this should not happen.

> 
> If an I2C device is relocated into an empty slot where the stale mask is 0,
> the subsequent DAA loop might fall through and overwrite the I2C device's slot
> with a new I3C dynamic address.
> 
>> +
>>   	/* Setting DATBASn registers for target devices. */
>>   	for (pos = 0; pos < i3c->maxdevs; pos++) {
> 
> [ ... ]
> 
>> @@ -689,12 +780,38 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
>>   
>>   	renesas_i3c_wait_xfer(i3c, xfer);
>>   
>> -	newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
>> -	newdevs &= ~olddevs;
>> +	newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, first_i3c_pos);
> 
> [Severity: High]
> This is a pre-existing issue, but if cmd->rx_count equals i3c->maxdevs
> (e.g., when no devices are assigned), the first argument to GENMASK becomes
> -1.
> 
> Doesn't this invoke undefined behavior via an invalid shift count in the
> GENMASK macro, returning garbage values?
> 
>> +	/* Re-attach all the I3C devices on resume. */
>> +	if (!i3c->resuming)
>> +		newdevs &= ~olddevs;
>>   
>>   	for (pos = 0; pos < i3c->maxdevs; pos++) {
>> -		if (newdevs & BIT(pos))
>> -			i3c_master_add_i3c_dev_locked(m, i3c->addrs[pos]);
>> +		if (!(newdevs & BIT(pos)))
>> +			continue;
>> +
>> +		/*
>> +		 * If the bus was fully occupied before suspend, re-attach the
>> +		 * devices and update the addresses tracked by the subsystem.
>> +		 * Without this, i3c_master_add_i3c_dev_locked() returns errors
>> +		 * due to a lack of free slots (as reported by
>> +		 * renesas_i3c_get_free_pos()), causing the attachment to fail.
>> +		 *
>> +		 * Otherwise, follow the normal
>> +		 * i3c_master_add_i3c_dev_locked() path, which will re-attach the
>> +		 * devices, keep the subsystem state and driver addresses in sync,
>> +		 * and perform all the required internal bookkeeping.
>> +		 */
>> +		if (!i3c->free_pos && i3c->resuming) {
>> +			struct i3c_dev_desc *dev = i3c->addrs[pos].i3c_dev->dev->desc;
> 
> [Severity: High]
> Is it safe to dereference i3c_dev->dev->desc here?
> 
> If dev is NULL due to partial attachment or memory allocation failure prior
> to suspend, this will cause a kernel crash.

This should not happen since at this point the devices should be properly 
attached. Moreover, using directly i3c->addrs[pos].i3c_dev doesn't
work for the case here.

> 
>> +			u8 old_dyn_addr;
>> +
>> +			old_dyn_addr = dev->info.dyn_addr;
>> +			dev->info.dyn_addr = i3c->addrs[pos].addr;
>> +
>> +			i3c_master_reattach_i3c_dev_locked(dev, old_dyn_addr);
> 
> [Severity: High]
> Does i3c_master_reattach_i3c_dev_locked() exist in the kernel?
> 
> Calling a non-existent function will result in a build failure. Additionally,
> even if this was intended to be i3c_master_reattach_i3c_dev(), that API
> sends a SETNEWDA CCC to the device's old dynamic address. Since ENTDAA just
> assigned a new dynamic address via hardware, won't the device NACK the
> command?

The API is part of the series pointed out in the cover letter of this series.

> 
> Furthermore, by bypassing i3c_master_add_i3c_dev_locked(), does this ignore
> the PID arbitration order? ENTDAA assigns addresses based on PID arbitration,
> so the device that won arbitration might not correspond to the descriptor at
> i3c->addrs[pos], breaking device isolation.
> 
>> +		} else {
>> +			i3c_master_add_i3c_dev_locked(m, i3c->addrs[pos].addr);
>> +		}
>>   	}
>>   
>>   	return 0;
> 

-- 
Thank you,
Claudiu

