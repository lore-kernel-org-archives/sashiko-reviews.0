Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5942D7380;
	Wed, 12 Aug 2026 13:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541295; cv=none; b=J7ctWAzVmeSGJNAtiDCas+AtYdv47yZa2r2fiwbUX3zFNf/j7g8joRwSyFcvw929zdBOqcp4Lp5wTsv6Hwdn4jHRb+kshBHGfmwB2YO1C/+U83AY/U/VzWnQ6K88Az3PvXPaoF9aC87FcxT6eienXynKDF8dwVN0kvTNDE0rJgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541295; c=relaxed/simple;
	bh=HQkmU5R8XWYJc50zJPPiMjdGb5htPGDpaCqKOaa03H0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H9V+eA5vtjowOZ9i91UDekbDHGpmLe7Ur+KNsIVgYX/2jXK4aeP0+00Bc74cJTtBRaj/EaDq4+uvVui004fwGXyS8d9elrAXVgE/xjFf2pMnJP8rsYK0q0nfV+yDtqh/RgCmdq8oyxn5uRhnr/8jEyBBM8xrkYzsdwylbNqL8n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Tu7ntM+C; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Tu7ntM+C"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4DDB51A156A;
	Wed, 12 Aug 2026 13:28:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19DFA6045E;
	Wed, 12 Aug 2026 13:28:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2DCD11C4CEB5;
	Wed, 12 Aug 2026 15:27:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786541278; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=/eEoGjsebtbUQ5el3P2FLaDNETuxJbgl9OqJrAPc+TE=;
	b=Tu7ntM+CTp2mzAEHMlC/1GDKEI+/UKIddgn1GyFJ6up7xUbfO2uc8zBmIlcy2i5FpAn//0
	3bvxDlPnXmdft4mUfgs/LRdonpucuDX+HxNjCsVsJDJGNA6Ft5Ni8onOVMGjBjhhujIxBR
	lxTNlgAMT8cCLa3ihiykUrfhpAsMm+QcbxTY7GnCQvnlh52WwrndKIfiOJcmpKMiCI3mDR
	+RHFmxU7eJyU6iC2mKJZlPYx+eobPUAOuZe3U+nsOHca3PBO4JHd7BGn35xwcRTapx4nvX
	p1/M/FgCaA5tzwSkRtD/6NFVaNXROMQ9YsUvehbZso2nSRQ3E5GbVdShcyQrBA==
Message-ID: <cc76739a-1957-4973-afb9-2703e238f0ec@bootlin.com>
Date: Wed, 12 Aug 2026 15:27:57 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] mfd: cgbc: Add virtual I2C bus support
To: Lee Jones <lee@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev
References: <20260804-cgbc-i2c-storage-devices-support-v1-0-fed38510671c@bootlin.com>
 <20260804-cgbc-i2c-storage-devices-support-v1-3-fed38510671c@bootlin.com>
 <20260804154824.458301F000E9@smtp.kernel.org>
 <20260812112037.GJ1072730@google.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20260812112037.GJ1072730@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/12/26 1:20 PM, Lee Jones wrote:
> On Tue, 04 Aug 2026, sashiko-bot@kernel.org wrote:
> 
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Low] Hard-coded cell IDs are used for the newly added `cgbc-i2c` subdevice instead of `PLATFORM_DEVID_AUTO`.
>> --
>>
>> --- Patch [3]: [PATCH 3/4] mfd: cgbc: Add virtual I2C bus support ---
>> commit 4f0038d5dc42bfd45540675cdbf89f68ab3673d5
>> Author: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
>>
>> mfd: cgbc: Add virtual I2C bus support
>>
>> This commit adds a new I2C cell to support the internal virtual I2C bus 
>> provided by the Board Controller.
>>
>>> diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
>>> index 4a409234e66c8..81bd0a381ca13 100644
>>> --- a/drivers/mfd/cgbc-core.c
>>> +++ b/drivers/mfd/cgbc-core.c
>>> @@ -240,6 +240,7 @@ static struct mfd_cell cgbc_devs[] = {
>>>  	{ .name = "cgbc-gpio"	},
>>>  	{ .name = "cgbc-i2c", .id = 1 },
>>>  	{ .name = "cgbc-i2c", .id = 2 },
>>> +	{ .name = "cgbc-i2c", .id = 3 },
>>
>> [Severity: Low]
>> Should this use PLATFORM_DEVID_AUTO instead of hard-coding the cell ID?
> 

I use mfd_add_devices() with PLATFORM_DEVID_NONE.
So I2C busses will have platform_id from 0 to 2 [1].
And I2C adapter is selected using the platform device id [2].

I'm not 100% convinced by this implementation. I planned to add new I2C
busses and new boards support, and each board selects some busses. I
guess it will be the right time to rework it. If you have any idea to
implement this in a better way, please let me know.

[1]
https://elixir.bootlin.com/linux/v7.2-rc7/source/drivers/mfd/mfd-core.c#L164-L167
[2]
https://elixir.bootlin.com/linux/v7.2-rc7/source/drivers/i2c/busses/i2c-cgbc.c#L374


Best Regards,
Thomas
