Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A12247291
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 23:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790120751; cv=none; b=pFMXsCbueVXdQ6C2zb3V8Z42tw1g1AlIojacjAr5qJ0q3SphJdg4dbn+pVOm2tx5E3fRpgWVImaH5dHqfemWH04IT9+mBnzEnho9RwXWANsIzm6Bb5rdoYQWsyMPu9LyOGyrkGp59Q+/l+ApYDRUV6qnHMTcf0sjCy0eQIBRb4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790120751; c=relaxed/simple;
	bh=Ah7kODkvgexutE56tk6Yv0fe0wT3Bt0p7/t3lW1YFbY=;
	h=MIME-Version:Date:From:To:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=kD+y7SpIjUWziwVLySioHPYQ28rfX+TUJpE0Xo7I9pWxE8CL15l5HWl0IIxKCRFwAQrw6zKCA5GPiq3SpiLywi/sfsLkaYKQGK7xu4Tw+6hFq1RlmadiF5YwP519KCQQAtC8eLSPGND5OCiFHof3hlEDRchXsOuipGGq1HvFykg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=BmVK/J2x; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="BmVK/J2x"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3672980F64
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 01:45:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VjssLs5-eElt for <sashiko-reviews@lists.linux.dev>;
 Wed, 23 Sep 2026 01:45:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1790120747; bh=Ah7kODkvgexutE56tk6Yv0fe0wT3Bt0p7/t3lW1YFbY=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=BmVK/J2x9ZNDBbyevOXKTgFUIvEyD0aF5nOodmEVkaLDcWlsZ1fvWxEmjTDxjonZ5
	 ClVro7rawMFEECiQERnkKSYhAzKhmRKN/3tPbotyUSbjBNKUHvJyBE/cdySEUnT9pm
	 5RN2VQtU5rqniG26LjqB9148iwJ0rdlUUcF3kny/h8EpPc5t6U1Ef/pe/gkJrnjmH/
	 QNARgkBDxaMwy/ZxzPcnyuOpRnRtMx0Pq7Ul+2YomdqF7K8e+pRumwl/2O0CWsBEv/
	 KNWcED1yR5i0xf+R8l7eqS/riifwhvwJLUW2CO1eFfT4X1yF2EJeoBDrajtnaAQlPF
	 ScwZluuGevBTA==
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 23 Sep 2026 01:45:47 +0200
From: =?UTF-8?Q?Rapha=C3=ABl_Larocque?= <rlarocque@disroot.org>
To: sashiko-reviews@lists.linux.dev
Subject: Re: [RFC PATCH] Input: elan_i2c_smbus - resend ENABLE_TP on wake from
 sleep (NOT TESTED, NEEDS TESTER!)
In-Reply-To: <20260922233746.136E61F000FF@smtp.kernel.org>
References: <20260922232707.8949-1-rlarocque@disroot.org>
 <20260922233746.136E61F000FF@smtp.kernel.org>
Message-ID: <2a1a27360db479dce91ca4bd7728e553@disroot.org>
X-Sender: rlarocque@disroot.org
Organization: =?UTF-8?Q?Syst=C3=A8mes_Budgie?=
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Le 2026-09-23 01:37, sashiko-bot@kernel.org a écrit :
> Thank you for your contribution! Sashiko AI review found 2 potential 
> issue(s) to consider:
> - [Medium] input: redundant ETP_SMBUS_ENABLE_TP command during 
> initialization
> - [Low] input: explicit failure path violation in 
> elan_smbus_sleep_control()
> --
> 
> commit a7e8e038348366c26f0b3d1a3a7f9e778cbce51a
> Author: R. Larocque <rlarocque@disroot.org>
> 
> Input: elan_i2c_smbus - resend ENABLE_TP on wake from sleep (NOT 
> TESTED, NEEDS TESTER!)
> 
> This commit updates the Elan SMBus sleep control to resend the enable 
> command
> when waking up the touchpad. This mirrors the initialization path to 
> ensure
> touch reporting resumes.
> 
>> diff --git a/drivers/input/mouse/elan_i2c_smbus.c 
>> b/drivers/input/mouse/elan_i2c_smbus.c
>> index 0287441cda46d..dd86bd1739c55 100644
>> --- a/drivers/input/mouse/elan_i2c_smbus.c
>> +++ b/drivers/input/mouse/elan_i2c_smbus.c
>> @@ -93,10 +93,25 @@ static int elan_smbus_set_mode(struct i2c_client 
>> *client, u8 mode)
>> 
>>  static int elan_smbus_sleep_control(struct i2c_client *client, bool 
>> sleep)
>>  {
>> +	int error;
>> +
>>  	if (sleep)
>>  		return i2c_smbus_write_byte(client, ETP_SMBUS_SLEEP_CMD);
> 
> [Severity: Low]
> Does this direct return bypass the preferred explicit failure path 
> style?
> 
> The input subsystem maintainer style guidelines suggest expanding 
> direct
> returns into explicit error checks when a function has multiple failure
> points. Should this be updated to assign the return value to error and 
> return
> explicitly?
> 
>> -	else
>> -		return 0; /* XXX should we send ETP_SMBUS_ENABLE_TP here? */
>> +
>> +	/*
>> +	 * The controller stops touch reporting while asleep; resend
>> +	 * ETP_SMBUS_ENABLE_TP on wake, mirroring what is done during
>> +	 * elan_smbus_initialize(), so that reporting actually resumes.
>> +	 */
>> +	error = i2c_smbus_write_byte(client, ETP_SMBUS_ENABLE_TP);
> 
> [Severity: Medium]
> Will this cause a redundant enable command during initialization that
> might confuse the hardware?
> 
> During device probe, the sequence calls the initialization routine and 
> then
> the sleep control routine to wake it up:
> 
> __elan_initialize()
>    data->ops->initialize(client)
>       -> elan_smbus_initialize() sends ETP_SMBUS_ENABLE_TP
>    data->ops->sleep_control(client, false)
>       -> elan_smbus_sleep_control() now sends ETP_SMBUS_ENABLE_TP again
> 
> Since this patch is explicitly untested on real hardware, is there a 
> risk
> that this double-command could cause unexpected states or fail the 
> probe
> sequence?
> 
>> +	if (error) {
>> +		dev_err(&client->dev,
>> +			"failed to re-enable touchpad after wake: %d\n",
>> +			error);
>> +		return error;
>> +	}
>> +
>> +	return 0;
>>  }

P.S.: My previous email applies to the V2 I sent with typo fixes too,
and also, the Low Severity one, I did it like that to match the style of 
the rest of the file.

Thanks,
R. Larocque
