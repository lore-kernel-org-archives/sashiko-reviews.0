Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7360D3E557D;
	Wed,  5 Aug 2026 08:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785919376; cv=none; b=U2Oz52ljLbi+0t+P67s5E6jH2JH+GG2cFM0sP5rhu+ow7TNZai8Rhhk0kcz9/u11QmrcIJK33C75p09OemBLe7oEjRYn8sxthUdQX13m5XVRj9BnDipYOlww8vhQeB7TcC2l2VjbI8MssKKQ4rs9XpZQzyPTJKNid7yDO1AyW9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785919376; c=relaxed/simple;
	bh=XnTZtUDP7A0ciS1XtD8eSYIsPuFWtmXnnZV4q7yC/hI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kMgFX7DcgVJPkXTz4sfos3Lexd/mkU93AdcRfsXd11Dei0bas7bC7l/dO+dTf2a5HJog2HwR5u7QJHBIa1I/CVjzQQriDQKQL9wwpJNgZxr1w8pQimSxe2ZY1gTvPBQao0rHRu5/YN2ibGORF6gCLjHve3PNOe9LAhpdYeOsI2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VwcfVVnd; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VwcfVVnd"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8F8954E410CB;
	Wed,  5 Aug 2026 08:42:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 53607602AB;
	Wed,  5 Aug 2026 08:42:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 657F711C3036D;
	Wed,  5 Aug 2026 10:42:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785919367; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=vsWplo5uQEpyCH1IdUduqWT5L5gfgXO9eN1hYnahl2g=;
	b=VwcfVVndnCYJlK9Tn9cpqjNY3nluE3Dnk76OoxyZlFOsyFv84J2LYJW5hCKSaej4J9kTHY
	jZa/ZXS+9CATRHyqJ1//6xVE94Sj2CnKXVIVV7doIVIY/p3fhdIA9OBAkEQI86ljppIYW+
	WCAvi72m+c96BOvf9iLhTtFgp66q9HezLXgYpAwifUvNHNJuaMMSDKUwZWzWi5wHbKD4DD
	/kTUnqxwc3MfIZiqLr5fg2CgWqF8RIZ7tWAjiEB1exq1um/zFl63OM6l7KqvH1w5qRG8sU
	c4OZgn44lLPt/OoTY9LpgkZbWWX2uz8Pjfl9Drm0N2raTngPB9tKAz8tfVrR8w==
Message-ID: <a7135791-da04-48fd-accf-86a01edd4818@bootlin.com>
Date: Wed, 5 Aug 2026 10:42:46 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] i2c: cgbc: Add virtual storage devices on the virtual
 I2C bus
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, mfd@lists.linux.dev
References: <20260804-cgbc-i2c-storage-devices-support-v1-0-fed38510671c@bootlin.com>
 <20260804-cgbc-i2c-storage-devices-support-v1-4-fed38510671c@bootlin.com>
 <20260804155830.DC0C91F000E9@smtp.kernel.org>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20260804155830.DC0C91F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/4/26 5:58 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Typo in the software node label property for the BIOS EEPROM ('eprom' instead of 'eeprom').
> --
> 
> --- Patch [4]: [PATCH 4/4] i2c: cgbc: Add virtual storage devices on the virtual I2C bus ---
> commit 98b86180cbc7d34ae655eafe5dcbc85e15d4bc49
> Author: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
> 
> i2c: cgbc: Add virtual storage devices on the virtual I2C bus
> 
> This commit adds support for virtual storage devices exposed by the Board
> Controller on its virtual I2C bus. It uses the generic 24c01 at24 driver
> for all virtual storage devices, customizing their parameters via
> software_node properties.
> 
>> diff --git a/drivers/i2c/busses/i2c-cgbc.c b/drivers/i2c/busses/i2c-cgbc.c
>> index c3f1c83b105a8..418de90e11bb8 100644
>> --- a/drivers/i2c/busses/i2c-cgbc.c
>> +++ b/drivers/i2c/busses/i2c-cgbc.c
> 
> [ ... ]
> 
>> @@ -372,6 +372,149 @@ static const struct i2c_adapter cgbc_i2c_adapter[] = {
> 
> [ ... ]
> 
>> +static const struct property_entry cgbc_bios_eeprom_props[] = {
>> +	PROPERTY_ENTRY_U32("size", 32),
>> +	PROPERTY_ENTRY_U32("pagesize", 1),
>> +	PROPERTY_ENTRY_STRING("label", "cgbc-bios-eprom"),
> 
> [Severity: Medium]
> Does this label contain a typo? The other devices use the spelling "eeprom",
> but this one uses "eprom". 
> 
> Since this label is exposed to userspace via sysfs (as an nvmem device),
> could this naming inconsistency break udev rules or user scripts relying on
> a standard "eeprom" naming scheme for these storage devices?
Yes indeed. I missed it because I used i2c device to sysfs entry to test
(/sys/bus/i2c/devices/i2c-cgbc-bios-eeprom/eeprom). And this typo
impacts only nvmem device.

Will fix it in v2.

Best Regards,
Thomas
