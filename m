Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D782C5372D2
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 23:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790120618; cv=none; b=n1Kbwrc66aJnh5caFM5GPx/ifDG04gGz7Ac7Ua0CufudTiXq63iR7sucCdRqzUdAWJJK9jv6rHO5YTplkU8X7JwX56R+J1ldnYupomGRnJCRn65wsmbu37q3kLcbzRKAFTZ4OY+4Kv6Ku2vwTYVyZTRTqV98Wpgt0zJkHYkMFqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790120618; c=relaxed/simple;
	bh=foktcOgWntPuAyEzLSwuL0FS/IRyC6DCIFiEatHBGeA=;
	h=MIME-Version:Date:From:To:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=aLrrbl6jlOIvUzXxD2o7PJVlt2bYHXN5cypSrJhIZljzGJkY2WCp7Dvf5N39T8E674DxVEnA1+krR7uIp47s5nXYCvUI8UX4EYSo3nZfY8nGyVTyRierjTypDyMrliCa0HOzXVmDueE8CdLWY8XPxaX7LWc+8Q/LyJKGdn6TrF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=OyBl2Mcb; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="OyBl2Mcb"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E89D682A8E
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 01:43:30 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JzWGPk2btWoE for <sashiko-reviews@lists.linux.dev>;
 Wed, 23 Sep 2026 01:43:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1790120610; bh=foktcOgWntPuAyEzLSwuL0FS/IRyC6DCIFiEatHBGeA=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=OyBl2McbOGgCMBYbw0ewG8jan5u/wuDpcwfc3EqmWR4/ORkCRYRdrmFoNX6ITu3CE
	 6GJS9CRQqHnenBUcJ9VCXWHeBXTWPhapl5n26TY3vvpEVEGrkuxI5tQCfQ9YU4raxp
	 m++G1KYEnlnMpheeEcqMQh+qYWBSiqMdYWezctc1gUFs2WwFpYS/O5KsR+BPwP3f1g
	 tHeQ4gIyuJC/5ojNr4cjS7Ie4vjoguu+/HGda9pQfSDn/eBufW51nyxI+EQSKOV1aP
	 4/VbzJM69yuYQajRP8fOgrLSPZhti8Id1I0YkZxALrNmdFmn8EJDCQutz7UrLC4K3F
	 ZTitB5KGXHlCg==
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 23 Sep 2026 01:43:30 +0200
From: =?UTF-8?Q?Rapha=C3=ABl_Larocque?= <rlarocque@disroot.org>
To: sashiko-reviews@lists.linux.dev
Subject: Re: [RFC PATCH] Input: elan_i2c_smbus - resend ENABLE_TP on wake from
 sleep (NOT TESTED, NEEDS TESTER!)
In-Reply-To: <20260922233746.136E61F000FF@smtp.kernel.org>
References: <20260922232707.8949-1-rlarocque@disroot.org>
 <20260922233746.136E61F000FF@smtp.kernel.org>
Message-ID: <b12f443f1834d91218b31095d1b698cc@disroot.org>
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

Confirmed by reading __elan_initialize() in elan_i2c_core.c:
sleep_control(client, false) is already called there
right after ops->initialize() for every non-ASUS device on
every probe (and, per the "Reduce the resume time" quirk work,
on every resume for older/non-quirked devices too). My patch would
double-send ETP_SMBUS_ENABLE_TP in that path, which I have no way
to confirm is safe without the datasheet.

Withdrawing this version for rework, will either gate the resend
on genuine post-sleep state, or drop it if nobody with hardware/
datasheet access can confirm double-ENABLE_TP is harmless.

If someone has the datasheet, please send a follow-up about it.

Thanks,
R. Larocque
