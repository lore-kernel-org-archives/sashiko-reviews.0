Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991833E3DBD
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 08:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785919007; cv=none; b=q6jo89EJd3SNNA0XB7xITDGoKJggoYzW7jsKLkCJc94aanmrlW6NAPP6XMnFtkKqhUJ7MkAvF3rH6F2Z7bzR3UKwUtgkPYxVkOUJqqNwvvBskZ0qhBTlFkFJn4vaEP1vYaCiJtw+mUDabHuz7zCz88edisFN27KczUR7zcDSNJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785919007; c=relaxed/simple;
	bh=MOn7oxXrZL+xFemqjbz74heu3oMn07FLvq27q11l8C8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U4Fb4g9Quo4Lh/Ts05qOaa959AKBXBH06wjc5xHccvAenh55poNDbOnkuER6dGaFk4vglyigzViaUX/RbdjtxDkb+d05DUcJFw0gV1EsPyrFA4xBDveA6WJ6nhEpspDKG1FoWsaJge99Mb7OgfwF6SOcOK/g2MH6arPsMNeFjHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fe62Jeyo; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fe62Jeyo"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 325E54E410C9
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 08:36:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 083E1602AB;
	Wed,  5 Aug 2026 08:36:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE5B211C34457;
	Wed,  5 Aug 2026 10:36:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785918998; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=UR6p8JxnAkaMDEy6WixJCA4H8SM+sl2ouOrm3h2Sd2Q=;
	b=fe62JeyoEmImowwQ3kgCle/gnjwYUoiTliqUJvz/dmgrbje40siEXkiMfPXIqUvfJC2HcJ
	jQyLCAemVm4tTENaMPKg/d71rEnDBjJnjgm8oa7LcGusiorVuKp1Z+nC+QdJzS5gP4Qs1N
	DdQLgWJYK2qEZ4hTKW7dTCQMnZa6QSXwZKIzVH5H5cVmaPBNfM8MiiSuKYmzWGd/XBLYOH
	AOT72LlVXJT3U/sUx26A+DtQI/zPd+NC2hHH8jpV0Zsu1kWE+yN9/oYrc0vGyNwlmRe1ge
	qiKoolm2vodnzkM8QbT/Wat1qedVd0Hr2IkZdeNZbuqv+B6oFz+d/tLL7p7TJA==
Message-ID: <dd5d7a15-2448-426c-83eb-2783c62e82d1@bootlin.com>
Date: Wed, 5 Aug 2026 10:36:37 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] mfd: cgbc: Fix use of negative error code as valid
 session handle
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, mfd@lists.linux.dev
References: <20260804-cgbc-i2c-storage-devices-support-v1-0-fed38510671c@bootlin.com>
 <20260804-cgbc-i2c-storage-devices-support-v1-1-fed38510671c@bootlin.com>
 <20260804152943.B83AB1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20260804152943.B83AB1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/4/26 5:29 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Hardcoded `.id` values are used in the `mfd_cell` array `cgbc_devs` instead of relying on `PLATFORM_DEVID_AUTO`.
> - [High] Uninitialized kernel stack memory can be leaked to userspace via sysfs if the board controller firmware returns fewer than 3 bytes of data.
> - [Medium] The `mfd_cell` array `cgbc_devs` is missing the `const` qualifier.
> --
> 
> --- Patch [1]: [PATCH 1/4] mfd: cgbc: Fix use of negative error code as valid session handle ---
> commit d37d718d69c4fd9448146a18eac17c7d57dcefc2
> Author: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
> 
> mfd: cgbc: Fix use of negative error code as valid session handle
> 
> The cgbc_session_command() return value was directly cast to u8 and used
> as session handle without error checking. Casting a negative error to u8
> produces a valid-looking session handle. So check if return value is
> positive before to cast and use it.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260713-cgbc-core-fix-cgbc-remove-v1-1-79274ad62b3a%40bootlin.com?part=1
> Fixes: 6f1067cfbee7 ("mfd: Add Congatec Board Controller driver")
> 
>> diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
>> index 2becaf797646d..4a409234e66c8 100644
>> --- a/drivers/mfd/cgbc-core.c
>> +++ b/drivers/mfd/cgbc-core.c
> 
> [ ... ]
> 
>>  static struct mfd_cell cgbc_devs[] = {
>>  	{ .name = "cgbc-wdt"	},
> 
> [Severity: Medium]
> This is a pre-existing issue, but should cgbc_devs be declared with the
> const qualifier?
> 
> The MFD subsystem guidelines require mfd_cell arrays to be static const
> so they are placed in .rodata rather than mutable memory.

yes indeed. Not a big deal, I can add a patch to fix this in v2.

> 
> [ ... ]
> 
>>  	{ .name = "cgbc-i2c", .id = 1 },
>>  	{ .name = "cgbc-i2c", .id = 2 },
> 
> [Severity: High]
> This is a pre-existing issue, but could this cause device naming collisions
> in sysfs?
> 
> The cells use hardcoded .id values instead of allowing the MFD core to handle
> auto-indexing. The subsystem guidelines recommend using PLATFORM_DEVID_AUTO
> to prevent driver load failures.

PLATFORM_DEVID_NONE (-1) is used and id starts from 1.
The first I2C bus receives a platform_id of 0 (cgbc-i2c.0, cgbc-i2c.1),
so no collision. While this design is maybe not ideal, but it works for
now. Also the plan is to add support for additional boards and I2C
busses in the future. And since some boards won't support all I2C
busses, so this scheme will probably be reworked.

> 
> [ ... ]
> 
>>  static int cgbc_get_version(struct cgbc_device_data *cgbc)
>>  {
>>  	...
>> 	ret = cgbc_command(cgbc, &cmd, 1, &data, sizeof(data), NULL);
>> 	if (ret)
>> 		return ret;
>>
>> 	cgbc->version.feature = data[0];
>> 	cgbc->version.major = data[1];
>> 	cgbc->version.minor = data[2];
> 
> [Severity: High]
> This is a pre-existing issue, but can this leak uninitialized stack memory
> to userspace?
> 
> If the board controller hardware returns fewer than 3 bytes during the
> CGBC_CMD_GET_FW_REV command, cgbc_command() might still successfully verify
> the truncated response and return 0.
> 
> The code then unconditionally reads data[0], data[1], and data[2], storing
> potentially uninitialized stack bytes into cgbc->version, which is later
> exposed via the cgbc_version sysfs attribute.

No. If CGBC_CMD_GET_FW_REV command succeeds (and we check cgbc_command's
return code), it returns exactly 4 bytes. So there is no way to get
uninitialized values in data buffer.

Also to prevent buffer overflow, cgbc_command verifies that the buffer
is large enough to hold all received data.

> 
> [ ... ]
> 
>>  static int cgbc_init_device(struct cgbc_device_data *cgbc)
>>  {
>>  	...
>> 	ret = mfd_add_devices(cgbc->dev, -1, cgbc_devs, ARRAY_SIZE(cgbc_devs),
>> 			      NULL, 0, NULL);
> 
> [Severity: High]
> This is a pre-existing issue, but should this pass PLATFORM_DEVID_AUTO
> instead of -1 (PLATFORM_DEVID_NONE)?
> 
> Using PLATFORM_DEVID_NONE combined with hardcoded .id values in the mfd_cell
> array violates MFD guidelines.

Ditto (see above)

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
