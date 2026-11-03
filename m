Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.135.140.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724977;
	b=DQXuizibhctzPQ4Phe4o3ercdYZMeqxMH2J12oOypBOEUirvfOsHC10u5pCjhKAaQugQ
	 KJNEM/6B5t8UfUjgOSLjlkfz3879rH5J1pGmn9gYJOIcRSYnGKTEGsTVoIYKXqzkDO/cE
	 sUOoyG6xT39VMh1QI4UaEuxY67vS4TmKzH/3TWIfbj4cUeyvzyL3/yR8/7X+vPDQoETr9
	 IjpZNb8Ijli2B5wp5s50TOdbMYS6iM/k8eMf7QroqKLNDOVyfEkT8zZEChHFuKJAfqczy
	 TuVmY8ruD9qo34GPpHLFNgjuW7C+C/QtIFweDZ94EZ/VnAUw57X86D/Xm8v/tyiXArQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724977;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=TTj64Sa8S+aVgR4NPp05Dm2kql2/bkp1UbfdcQ1rzyc=;
	b=2nGp6tv58286AbvQ6UP7hq6DhClTpPlWMQP3Ezo59v4Wn1O1r4B7imvxElTOMLBiqx6j
	 rO45MTvcvWfG+JbScuHh/kZ9wY09wkiyexk8htnqRulh5Ivwqcoev1NTm1RR0gNTXEOic
	 7dXYg4G3q7TBJ83xES8LOn7br02piNCQ2+q5uBpx7LTiokv7dpYr7Ay0oGnrqcC0ul9pl
	 3GWSuCkOmbUKA16MTZ6YiYmaUzE8bHAlH6HZZ+V1qCHXfKs50+2kHBqJQXAkwuItsEkZc
	 mGgkEfDoHwcrDzCTNdChjP1J7BYA/4J5zMCyxJSn5jegzWLa+l7zwTMkPeemZ5juzEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cjdns.fr;
	spf=none smtp.mailfrom=cjdns.fr;
	dkim=pass header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b="N3pPM/WS";
	arc=none smtp.remote-ip=5.135.140.105
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D1F606A329
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 16:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68D1F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=N3pPM/WS
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55A67280640;
	Tue,  3 Nov 2026 17:56:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793724974; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=TTj64Sa8S+aVgR4NPp05Dm2kql2/bkp1UbfdcQ1rzyc=;
	b=N3pPM/WSMCFQ+E9+29JzKGJaiIFwXzoEI7o21wauDcfH3xKDXEj5ex0OHr6nt51C27k/am
	qEltz2sAezRV2BW43PAEGuQxlZ1olfjBw2jM22gS+U5LhEeKR37+IUCeFQQPvMmEq2u9GT
	aTzRUVhAzBulr9vB8KrrgWr/jEDvaMUZLu7RYpRe3Bv8HbHzUJxCcXxfBQZzu7d7oqos7+
	cbpRav+JDW12nf1acPgLbcCjQB0QBhhiR2785qWixiTsfxA4vZwFsNfbxaa/mkQx4RW15d
	WGE58pdtSg1PMA9tmfkH2/TRCxipgraYJCWXmP3aqkXBQnpkEWnJT7FplsqaCg==
Message-ID: <492da787-471d-4923-b6ad-6f6cb113b19e@cjdns.fr>
Date: Tue, 3 Nov 2026 17:56:11 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 4/7] net: dsa: mediatek: support PLL setup on MMIO
 MT7530
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261029184202.1859843-1-cjd@cjdns.fr>
 <20261029184202.1859843-5-cjd@cjdns.fr> <sashiko-outbox-191439@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <sashiko-outbox-191439@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 30/10/2026 20:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] net: dsa: mt7530: missing child_bus mdio_lock in core_write() and core_rmw()
> --
>
> commit 3f6621fc167b9cbb00feef9399db3022a584cb8e
> Author: Caleb James DeLisle <cjd@cjdns.fr>
>
> net: dsa: mediatek: support PLL setup on MMIO MT7530
>
> This commit records the switch's internal MDIO bus in priv->child_bus during
> mt7530_setup_mdio() and updates core_write() and core_rmw() to fall back to
> priv->child_bus when priv->bus is NULL so MMIO MT7530 instances can perform
> PLL and core register configuration via the internal PHY MDIO bus.
>
>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
>> index c5b3b00acb956..d45388e2efc83 100644
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -77,6 +77,12 @@ core_write(struct mt7530_priv *priv, u32 reg, u32 val)
>>   	struct mii_bus *bus = priv->bus;
>>   	int ret;
>>   
>> +	if (!bus)
>> +		bus = priv->child_bus;
>> +
>> +	if (WARN_ON_ONCE(!bus))
>> +		return;
>> +
>>   	mt7530_mutex_lock(priv);
>>   
>>   	/* Write the desired MMD Devad */
>> @@ -112,6 +118,12 @@ core_rmw(struct mt7530_priv *priv, u32 reg, u32 mask, u32 set)
>>   	u32 val;
>>   	int ret;
>>   
>> +	if (!bus)
>> +		bus = priv->child_bus;
>> +
>> +	if (WARN_ON_ONCE(!bus))
>> +		return;
>> +
>>   	mt7530_mutex_lock(priv);
>>   
>>   	/* Write the desired MMD Devad */
> [Severity: Medium]
> When priv->bus is NULL and core_write() or core_rmw() falls back to
> priv->child_bus, does mt7530_mutex_lock() leave bus->mdio_lock unlocked?
>
> Looking at mt7530_mutex_lock() and mt7530_mutex_unlock() in
> drivers/net/dsa/mt7530.c:
>
> static void
> mt7530_mutex_lock(struct mt7530_priv *priv)
> {
> 	if (priv->bus)
> 		mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
> }
>
> static void
> mt7530_mutex_unlock(struct mt7530_priv *priv)
> {
> 	if (priv->bus)
> 		mutex_unlock(&priv->bus->mdio_lock);
> }
>
> On MMIO switches where priv->bus is NULL, mt7530_mutex_lock() becomes a
> no-op. However, core_write() and core_rmw() perform multi-step Clause 22
> MMD indirect sequences across MII_MMD_CTRL and MII_MMD_DATA using raw
> bus->write() and bus->read() calls.
>
> Even though the underlying indirect PHY accessors acquire priv->reg_mutex for
> each individual Clause 22 register transfer, priv->reg_mutex is released
> between each step of the MII_MMD_CTRL and MII_MMD_DATA sequence. Once
> mt7530_setup_mdio() registers priv->child_bus, runtime callers such as
> mt753x_phylink_mac_config() -> mt7530_mac_config() -> mt7530_setup_port6()
> call core_clear(), core_write(), and core_set() (which use core_rmw() and
> core_write()). Could concurrent phylib or MDIO accesses on priv->child_bus
> (which serialize on priv->child_bus->mdio_lock) interleave between those
> steps and corrupt the MMD register accesses?


This is potentially a problem, but it can't be solved by locking 
priv->child_bus because that will cause re-entrant deadlock. I think the 
bulk of core_write() could be replaced by phy_write_mmd() and 
mt7530_mutex_lock() could be dropped entirely, but this is a bit of 
re-architecting that I'm not entirely comfortable with and I think it's 
probably better to leave it as it is for now.


Thanks,

Caleb


