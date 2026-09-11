Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D4A4AA03B
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 18:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789151027; cv=none; b=W+MQqdFrSc5TQnu6T+3KYeG46Iklggjtww4QefvszlbgR9Lf0Mr6gHEfo0EwNeRfPAUYbUoFp6sMcyt5A2tcaxMvCdP7uEBnsx4st7/WgXFLUewkdl7AIX5az1jFjEQ7m7MEgrKxfDRwM7+01PqjZVyXG05tBvDqhhOng2PmlqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789151027; c=relaxed/simple;
	bh=t9sKMRRjDqxGoI/aJaM3grAkope3a5qNAlhaMqbaCjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+baCtMP99YvE+gEcUgTi1JqmywMpmPf559j3Adi5+UEyf06erW69Ww25xEe5C1gTn6BVkmBKljFPqHuIMGpssI3Lua6fu36iFLL/IX1q/957qL86oGVI7kRhhEfDB8TQ64bjc54SOKxqOawgo10W+8IcsIK7mH0cP0dyA3e1uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net; spf=pass smtp.mailfrom=marmottus.net; dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b=QOIDenjU; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marmottus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b="QOIDenjU"
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 58BC758061C
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 15:40:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D26D3ED02;
	Fri, 11 Sep 2026 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marmottus.net;
	s=gm1; t=1789141205; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=9MpJxesw2FKMypBfu37DOMeS/Iu3EQNryRDxRYkkcQk=;
	b=QOIDenjUzJ+6sMiD6PXCvUP4AVs9m+p9tjM9ZRmd1LCzAkaLGhA0VFKfRRTsykdzuBuuZy
	yf96AffXQG2xxyQp0tMciAXQMz/kpx5heU2HXgHiBRKnGKaxRJ4MqZ1urYmRpsGEHZv37h
	ByjkxYgCHv+Ig1FgjsOeWHGglKwUQiNhyU5H+BnhQr7z3/jauX9RgF1D214T+kZNb2TB98
	sq64bSKbym9Lc9AkL6jAwlGztXp6v0Xsh/XlZoL79MsDslbP2VXd7BLZw25SL5Fq7/uS6d
	7KjgJfw1TP3E+9fwvfeKfsfOEi7PYnpM40RvbM6vLrOi7jfc7YBqFILPI/VaeQ==
Date: Fri, 11 Sep 2026 17:40:02 +0200
From: Arthur Crepin Leblond <arthur@marmottus.net>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH net-next v7 3/3] w5100: detect carrier state using link
 status bit and optional interrupt
Message-ID: <20260911154002.GC9585@marmottus.net>
Reply-To: arthur@marmottus.net
References: <20260904-wiznet-link-gpio-v7-0-69f01b70c96f@marmottus.net>
 <20260904-wiznet-link-gpio-v7-3-69f01b70c96f@marmottus.net>
 <20260905123629.8D1171F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260905123629.8D1171F00A3E@smtp.kernel.org>
X-GND-Sasl: arthur@marmottus.net
X-GND-Score: 0
X-GND-Cause: dmFkZTEOq5nabONhUnnntLvjpRJhr7ZEkEWti6S7JHIwV7/gHHq0qksJJCxOtfP0riAUt6e2ggh1H4vOgldPOcOyPJ288x4Kr2ZcjWgLNgpLEMjbpa//lruoGGS4Uj6riO01xqf35zK80CMffHd8LlbOFp8lMxrh1H3/rUv96HJasW2INHxcH8n5ZZsit51qPOui3jrzn1yD+a4t3xiBfthmp/YAHCqvI5HJqAxwuHqAoUG0X16iTuFha6zZmcXAD7UgIn4NE31tFNGnn3McJRUpVy9yLPU4ZLOSJz1iEVAVBFF9PFh8YM2llwIIamP3zW55EHGDGx6vpaAKLzxnyaIYnWOxSo1mX+Yzj8IzbK5S2EsYJ3IzKU3ZEYxkrMKU9X+BAjAnGrP1gx5Bhvmz7Rl+ERSNp4XYCtEIPs9FKL+mTrYq9pL/LRe6D8wkaU5dn92Y3Y4BcvvlIe8lFErXGdX9gZh9N3xmc7CUeKJc4npQ1zkruZ0i5R8kpGpx/0ovQjp5Oy3zD1ZPBTZBvGFL9h4pZU8hqU5mFajAgeH7p/PLUq8FmFEuZfz7c48ZAdi4YFNeo48NaNaQ2xX+hfuC/RlJlDJCU12RL3cCZoFRAxfkIAIu+5391/HlixajXnHp4tgQUMfyyCKKO2qG5O/YychTsLGns68zGylOXulNZtdTviWP1g
X-GND-State: clean

On Sat, Sep 05, 2026 at 12:36:29PM +0000, sashiko-bot@kernel.org wrote:
>> @@ -659,6 +711,15 @@ static int w5100_open(struct net_device *ndev)
>>  	w5100_hw_start(priv);
>>  	napi_enable(&priv->napi);
>>  	netif_start_queue(ndev);
>> +
>> +	if (priv->link_irq >= 0)
>> +		enable_irq(priv->link_irq);
>> +
>> +	if (w5100_get_link(ndev))
>> +		netif_carrier_on(ndev);
>
>[Severity: Medium]
>Could this introduce a race condition where a stale link state overwrites
>a newer one? If the physical link state changes exactly after
>w5100_get_link() reads the hardware register but before this thread
>evaluates the result, the newly unmasked edge-triggered interrupt handler
>might run first. The handler would read the new state and update the carrier,
>but then the main thread would resume and apply its stale read, overwriting
>the correct state. Since the interrupt is edge-triggered, no further
>interrupts would correct this until the link changes again.

Yes, I'll bring a mutex/lock to the next patch.

>
>> +	else
>> +		netif_carrier_off(ndev);
>
>[Severity: High]
>Does this leave the interface permanently stuck without carrier if the
>link_irq is not provided? If the interface is brought up while the cable is
>disconnected, this explicitly calls netif_carrier_off(). Without the optional
>interrupt (which is the case for most legacy device trees), there appears
>to be no polling mechanism to ever turn the carrier back on when a cable is
>subsequently plugged in.

I think the best here imho would be to just keep the original behavior
if there is no link irq set and to not touch netif_carrier_on/off at
all.

w5100/w5200 -> no .get_link, no netif_carrier
w5500 -> .get_link but netif_carrier only if link irq is set

Arthur
