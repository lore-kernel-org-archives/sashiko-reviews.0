Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781703603D3
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 04:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781757455; cv=none; b=IS84YbXVXubJVAaVSnqi959zUtglPajxFq4YhbV7vO+WRkdRWCCFyI9InzdksedsF+tL75kUjwX/jF2C1pwNvY3wWUzcdzafg29yEACe1dO6wWzThsd/oJwMR1w9sw3OmJvkU56abm6qjBkvypDPHDzaEniuru4jhhqYSXMcfk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781757455; c=relaxed/simple;
	bh=AhIGnWTgvPnkbhsaYx4ZquJucU7w0+ALRcowmTlfsfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r1WAOfxvTVZf89yfUc/LNG/nnva9gNaN6i4UjuC5XEHJ4NW7bL0KHeRlfYpfyw3w+cGl00is5OmX4AQew0LgsgB99v8gervYQ06r26Ltx90iiiVUiJQeM/njrZdik5Ie63N0Gify2N7ZZtRpeS0TFIYYTrRQxqWCGImf99ewn58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6Uop2KK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6Uop2KK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278C01F000E9;
	Thu, 18 Jun 2026 04:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781757454;
	bh=07yMhPrmy8PV9Q7BMypGeASBfIEPZIFrJRpnXYyo1ck=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=J6Uop2KK9MQHRsq8CJvQWxWAb0wpgiSHksG8/nvGeXpYBLmyfQxb8c19/fQKlxwMZ
	 ZV/1vDGTO4iOwaEGk66wybad7tSIfqQOY+4Pj3/5Xgbo0b94wigYadgHPzY/GyHIP4
	 slvOAvt9OQzXYfQpH9LmQT0LvoV4ed13qdwMcYgGFyKJDAhWwUy83hucbH0FzmZj9w
	 /oD/JoSRfad/z0QALDm7Jm8q3N3aBIh/f7c+SGQ5INPCeKemOLiNFQHpNVu5svoVtV
	 OGKoA/OksqvOq7wZzkkwK/PkFai3N1gevbMsabSlZ1U5Mvho5/rRyrrK7wY1bQsvSv
	 l4Z8TIBBdhkZw==
Message-ID: <a538baca-fc5f-43db-8d19-2b5fa8c510dc@kernel.org>
Date: Thu, 18 Jun 2026 07:37:31 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/16] i3c: renesas: Clean DATBAS register on detach
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org
References: <20260612160458.3102106-8-claudiu.beznea@kernel.org>
 <20260612162050.9CDD01F000E9@smtp.kernel.org>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20260612162050.9CDD01F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/12/26 19:20, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [Critical] `renesas_i3c_group_devs_in_slots` assumes the target swap slot is occupied by an I3C device, which crashes if the slot is free. It also fails to update the free slot bitmask.
> 
> Pre-existing issues:
> - [High] The DATBAS registers and device address trackers for unused slots are left dirty after Dynamic Address Assignment (DAA), which can cause hardware TX/RX logic issues.
> --
> 
> commit bcdea49e3d9ced6f5b774a208065f0889dbb7c12
> Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> i3c: renesas: Clean DATBAS register on detach
> 
> The controller uses DATBAS registers on TX/RX logic. Clean the DATBAS
> register for the detached I3C device to avoid issues.
> 
>> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
>> index a63edddbc9fe0..abe24e563d217 100644
>> --- a/drivers/i3c/master/renesas-i3c.c
>> +++ b/drivers/i3c/master/renesas-i3c.c
>> @@ -1042,6 +1042,8 @@ static void renesas_i3c_detach_i3c_dev(struct i3c_dev_desc *dev)
>>   	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>>   	struct renesas_i3c *i3c = to_renesas_i3c(m);
>>   
>> +	renesas_writel(i3c->regs, DATBAS(data->index), 0);
>> +
>>   	i3c_dev_set_master_data(dev, NULL);
>>   	i3c->addrs[data->index].addr = 0;
>>   	i3c->addrs[data->index].i3c_dev = NULL;
> 
> [Severity: Critical]
> Since we are allowing I3C devices to be detached and free their slots here,
> will this cause a null pointer dereference in
> renesas_i3c_group_devs_in_slots() during resume?

We are allowing detaching when the bus is cleaned up and on re-attaching.

In case the bus is cleaned up, all the devices on the bus are detached.

On re-attaching, I considered that will happen as a result of a previously 
detach operation which will free a slot, but looking again at the code, all the 
detach and re-attach logic are under different conditions. I will re-consider 
and update it accordingly.

Thank you,
Claudiu
