Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CDE4E3246;
	Fri, 18 Sep 2026 11:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789732436; cv=none; b=IrmLOHigdVS8oUnIjmWn1spNkjJ8wfYe43gtMhRaviLzuUMPl2i/qtHvk0SFdUBxuDrX/TWxHrkJfEewbe4QkxV6HjF4QgsFBNMX8ayolzAZTPrJy1NM1u1VxmQnYNPkZYSEpFlbvOJ2XgvvUmQlt8S5rBssb6iA4WRD6XrrDk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789732436; c=relaxed/simple;
	bh=KDbByxRcaux5zLHvhjjDx3CPde+azl0e1Fh97lil920=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uGUpw+PVlf5jfphxEccxrEm88V6UR6HvMKz/kYU8eX4rNWhXjhXnD3oA6LzGhi3JTplEvl01r3pYd6w6/HL38UBRibghMpB6/ua50WN4RekA0uoAXKNirjR05UZ3WZ9+CCgkCuvdsGjzJ5OlhbxUkfOdbotXfRZOY+jgGV3t0cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=n0zlGi8j; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="n0zlGi8j"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 47EBFC58470;
	Fri, 18 Sep 2026 11:54:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6617260649;
	Fri, 18 Sep 2026 11:53:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61AB810328331;
	Fri, 18 Sep 2026 13:53:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789732426; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ic8VIm7EhlwQJ6CwBH4kBPbGdagbD84cPSnTGPSbYIg=;
	b=n0zlGi8jMvQCS7qzC91Qc3U/1n5Zcv4A60jZc7i1eSEea+vA/HW72AN1lT7v5nq613gcAg
	SHVyzrXssYIzbXpMR4Iu+RUJhXPoHW1vQDXUNsZkgaYr5ehFJPgDEcFu2e5bCgq7vwxegc
	1pl148nqjcSjwXh5thGvpq977PtCM9NyTijntGBcQST9F2tFlIjyUmz2e8/RhLeaU9pZBd
	DfCATgNWyTYEVhULOMzKdc20ydvu8PhBERPiaBheo1aJVY6q3BQ79nMKtVRZyHfWsUOqzU
	5hzzsy8f4ekeUYXExa/nSZWoOfkXzeFtQRUt42WSnjNntjoZTYmaBvbF7EHOLA==
Message-ID: <121381c2-5a1a-4dee-b8b0-35f59328810f@bootlin.com>
Date: Fri, 18 Sep 2026 13:53:44 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: Re: [PATCH v3 1/9] mfd: cgbc: Fix use of negative error code as valid
 session handle
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org
References: <20260911-cgbc-i2c-storage-devices-support-v3-0-594b53fbc5ea@bootlin.com>
 <20260911-cgbc-i2c-storage-devices-support-v3-1-594b53fbc5ea@bootlin.com>
 <20260911190215.517821F000FF@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260911190215.517821F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/11/26 9:02 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The platform device `cgbc_pdev` is leaked if `platform_driver_register()` fails during module initialization.
> - [High] `cgbc_command()` can return success without fully initializing the caller's data buffer, leading to reads of uninitialized stack memory.
> - [High] Truncating `istatus` prematurely in `cgbc_command()` desynchronizes the driver from the hardware data stream and corrupts checksum validation.
> - [High] `cgbc_wait_device()` uses `ioread16()` to read an 8-bit status register, which may read undefined adjacent bits and cause erroneous timeouts.
> --
> 
> commit 5958523826be2db0df4509b215ea904388b04fd3
> Author: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
> 
> mfd: cgbc: Fix use of negative error code as valid session handle
> 
> This commit fixes an issue where a negative error code from
> cgbc_session_command() was directly cast to u8 and treated as a valid session
> handle. It adds an explicit check to ensure the return value is positive before
> assigning it to the session variable.
> 
> Closes: https://sashiko.dev/#/patchset/20260713-cgbc-core-fix-cgbc-remove-v1-1-79274ad62b3a%40bootlin.com?part=1
> 
>> diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
>> index 2becaf797646d..4a409234e66c8 100644
>> --- a/drivers/mfd/cgbc-core.c
>> +++ b/drivers/mfd/cgbc-core.c
>> @@ -103,7 +103,11 @@ static int cgbc_session_request(struct cgbc_device_data *cgbc)
>>  	if (ret)
>>  		return dev_err_probe(cgbc->dev, ret, "device not found or not ready\n");
>>  
>> -	cgbc->session = cgbc_session_command(cgbc, CGBC_SESSION_CMD_REQUEST);
>> +	ret = cgbc_session_command(cgbc, CGBC_SESSION_CMD_REQUEST);
>> +	if (ret < 0)
>> +		return dev_err_probe(cgbc->dev, ret, "session handle request timed out\n");
>> +
>> +	cgbc->session = ret;
>>  
>>  	/* The Board Controller sent us a wrong session handle, we cannot communicate with it */
>>  	if (cgbc->session < CGBC_SESSION_VALID_MIN || cgbc->session > CGBC_SESSION_VALID_MAX)
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but is the platform device
> cgbc_pdev leaked if platform_driver_register() fails?
> 
> drivers/mfd/cgbc-core.c:cgbc_init() {
> 	...
> 	cgbc_pdev = platform_device_register_simple("cgbc", PLATFORM_DEVID_NONE, cgbc_resources,
> 						    ARRAY_SIZE(cgbc_resources));
> 	if (IS_ERR(cgbc_pdev))
> 		return PTR_ERR(cgbc_pdev);
> 
> 	return platform_driver_register(&cgbc_driver);
> }
> 
> The error path here directly returns the error code without cleaning up the
> previously registered platform device. This leaves a dangling device on the
> platform bus, preventing the driver from being loaded successfully again
> without a system reboot.
> 

True. But I'll fix it later in a separate patch.
I don't want to pollute more this series with such fixes for
"pre-existing issues".

> [Severity: High]
> This is a pre-existing issue, but does cgbc_command() fail to fully
> initialize the provided data buffer before returning success?
> 
> drivers/mfd/cgbc-core.c:cgbc_command() {
> 	...
> 	case CGBC_STATUS_ERROR:
> 	case CGBC_STATUS_CMD_READY:
> 		data_checksum = ioread8(cgbc->io_cmd + CGBC_CMD_DATA + 1);
> 		if ((istatus & CGBC_MASK_STATUS) == CGBC_STATUS_ERROR)
> 			ret = -EIO;
> 		istatus = istatus & CGBC_MASK_ERROR_CODE;
> 		break;
> 	...
> }
> 
> If the hardware returns CGBC_STATUS_CMD_READY, the function returns 0 but
> does not write to the provided data buffer.
> 
> When called from cgbc_get_version(), this trusts cgbc_command() and blindly
> consumes the potentially uninitialized stack variable data:
> 
> drivers/mfd/cgbc-core.c:cgbc_get_version() {
> 	...
> 	ret = cgbc_command(cgbc, &cmd, 1, &data, sizeof(data), NULL);
> 	if (ret)
> 		return ret;
> 
> 	cgbc->version.feature = data[0];
> 	...
> }
> 
> This uninitialized byte is then exposed to userspace via the world-readable
> cgbc_version sysfs attribute, potentially leaking kernel stack memory:
> 
> drivers/mfd/cgbc-core.c:cgbc_version_show() {
> 	...
> 	return sysfs_emit(buf, "CGBCP%c%c%c\n", cgbc->version.feature, cgbc->version.major,
> 			  cgbc->version.minor);
> }

It is expected that CGBC_CMD_GET_FW_REV cmd returns data, so on success
it returns CGBC_STATUS_DATA_READY, else an error. But it cannot return
CGBC_STATUS_CMD_READY. So no potential uninitialized data usage.

> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does modifying istatus
> directly break the checksum offset calculation and hardware read
> synchronization?
> 
> drivers/mfd/cgbc-core.c:cgbc_command() {
> 	...
> 	/* Check command status */
> 	switch (istatus & CGBC_MASK_STATUS) {
> 	case CGBC_STATUS_DATA_READY:
> 		if (istatus > data_size)
> 			istatus = data_size;
> 		for (i = 0; i < istatus; i++) {
> 			_data[i] = ioread8(cgbc->io_cmd + CGBC_CMD_DATA + ((i + 1) % 4));
> 			checksum ^= _data[i];
> 		}
> 	...
> }
> 
> If the hardware sends more data than expected (istatus > data_size),
> istatus is truncated. The loop then reads only data_size bytes, leaving the
> remaining data and the real checksum unread in the hardware registers. The
> driver then reads a data byte as the checksum, guaranteeing a mismatch
> (-EIO). Does the driver need to read all bytes the hardware sends to stay
> synchronized?

Returning an error if the data buffer size does not match is expected,
else the caller will only receive partial data.
Maybe it shall return earlier and not start reading data at all if
buffer is not big enough. Anyway I'll not fix this in this series.

> 
> [Severity: High]
> This is a pre-existing issue, but does this ioread16() on the 8-bit status
> register read undefined adjacent bits?
> 
> drivers/mfd/cgbc-core.c:cgbc_wait_device() {
> 	...
> 	ret = readx_poll_timeout(ioread16, cgbc->io_session + CGBC_SESSION_STATUS, status,
> 				 status == CGBC_SESSION_STATUS_FREE, 0, 500000);
> 	...
> }
> 
> If the adjacent register at offset 0x03 contains non-zero data, the 16-bit
> read will incorporate it, failing the exact equality check and causing
> readx_poll_timeout() to fail. The status register appears to be 8-bit, as
> cgbc_session_command() correctly uses iowrite8() to write to it. Can this
> cause erroneous timeouts and break driver initialization?
> 

CGBC_SESSION_STATUS is 16 bits register. No issue.

Best Regards,
Thomas
