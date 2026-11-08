Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175594;
	b=j+NdBOvYVJKS7P4qrj9Q15ZrY75Iz0ysHyUqErIZpvuSAGzivRx5AWN2aC+EGDu3zFoA
	 gcUuwpvhw2bpG/VGjY6US2RfoyHem8dgw2BFUDiJCnvimdkon2roV01fDvrSGT1ldRV3/
	 ebKP/0iUxDKrNlhr0ucjVTla49DfbeN8sx3G8HR3WUeB6VjShvj/mBlImS7VxBKaZgFxT
	 VEXSvQOTggorTE/7B9fYd2FFcj1RIgNAULI+jl3ye+EhfcIiiE0FNK98HgMt+ToLxlBtz
	 3SSsHUDwbySijkkTJWPKGiebiF9rrvexNASh0MM7zp1aKBIey9ZsLLrLPSPS0/8xQDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175594;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=v+T181MDNN1iBq6H0VhIHrJPTEvbTgHtlnvga6WuJCQ=;
	b=VVTenPh+mqrS3X+kTxa6ut3Be4X21RQwaGnMDdORt27kcTzeEPpHeOsKFa9pIC7CDDRd
	 ie88RKwPDOHiaeYPLGw2sZH+FUpV+b2yza58sil59mm6nYGRUx10xU2EDmUQFCVkuQ91Y
	 z3HrqFtH1Y0AfLp3rl7eX1AsPx4TBZN0Emxw7/9ya/ffd025s/xaKbBz39MCdBVgcVkFD
	 bywZnSce9hs1ZHowpz3q7dtg0nVgVouXL418Kcr4bycwiIf+SMhSaMjvKD7NUp2b0VKyF
	 5euJFJRBAiDIJPjTUBzhn4rSgr0fdLDmq3SHnrYcdO4h5gLXjaO5lc5vgpfRsuRnyPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=ozDL2LBz;
	arc=none smtp.remote-ip=95.215.58.102
Received: from mta1.migadu.com (out-102.mta1.migadu.com [95.215.58.102])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93C6606A320
	for <sashiko-reviews@lists.linux.dev>; Sun,  8 Nov 2026 22:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C93C6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=ozDL2LBz
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=TPWjkjB/iqSgnkr/uZ6p6HisufPl8VRbziOoj8jL4Gs=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794175584; v=1; x=1794780384;
 b=ozDL2LBzOriRh6D6RtfqId41lW/ekQy8JFVHizOS89KTFMDc6jhfXLqgGqSzz8WZxx52ea3V
 s9eb6ocXlo0S5WBXpkDt7ew9qKxRqPH0OXyeAZvKMhguRmd8Vckcc3fVwCXZBF1oKmKJrVQHZ7j
 uH/UAADSJp8TmwgTb8CVi3rFpX4crL/pKwtaDXNUWIhJn2zpuBYHj/cpPSJDWpPnzCnHXmGdWno
 d/OjhkCU9orFrBdYu1d1cJqcbwECE/k/cMuibSCQf7llRYK5kUN6/bZ6aiLgSNxRnt+BZaXnxZ7
 hpGFtfw5JeRcrPB8J84DyPDO5Qr30q0InJlZe5hE7/Ssw==
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id cb3952d11ac63f6b;
	Sun, 08 Nov 2026 22:06:24 +0000
X-Mizu-Trace-ID: cb3952d11ac63f6b
X-Migadu-Flow: FLOW_OUT
Message-ID: <df867081-9681-4b68-bcfd-9f7657942942@postmarketos.org>
Date: Sun, 8 Nov 2026 15:06:22 -0700
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
Subject: Re: [PATCH v4 4/4] leds: aw2013: Move assignment of chip->num_leds
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, lee@kernel.org
References: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
 <20261108-aw2013-aw20xx-rename-v4-4-826529beeb52@postmarketos.org>
 <sashiko-outbox-204102@kernel.org>
Content-Language: en-US
From: Paul Sajna <sajattack@postmarketos.org>
Autocrypt: addr=sajattack@postmarketos.org; keydata=
 xjMEaVNevhYJKwYBBAHaRw8BAQdAjvGGprvrSn/CmlA1Bpjc4S5zJBNSz/6q0AESlS2JbdjN
 J1BhdWwgU2FqbmEgPHNhamF0dGFja0Bwb3N0bWFya2V0b3Mub3JnPsKZBBMWCgBBFiEEv1E8
 AP7J5F2dJQd4hycszAKyDbsFAmmt6twCGwMFCQlmAYAFCwkIBwICIgIGFQoJCAsCBBYCAwEC
 HgcCF4AACgkQhycszAKyDbv25QD9EdvXYqdH6vGQvB5HrUnMOsd37AZkKKgK87kMOXL/5tcA
 /jM3VLcq9mol+GstmBm1itIVAblXcm+H8g/wKoPXq/4LzjgEaVNevhIKKwYBBAGXVQEFAQEH
 QEgCn8S+S7t/3QvXt4dK4572qd+iTl7h4JX1FEV5XUs6AwEIB8J+BBgWCgAmFiEEv1E8AP7J
 5F2dJQd4hycszAKyDbsFAmlTXr4CGwwFCQlmAYAACgkQhycszAKyDbueJAD+IMjk8ztbONXz
 H7fieZc5LoR+6mHnddccacmQyPcGAvsA/0+5SkHEgIBuKwkzwrmKgDqcLhVuEs2f1H2GxKUX jqQI
In-Reply-To: <sashiko-outbox-204102@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-08 3:00 p.m., sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] leds: aw2013: commit message rationale does not match driver
>    locking or code
> --
> 
> commit 1ce6b90ecf6b0a7b5d8097b414e8e137a3fe0609
> Author: Paul Sajna <sajattack@postmarketos.org>
> 
>> leds: aw2013: Move assignment of chip->num_leds
>>
>> devm_led_classdev_register_ext() executes default triggers
>> synchronously, which call aw20xx_brightness_set().
>> aw20xx_chip_in_use() silently returns false, skipping chip enablement and
>> causing unbalanced regulator disables while probe is still running.
>>
>> Increment chip->num_leds inside the loop, so that each call gets the
>> correct value for it's default trigger.
>>
>> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> 
> [Severity: Medium]
> Does this commit message match the locking and execution flow in
> leds-aw2013?
> 
> aw2013_probe_dt() sets brightness_set_blocking to aw2013_brightness_set()
> and leaves brightness_set NULL, so default triggers activated during
> devm_led_classdev_register_ext() queue set_brightness_work instead of
> calling aw2013_brightness_set() synchronously.
> 
> Furthermore, aw2013_probe() holds chip->mutex across aw2013_probe_dt(), and
> aw2013_brightness_set() locks chip->mutex before calling
> aw2013_chip_in_use().  Any queued work therefore waits until
> aw2013_probe_dt() has finished and chip->num_leds is already set.
> 
> Also, aw2013_chip_disable() returns early when !chip->enabled, preventing
> an unbalanced regulator_bulk_disable() if aw2013_chip_enable() was skipped,
> and the driver functions are named aw2013_brightness_set() and
> aw2013_chip_in_use() rather than aw20xx_*.
> 

The robot is internally inconsistent and incoherent.
Feel free to drop this patch if you don't find it necessary.
See the robot's prior review here:
https://lore.kernel.org/linux-leds/20260908000128.B92201F00A3A@smtp.kernel.org/

 > [ ... ]

 > -		led->cdev.brightness_set_blocking = aw2013_brightness_set;
 > -		led->cdev.blink_set = aw2013_blink_set;
 > +		led->cdev.brightness_set_blocking = aw20xx_brightness_set;
 > +		led->cdev.blink_set = aw20xx_blink_set;
 >
 >  		ret = devm_led_classdev_register_ext(&chip->client->dev,
 >  						     &led->cdev, &init_data);

 > [Severity: High]
 > This is a pre-existing issue, but does assigning chip->num_leds after
 > registering the LED class devices cause initialization problems?
 > Looking at aw20xx_probe_dt(), chip->num_leds is set to i after the loop
 > completes. However, devm_led_classdev_register_ext() executes default 
triggers
 > synchronously, which call aw20xx_brightness_set(). If num_leds is 
still 0,
 > aw20xx_chip_in_use() silently returns false, skipping chip enablement 
 > and causing unbalanced regulator disables while probe is still
 > running.


-- 
Hal: They're going for the kernel!
Margo: Colonel Who?
