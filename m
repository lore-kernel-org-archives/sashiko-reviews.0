Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F3038DC56;
	Fri, 18 Sep 2026 09:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723618; cv=none; b=buYlKRJzdM5TMXaH9stfhEi4bilesoOVxBBbTjcUe24JH9e85LsEYcqJgoF8z7J6l711voFe1HBz6qDzknhBR3d4YR7/omDQvUx1i5Nu5kiiA9iOOuhAvclYPEnv8kNApdw9/MGAR3KyJevo2CilL6+4Lq4pgp3e6lqXVywyiU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723618; c=relaxed/simple;
	bh=9RSJ+jbQ0UoipoZOZIpWlu/8kOM7c1gJ66Zwm4q8BXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTf+XZ1mM/sRXLm4inHfMAXQ49MXxxfPuBy+Vc9ch1ocfavLJ8p/F8UfB5VYXt2hnKe/AuycjpJABZWQsEewJh5/ob7FkvlaiS96LRyxpirjmB1Cqa+TuH+fru1Xu3X8ZJIwYYyxRICOGhmIjEs+PuO555ifUh2JIB9oCBpStN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=y13KIjwa; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="y13KIjwa"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6FFAD1A0983;
	Fri, 18 Sep 2026 09:26:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2845A60649;
	Fri, 18 Sep 2026 09:26:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D533010328035;
	Fri, 18 Sep 2026 11:26:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789723613; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=J88L3ITGVNJmtPXaoFUpjbNqIpz76EAmf6VuKAIbQUM=;
	b=y13KIjwax1UMdUkNROjitMogYv0yq+U/WWPoHOlMWe+eP3dOWKNtnORs/PwwAi4w0Smvdr
	oLVHB+Dl0m+EOyDDiwPUR/mhvWSafQHEtgeTRcrQ5uqGVWHQ9CvtfcW2jgxf1cV9xopkHA
	FZzu0lEKwGTCrtE9MuDvI8TGOztbIGqrD2yrBsO8gmTcAzHDZ/PMzAuiNk/WxP42+0eUwE
	mES2e34ilXAK+I+ma8gA3zIB+nRm3tjbg/lH1/HzreSwTceiKEWEswaT/k5GBzTdRtQGgx
	UZ4mEFCYIoHrCdWt7LEGMQpWBDwI2OQgfpv+33yw8TlU3TGlrm0InUFKGGi+rg==
Message-ID: <c0b543b2-df58-47e7-a4ff-87a2eb78d984@bootlin.com>
Date: Fri, 18 Sep 2026 11:26:52 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] i2c: cgbc: Use plateform data to get bus ID and
 adapter name
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, mfd@lists.linux.dev
References: <20260911-cgbc-i2c-storage-devices-support-v3-0-594b53fbc5ea@bootlin.com>
 <20260911-cgbc-i2c-storage-devices-support-v3-3-594b53fbc5ea@bootlin.com>
 <20260911185946.DC6AA1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20260911185946.DC6AA1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/11/26 8:59 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Division by zero kernel panic requires a check on bus_frequency.
> --
> 
> commit bc2e06b4057fc8a794acb4315cdceedbc968e9c4
> Author: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
> 
> i2c: cgbc: Use plateform data to get bus ID and adapter name
> 
> Obtain the bus ID (from the BC point of view) and adapter name from
> platform data. This allows the specific definitions to be removed, leaving
> only a generic adapter definition.
> 
>> diff --git a/drivers/i2c/busses/i2c-cgbc.c b/drivers/i2c/busses/i2c-cgbc.c
>> index 25a74fa51aa00..d388e07aad84a 100644
>> --- a/drivers/i2c/busses/i2c-cgbc.c
>> +++ b/drivers/i2c/busses/i2c-cgbc.c
> 
> [ ... ]
> 
>> @@ -170,7 +163,7 @@ static int cgbc_i2c_set_frequency(struct i2c_adapter *adap,
>>  	 * can be read by a command is CGBC_I2C_READ_MAX_LEN.
>>  	 * Therefore, calculate the max time to properly size the timeout.
>>  	 */
>> -	algo_data->read_maxtime_us = (BITS_PER_BYTE + 1) * CGBC_I2C_READ_MAX_LEN
>> +	i2c->read_maxtime_us = (BITS_PER_BYTE + 1) * CGBC_I2C_READ_MAX_LEN
>>  		* USEC_PER_SEC / bus_frequency;
> 
> [Severity: High]
> This is a pre-existing issue, but does this calculation need a check to
> prevent a division by zero kernel panic?
> 
> If the hardware responds to the CGBC_I2C_CMD_SPEED query with a byte where
> the lower 6 bits are zero, cgbc_i2c_reg_to_freq() will return 0 for
> bus_frequency.
> 
> When that result is used as the divisor here, it causes a kernel panic
> during device probe due to a division by zero.
> 
> Could we add a sanity check on bus_frequency before calculating
> read_maxtime_us?
> 

Division by zero is not possible, I already explained why for patch 6.

Best Regards,
Thomas
