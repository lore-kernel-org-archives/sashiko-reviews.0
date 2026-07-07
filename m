Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCF830100E
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 11:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783425470; cv=none; b=SPSKVx2DaXoaigBfpP2aDVPGY1eFoIBcWfRAkQRQmAvo//pJaIyQ//4pcmGtLOJ6E5KXze67u8GhOK5VbeW5tNV/RZs9ox7+sm52oqH75zu4e14LUKgWdcA1IgPtWdmq9xZ+lilOKr+cM17ulh0SDzKBuKG9Hf5rJqfqtiwjU5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783425470; c=relaxed/simple;
	bh=VHqBskF2miGoUSyz6zaznqC2MdqsOv4v1qlhwctNtPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SPI1wHiLyaAtz9CiEVWMQo4nxIT2mMsfMX1resFH3iG+1FKnRlctFuHVipgo0AZrtao7raycysy0NpDpL6LcimoMlrY2AGwU+A3vdUqtvQXUMIYdDQt0YV9xIkhTfP78KvpzYtHoQ+1l472mVJbkmRqBQMTxAgQKrgIEEwzGdOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Io6doRaB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Io6doRaB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783425467;
	bh=VHqBskF2miGoUSyz6zaznqC2MdqsOv4v1qlhwctNtPo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Io6doRaBd4/RS/BSjrvq7JNNdKHDBS+5wUEC+wsfq2bTXkc2XoHWEtQFiHGGEKg+c
	 IRQhsn7R347oNbs3KTnzCPBfDICxxZ6+HIQCiJ53pCE26gg/vAaI3zeUVIyvbpT+bV
	 /z1wZCwcE9QmC3etLoDPJCAUHM3DBxCYXrWaC2VRxQiU0Nndtif7iIRKbSn+sx4pGb
	 Gs25diGcV9i/HpW4dKssaz3mwjYswEkRMOBhpLQApoeQvmy2TdIOXPVjH4pT2YG83r
	 tRDt1lN9Cs7J/mOQJoy+x2h3yOCA2P9RWeqvu6U6m4G/sRVw3xgpYCeQL1TyBI0x5a
	 z4jUJtRKTKxBw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B5EC817E013E;
	Tue, 07 Jul 2026 13:57:46 +0200 (CEST)
Message-ID: <ee5961a8-cc2d-4dbc-a668-3e007f7cd2fa@collabora.com>
Date: Tue, 7 Jul 2026 13:57:46 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 06/12] spmi: Add helper to get a parent SPMI device
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, vkoul@kernel.org,
 linux-phy@lists.infradead.org
References: <20260707111829.180158-1-angelogioacchino.delregno@collabora.com>
 <20260707111829.180158-7-angelogioacchino.delregno@collabora.com>
 <20260707112756.DEAAB1F000E9@smtp.kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260707112756.DEAAB1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/7/26 13:27, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Time-of-check to time-of-use (TOCTOU) race on `dev->parent` can lead to a NULL pointer dereference.
> --
> 
> --- Patch [6]: [PATCH v12 06/12] spmi: Add helper to get a parent SPMI device ---
> commit fb3218d6b528eabdc83ac90ed869685f4b9bd99e
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> spmi: Add helper to get a parent SPMI device
> 
> This commit adds a new helper function spmi_get_parent_spmi_device()
> which takes a struct device and returns a pointer to its parent SPMI
> device if one exists, without modifying the reference count.
> 
>> diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
>> index e218c81405458..a0a6ea9b1d2db 100644
>> --- a/drivers/spmi/spmi.c
>> +++ b/drivers/spmi/spmi.c
> 
> [ ... ]
> 
>> @@ -433,6 +433,29 @@ struct spmi_device *spmi_find_device_by_of_node(struct device_node *np)
>>   }
>>   EXPORT_SYMBOL_GPL(spmi_find_device_by_of_node);
>>   
>> +/**
>> + * spmi_get_parent_spmi_device() - get the parent SPMI device from current dev
>> + * @dev:        pointer to a subdevice on SPMI bus
>> + *
>> + * Checks if the passed device is a child of an SPMI device and returns a
>> + * handle to the parent SPMI device without incrementing any refcount.
>> + *
>> + * Return: Handle to the parent SPMI device or NULL
>> + */
>> +struct spmi_device *spmi_get_parent_spmi_device(struct device *dev)
>> +{
>> +	struct device *parent;
>> +
>> +	if (dev && dev->parent) {
>> +		parent = dev->parent;
>> +
>> +		if (parent->type == &spmi_dev_type)
> 
> [Severity: High]
> Can a concurrent device topology change (like device_move()) cause a NULL
> pointer dereference here?
> 

That's not happening.

> If dev->parent is modified to NULL between the check in the if condition
> and the assignment to the local parent variable, parent will become NULL
> and this parent->type check will panic.
> 
> Since the compiler is permitted to emit two separate memory loads for
> dev->parent in this sequence, would it be safer to read it exactly once
> into the local variable before checking its validity?
> 

Yes, but it's overcautious, and purely a nitpick. Not severe at all, and I'm not
fixing that as it's still safe.
