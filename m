Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D7940B6F9
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 20:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678612; cv=none; b=R9fbJ4JNR3eKyPmCHOxUuareRjo+hGF4Exj/5/ZjeqGSW8fPJrbK2jbe+N/UsRhH53o0lDqqGxiwqcGER7mUSsLIsuz3xcj86edt3qYEpicnq0oBQ4UAF3KsohLIEGYt7gP8twr5oYJPHrFhS4g5pj4xDsHXbyx0gQ6X4UycZ4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678612; c=relaxed/simple;
	bh=D/cpHqVPtGZUVLRI7v02mDnLvMkXVMv5jnRoM2p9ZVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qRFLWJYKP6iHgbb8DaIu7Ojc1wq+a6avKAvhF4oQ3MvYc7sXUEoSbLuk+3pln1lTmunrLMRhUdHqbhGGV7fFj5dCB+yRCA1kC6GD+jj6N2mWzOGzvOh0nPX4jk18h3R9zifT95kfHtXMSaQhwLr1R9JBiQptw/rvkSpwe/Ody34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sx/1nOzh; arc=none smtp.client-ip=74.125.231.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sx/1nOzh"
Received: by mail-oo2-f0.google.com with SMTP id 006d021491bc7-6a3900cb2b5so27252eaf.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 13:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789678609; x=1790283409; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VqcPQwYq5exU7gKmkOcg/sQ85WVoAlRW8Nng5r6wY2Q=;
        b=sx/1nOzhUzAP/aRljLKShrQB5TGTrHUUGgzFNWrs5V9+TJUMBMoha2eqNEjJ7ovJLF
         c/OUYDg69JhzRd38EdpwpfqWz31OQ813ZdOCFhFvsbxh6i7wUticU0ZqlrhIF3TTp8wo
         waTuR6bPArYh0IMjKpL+fhXio2DK8iQg85aY4HXBlJCYKRdkXq1+JvbbB3rY/5VnYrys
         WWnuPXcOJg5Xl9FC5uLVRFNoBzgLnlbC1okIr8/mpsj+oVk7h5whnFizTpHPKLBi8uPU
         9PfkSXYV5S8W2edierj0acaara/RIV0URUajiMKHVUrNtyUJ1suerqnmMH36OGE52G0z
         ARpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678609; x=1790283409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VqcPQwYq5exU7gKmkOcg/sQ85WVoAlRW8Nng5r6wY2Q=;
        b=dh4VgpZXXWprg5XN6fLKhJ6IFvZen/zclmlc/SzxK0Fm4rIpogOAxULalnYMfqA7lq
         5E1LI7tyXfSm7lOF1Pc0VYSGbHPEdurSBMjzE7RbVZyAHXah43bUKcHcjmJZu01+c9ao
         zDOqhJDrhUwxCUWijMhWz0Rli0HBGx3I74xdYgQTM62NX9IKOPQc8/y/02THq4xq2UrV
         zzCHX6PEdUf9rn+TnFwIXEdGwo+SuT8Y3SHjI33+eRXJaWFIJgrNmTL32fBFslwbHVgh
         8ZbJd1v8T0krkQU7nvmMK6y9hGFXq7XVbfSLZF6w6D+RVkgS5Sw5QFV7mYZJZT4jx/yF
         4Gcg==
X-Gm-Message-State: AFuF++kexZkqZdIbHDd3ZOc5L8+bj6s32O1iDp3IersgSxaGev3vWk/k
	NMC0YY4v04sf9MKUWe4Wb88PWD9ZSjbH8MrSoAtz2paWOewPGC4X0wgDcuIDIuKmI34=
X-Gm-Gg: AYBFou3FsN8bUaA6LTmQlQ4AbGR3FuKdavoJHjfx744RbFRrhngiM2MwLjik68qAsvH
	dItoOFyOb0NYPbUuqeOid4At6SPgyR1ljBftQXoOIQ7pJfALbkhJne5mJUne47jDg+yBkDxgXkT
	WPeczH20LIBesxUOffbUpEZ0SAD/SaAniT9FjTYSaY1ojp0H02eE6x/uuX8Qas05jJNBT1BYnzt
	QN7Qell0eMJj+AgeWeqj6aK+ymQTMbP8C/2cTTY83YGmfVPUfF0NAgIOgikl8uBDdzz/YDxuKMn
	7CdSDTzfJqMsfZ40gWPH759n1BSgdsTXjA07rulIz709NcT8COyY2nyhW3vlOCPcSjeQtIQY7aD
	LDZrjR7vMaUQz5SRdUBvB9t6JS/wNQC3TskfdY88DrRI5V2eZizTsssKAGJZkhuh6TETF+AJpTz
	qTAloUvnkdhqQBY9FgHmRvBVLk0wp8HK5cIeQDG+DPyE8ldqliRJccBRmkYLNX9Fv0wjH4JbEZv
	MqF7GNh9KM5z6A=
X-Received: by 2002:a05:6820:16a6:b0:6ac:b6c0:2c09 with SMTP id 006d021491bc7-6ca9a22b45bmr268813eaf.1.1789678609442;
        Thu, 17 Sep 2026 13:56:49 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-486ac360590sm873135fac.17.2026.09.17.13.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 13:56:48 -0700 (PDT)
Message-ID: <b573c7fc-61e1-4112-8ff6-078aa72e755e@gmail.com>
Date: Thu, 17 Sep 2026 15:56:46 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, mfd@lists.linux.dev
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
 <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-3-d35d2ac3d6f0@gmail.com>
 <20260916042448.A40941F000FF@smtp.kernel.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260916042448.A40941F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 11:24 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] iio: mt6397-auxadc: hardware state leak on error paths
> --
>
> commit e17dd59587f106380c3ede8aa27c118b33350f88
> Author: Ryan Brue <ryanbrue.dev@gmail.com>
>
> mfd: mt6397-core: Add mt6397 AUXADC support
>
> The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
> devices array to allow the corresponding driver to probe using compatible
> string.
>
>> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
>> index 9ec9519965887..5d5f816492aaa 100644
>> --- a/drivers/mfd/mt6397-core.c
>> +++ b/drivers/mfd/mt6397-core.c
>> @@ -261,6 +261,9 @@ static const struct mfd_cell mt6359_devs[] = {
>>   
>>   static const struct mfd_cell mt6397_devs[] = {
>>   	{
>> +		.name = "mt6397-auxadc",
>> +		.of_compatible = "mediatek,mt6397-auxadc",
> [Severity: Medium]
> Enabling this device exposes a hardware state leak on error paths in the
> mt6397-auxadc driver.
>
> In mt6397_auxadc_isense_enable(), if the second regmap write fails, does the
> function return without unwinding the first write, leaving
> MT6397_CHR_CON16_ADCIN_VSEN_EN incorrectly enabled?
>
> drivers/iio/adc/mt6397-auxadc.c:mt6397_auxadc_isense_enable() {
>      ...
> 	ret = regmap_update_bits(map, MT6397_CHR_CON16,
> 				 MT6397_CHR_CON16_ADCIN_SEL,
> 				 MT6397_CHR_CON16_ADCIN_VSEN_EN);
> 	if (ret)
> 		return ret;
>
> 	return regmap_set_bits(map, MT6397_AUXADC_CON14,
> 			       MT6397_AUXADC_CON14_CH0_NORM_SEL |
> 			       MT6397_AUXADC_CON14_CH0_LBAT_SEL);
> }
>
> Similarly, during teardown in mt6397_auxadc_isense_disable(), the use of the
> ?: operator short-circuits the sequence.
>
> If the first regmap_clear_bits() fails, will it abandon the cleanup and skip
> disabling MT6397_CHR_CON16_ADCIN_SEL?
>
> drivers/iio/adc/mt6397-auxadc.c:mt6397_auxadc_isense_disable() {
>      ...
> 	ret = regmap_clear_bits(map, MT6397_AUXADC_CON14,
> 				MT6397_AUXADC_CON14_CH0_NORM_SEL |
> 				MT6397_AUXADC_CON14_CH0_LBAT_SEL);
>
> 	return ret ?: regmap_clear_bits(map, MT6397_CHR_CON16,
> 					MT6397_CHR_CON16_ADCIN_SEL);
> }
>
> A similar issue appears in mt6397_auxadc_battemp_bias().
>
> Does this function lack a rollback path if the second or third regmap
> operation fails, permanently leaking previously modified register states?
>
> drivers/iio/adc/mt6397-auxadc.c:mt6397_auxadc_battemp_bias() {
>      ...
> 	if (on) {
> 		ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
> 				      MT6397_AUXADC_CON0_BUF_PWD_ON);
> 		if (ret)
> 			return ret;
> 		ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
> 				      MT6397_AUXADC_CON0_BUF_PWD_B);
> 		if (ret)
> 			return ret;
> 		return regmap_set_bits(map, MT6397_CHR_CON7,
> 				       MT6397_CHR_CON7_BATON_TDET_EN);
> 	}
>      ...
> }
Good find, exiting early could leave the select bits set on CON14, or 
the battery detect bias current or input buffer on in CON0/CON7. Will be 
fixed in v2.
