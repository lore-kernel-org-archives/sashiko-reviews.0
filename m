Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505548;
	b=3RTwu7Jm9mH+fc3ELdnEwumoYmoYh67Ct2CsCOHhUgEz7XlmlEONL2U++W8v1Y0VkXr3
	 PWKP6GKim9GT2pdnOI7UwwDZjaE5ssv/ZUhE19Y1vXpFe7TGnaJK+f7cOLGj0KNxT6qJd
	 oUN4Iy8z8h/IVHoxvXPj9wqh+cz4U2W9L4K1s1GqPRQnR/Lz75EWRzymLO2uAPvr4P4dy
	 i5VAdzrUszQHKFSqjZwsH94cIAmMa7LguTdhAmhNf2p3PvZ3p6CsFnuJ7Tv3YguTeOTwC
	 2arePq42Uos0UMKqAnjUn8gLS2sSP1w4Ch1XDPskvV7KulDMQIc5D62QtXIjCztE3gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=czdhaGFv7cIrx8yTbMDRh9Bkh0lnaUBxN3R0u1dkKDY=;
	b=bKnJxraImjgkBC/kY0LcXYn7eXTIRFRiJcth/cnW4JuQzcPT319nY/NcRNSmcBEX3OuJ
	 dsxDnDrkvKLsP08wSEgV51S+s+ACj15Dir2cME5OpGAX0QAdMsTKGJJ1AnnpjbItaGo9o
	 gfYFw/dUGEXDKmHg3/lxtcLjx9CmS/X6VmXHhy7x/czFf7PVq4kYqfOD7NzTDx2EH6ome
	 2iK0PzX6tb2wlKofERGB9pJas71rcFZU/dTURJL+jnYNgY/7Mt5D0LlTqBZQlMWMFE40M
	 HXu/uvHpu2xiA89YzGW6fwFOGuUBwbHOoyR5dV6kiB2YGxSoF+a3eM8FqerfhxKqY7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bDsM1Kng;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E47606A323
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 17:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E47606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bDsM1Kng
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so2671981c88.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 09:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794505547; x=1795110347; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czdhaGFv7cIrx8yTbMDRh9Bkh0lnaUBxN3R0u1dkKDY=;
        b=bDsM1KngE01npSdCPuGYMvmavk5Pod9SQSnU12ZCoj+gC30dRhwlVElS+BC516X3E8
         G/vCfL3gpUOHGvkcWtnTq48Svkr3XeYX7JRV2Mh2S/obQ6y2ItYW/sZTuGQXGXuEqa+K
         5RPs6mMnS6cUZV0mn6Dr2AxNmjDYtDHeBoHSM4GI4u8kH3iMyVj1i8ejoi3LLrzBVhVP
         7+lBskuhozli0A134M9f4cNhbzho7m8Oaj6QTxz6bL1wSNSy8zT9wlbdcojQPaH6oBgb
         avH5gnWarSiNrdJq1aVEyL0u3npFDovGeCVUpS2nFSf01kA7I6DfiMYolGRDpo3KQd/7
         +HcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794505547; x=1795110347;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czdhaGFv7cIrx8yTbMDRh9Bkh0lnaUBxN3R0u1dkKDY=;
        b=d3HE0oMKwxRpuRMtN3h/ZZNryOIMr6ZJloSKgvdlEHaq0CWPcv4vY3M/Z6Nzw5JTjJ
         LemstfNJn+vzi6mnu1taZvQNMiEigjvP7UhYGXTAZod7jD7DhtV6bus2XO2nXZMgrASw
         hdRkKw11AzXm+r7sT6fJa2Lm6SzAhBJmrri3L/Cy58j70NyPLNI00YrAsgTWOHF4HpZz
         g0dBFknqsA9D8O5/xpeO9KCXcRZLqvQ08bLeZid2I7EPevoxowlUSzpYtVF2PVsjAp0y
         RFFNMRZKx99r6ohGTNlfY5vUTeu1rdA3Dz7wg1XCRQjOprVq0xfj9T1PQWpHvR+ssMlr
         VxWA==
X-Gm-Message-State: APuU4Z/8q6V+OJwAHkNEQ4TusjvDBujXZlNSoAk8K1pZ2dKcLEEFiXJg
	adN/pCjaPUISrdppCvKQnoHcj3Zyx8JxRagkqux2CHtQnfKievJ++ZhFbFUc7w==
X-Gm-Gg: AYBFou3uN4zXXoXoAQPBzaMggU0ywXvaC/oHUMjrKQiecsge4x6fIracKLt9SzqE9xq
	uzByopG3Ggq13MNbD5jva3QrgboEI08zViOj8WjOagbZn1iWc3emv4P4YmcUL2dDQOAdIcg673R
	GrRZCuo9j2vCB5ipytLJ2LrSPOjDi28pESyt9kkF4sL4XDGIZwxXi/QSU4K2RVY0EhW4YN6xvG0
	TiTUiM7bfcK5+W1d9mvT4Wd9ic683gUm6SnFqzKyuTJ524gKb3Lp7O8Tr5xVVroSIqkoPqaizxJ
	l/th6BKxmoNPp5Suhetbft7V+thVJl+OID0qlFzhG3hMfe1eT108oc44/oU9UY4r0mCwRMm/mZQ
	Nvupk4Ip1iPi+Whrjs8BN7jehMAtlPKUZ1Lbperly0ukCIFMn84eM1G9GH4kDCpvT1LFiVex76U
	/UXb8Or+DM4aIGrG03CXIwkDVccNOJCmdo/98sFxav0nuFvyZlF3TOxA2cCr6nM3f2P2vwGGLKD
	uVt1IIYwmZojPeRlyuFNO9YWLlencWBRWLf90amNKlMlHs2ULn/vB6gfeNP6O9a4Q69QktRfDTN
	IKiHKP+eZJyo4VI6nF63b3T0KohWFdZYLvGFFGnN6RXkXqe1csm2Rb+q+fVW8PhuUYQTPWbmxxO
	EyIXgUo7vmlV8YDkebb3IV587dmSAVQ7E5W4TFQ==
X-Received: by 2002:a05:7300:23d2:b0:36e:800a:71fe with SMTP id 5a478bee46e88-37683861491mr6399782eec.1.1794505546344;
        Thu, 12 Nov 2026 09:45:46 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1151:15:c24:4ad9:f660:1904? ([2620:10d:c090:500::6:db98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm59005eec.26.2026.11.12.09.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 09:45:45 -0800 (PST)
Message-ID: <b1df2930-2bb5-484d-b134-de842762ce89@gmail.com>
Date: Thu, 12 Nov 2026 09:45:44 -0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4] net/mlx5e: advertise tcp-data-split support
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org
References: <20261111170558.1654691-1-dimitri.daskalakis1@gmail.com>
 <sashiko-outbox-211565@kernel.org>
Content-Language: en-US
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
In-Reply-To: <sashiko-outbox-211565@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/12/26 9:06 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] net/mlx5e: missing HW-GRO cap check in
>   mlx5e_ethtool_set_tcp_data_split()
> - [Low] net/mlx5e: missing Fixes trailer for commit 46bcce5dfd33
> --
> 
> commit 10e87fc2f39f7859cabd43f8c342a731e4043353
> Author: Dimitri Daskalakis <daskald@meta.com>
> 
>> net/mlx5e: advertise tcp-data-split support
>>
>> Since commit 46bcce5dfd33 ("net/mlx5e: Support ethtool tcp-data-split
>> settings"), mlx5 no longer reports tcp-data-split from
>> mlx5e_ethtool_get_ringparam() and the reply carries only the stored
>> config. With the default config (auto) the attribute is omitted, so the
>> device looks like it does not support tcp-data-split, even while HW-GRO
>> is on and SHAMPO is splitting headers.
>>
>> On mlx5, header-data split is performed by SHAMPO, which is used only
>> when HW-GRO is enabled. The driver already keeps HW-GRO on while
>> tcp-data-split is enabled, but nothing enforces the other direction.
>> A user can disable tcp-data-split and then enable rx-gro-hw, leaving
>> the device splitting while the config says it is off.
>>
>> To make the feature handling consistent, report tcp-data-split as on
>> when SHAMPO is active and off otherwise. Only allow disabling
>> tcp-data-split while HW-GRO is off, and keep HW-GRO off in
>> mlx5e_fix_features() when tcp-data-split is already disabled.
>>
>> Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
> 
> [Severity: Low]
> As reported by Björn Töpel on v3 [1], should this include a Fixes tag for
> stable backports:
> 
>   Fixes: 46bcce5dfd33 ("net/mlx5e: Support ethtool tcp-data-split settings")
> 

The fix was for updating netdev features after a successful ring param
change. That was sent here [1].

As for the rest of this patch, it's more of a user behavior change than a
fix. The HW splitting capability still works when GRO is enabled, it's just
reporting to the stack/user that gets corrected.

[1]
https://lore.kernel.org/all/20261017005401.1582755-1-dimitri.daskalakis1@gmail.com/

>> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c b/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c
>> index 1f534051cdfe4..8e7c748caf2d2 100644
>> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c
>> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c
>> @@ -388,6 +388,13 @@ static void mlx5e_get_ringparam(struct net_device *dev,
>>  	struct mlx5e_priv *priv = netdev_priv(dev);
>>  
>>  	mlx5e_ethtool_get_ringparam(priv, param, kernel_param);
>> +
>> +	if (dev->hw_features & NETIF_F_GRO_HW)
>> +		kernel_param->tcp_data_split =
>> +			priv->channels.params.packet_merge.type ==
>> +			MLX5E_PACKET_MERGE_SHAMPO ?
>> +			ETHTOOL_TCP_DATA_SPLIT_ENABLED :
>> +			ETHTOOL_TCP_DATA_SPLIT_DISABLED;
>>  }
>>  
>>  static bool mlx5e_ethtool_set_tcp_data_split(struct mlx5e_priv *priv,
>> @@ -399,7 +406,14 @@ static bool mlx5e_ethtool_set_tcp_data_split(struct mlx5e_priv *priv,
>>  	if (tcp_data_split == ETHTOOL_TCP_DATA_SPLIT_ENABLED &&
>>  	    !(dev->features & NETIF_F_GRO_HW)) {
>>  		NL_SET_ERR_MSG_MOD(extack,
>> -				   "TCP-data-split is not supported when GRO HW is disabled");
>> +				   "TCP-data-split can not be enabled without HW-GRO, set it to 'auto' and enable HW-GRO first");
>> +		return false;
>> +	}
>> +
>> +	if (tcp_data_split == ETHTOOL_TCP_DATA_SPLIT_DISABLED &&
>> +	    dev->features & NETIF_F_GRO_HW) {
>> +		NL_SET_ERR_MSG_MOD(extack,
>> +				   "TCP-data-split can not be disabled while HW-GRO is on, set it to 'auto' and disable HW-GRO first");
>>  		return false;
>>  	}
> 
> [Severity: Medium]
> Does mlx5e_ethtool_set_tcp_data_split() allow setting
> ETHTOOL_TCP_DATA_SPLIT_DISABLED on devices that do not support
> NETIF_F_GRO_HW?
> 
> On hardware without SHAMPO support, dev->features & NETIF_F_GRO_HW is
> always 0, so requesting ETHTOOL_TCP_DATA_SPLIT_DISABLED succeeds and saves
> that value in dev->cfg->hds_config.  Because rings_prepare_data() copies
> dev->cfg->hds_config into kernel_ringparam.tcp_data_split before calling
> mlx5e_get_ringparam(), and mlx5e_get_ringparam() leaves tcp_data_split
> untouched when NETIF_F_GRO_HW is not in dev->hw_features, subsequent
> ETHTOOL_MSG_RINGS_GET queries will report tcp-data-split as supported and
> disabled on unsupported hardware.  Requesting ETHTOOL_TCP_DATA_SPLIT_ENABLED
> on such devices also returns an extack telling the user to enable HW-GRO
> first when the device cannot support it.
> 
> Rejecting non-ETHTOOL_TCP_DATA_SPLIT_UNKNOWN values in
> mlx5e_ethtool_set_tcp_data_split() when !(dev->hw_features & NETIF_F_GRO_HW)
> would prevent this.
>

I don't think it's worth the extra code. Presumably these devices cannot
split anyway, so it's fine for a user to disable the feature.

> [1] https://lore.kernel.org/r/87a4ons7dd.fsf@all.your.base.are.belong.to.us
> 

