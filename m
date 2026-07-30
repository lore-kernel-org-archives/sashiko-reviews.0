Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA62392831
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 15:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424266; cv=none; b=cITxlsXjYNoyfGdOV1edWODl4qxJpCbOkVeOUF3tgRkiDGw63j3UtWbT7qJhP2WYncDpu0C3DK+kkaRcYJG8WD1oBfUMhTDDcAqQ4o1BnxG0qgQbkNLNq2hlgE9KnxLfc33utaPtJABzdw+gNlmXq+T5Wx2x2x8b/IFRfgID2K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424266; c=relaxed/simple;
	bh=F5cDlmmaU5YiEDLodaR019jRhp+mbsp9hYQy41TO3cI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMFaJyEC0IY+/fYZPYX1OayMtlt/GWXuA33wLKpC16TlqWE8c1v6WhW1VMDXBDmtoxmn+Bczj1e1AWxAV4Vnciw55858vZInempE2nIUW7Ynk3vB3BY+Dd4sWdC4InUirA/OvsKHUvMZ81WsaGabEigJj0Bg2T3p+QEor3pb9VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWWrGSaw; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWWrGSaw"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso1245103a12.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 08:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785424260; x=1786029060; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3AtAeMvB7ZMtK3nRoTe2cnXsW8WPJwBbelRG5gH7yw=;
        b=GWWrGSawnq6OBGJmMaouNmtkwPtjKh/4yn/Wfws38LJ67+Is9/Opf8xrHNsG0/IK7J
         dMNx19oHdvmIBiPu4fCPWdp6LQPRIAdX3urT4QeCXEJQR9X5QQ/Krs+MLU/+x01AaZtj
         sbC2yiw2qWuD15NCoxm6b6xmRokNOF+RvuxGTxnBak5oDUt0xzkj14Dj8QfOA2yrZdOB
         IPJ2umvTI/irZui23CCqB4lwfStviz6TgIgsbodMD95h+gP1yvSILLUk/IecZv0PsxUU
         W+vKbolKy6nJYUl+86KLIehklGNuympfiA1CosVROOq3W1kwTOHtaoB8VhleBfBPiXU+
         38Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424260; x=1786029060;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n3AtAeMvB7ZMtK3nRoTe2cnXsW8WPJwBbelRG5gH7yw=;
        b=o9VOPLlEARRPeeF2DDRmN/RnSS1Jd+cBn5EZ285szXPr6KGlycV3OuAIUsUjKUXhF4
         wLpa4+hjwi5Lg9i6hfObn26EQ4qtYDOFxePprxLwYTum8yUULBneWmOqr7BknwsQRJpe
         boePiNpRbTbsv575R/tRTvAtOwqvr/fYzA5l2ejoN6SS6mo/sJBY8O0kUmbrMedy1S7X
         s9g+esser2tiQwAk8Iz44+50kw6JaSC4UTWdaVSIAfpbqQFzyZVibW314bBLqSUFrduw
         30n9/XtnJrNh4saSxfemxggeuuyg0YUOQCyDEhr7nOMRXz1rUyfOjkre+6AWzuqu5owN
         GoQw==
X-Gm-Message-State: AOJu0YyJcmvww/aw51io3fQ3Hlrl1Ez2mbXEjh9dSDuJgEPOWCc+FJoT
	QJnMalBhbp4o0szohD2ToaU+trQyGrBPvAY5Hp27iRFtSudkcZhL8PyQATNVvw==
X-Gm-Gg: AR+sD13xerKNeHMBGXzof7tiXvuSz3FbVy4SW/25zgSbgvZOLTYkiFrOLlwzAkn6nDP
	F5ObSN6yZOkUbod97e3dq79TQWZrKvTZe3OLP0FErU/sMytq1w+wLQSvFoGuR0+tcAv0dQPu8BB
	cpvQCwLTEt2aJ0OOL0U4ZU7+v4VEEkp1epuSsggddYjyuYFVP6HLU5pJ1lCAiTI2UX/6TuvsyXL
	K/wCRW0yS7NvQzcEPdL1CAGK/TkOGR6nEyx/U8DADHqQKBXI4ZsV7HkqY7t5U3XsLnGMg/WD7V/
	N9LlQEJfUe3o2Gp7zZsR6WluceTphTA05siMnaSLVkCDDWYARbk6Voeej2hK2Oa3bqDV2KV5Mx5
	PagA5DFKCfAtdoCUPl2Gqn6xy/172P1G3B7v0DsvSBNhrfKPY4s2nQ8AIXzOM3YEBEaHqjurL/A
	66yNRQo0k/JLzFZH6kWPYhB1t2BEotTjk63kIFg9R4QJWRo9pwFXkhpdvNgQA9R8kJP/yspfO9m
	mw5X64CQDljJP19uTNILlfAi6gvxuBSPX0Q+g==
X-Received: by 2002:a05:6a21:7106:b0:3bf:76d5:4cf2 with SMTP id adf61e73a8af0-3c9008abc85mr2649509637.40.1785424260100;
        Thu, 30 Jul 2026 08:11:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504927a7bsm24202861eec.0.2026.07.30.08.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 08:10:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ca894ac0-7c6c-45bd-935c-660cc6c16aef@roeck-us.net>
Date: Thu, 30 Jul 2026 08:10:58 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hwmon: (lm90) Switch channel parsing to fwnode APIs
To: sashiko-reviews@lists.linux.dev, Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260730091409.10544-1-flaviu.nistor@gmail.com>
 <20260730094350.95BDF1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260730094350.95BDF1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/26 02:43, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Critical] Switching to `device_for_each_child_node_scoped()` exposes a critical pre-existing bug in the core `fwnode_get_next_child_node()` which causes an infinite loop and double-frees if a device has both OF and secondary firmware nodes.
> --
> 
> --- Patch [1]: [PATCH v3] hwmon: (lm90) Switch channel parsing to fwnode APIs ---
> commit 39e5cdd2d72333fe0fa7b34c25ad27651948158c
> Author: Flaviu Nistor <flaviu.nistor@gmail.com>
> 
> hwmon: (lm90) Switch channel parsing to fwnode APIs
> 
> Replace OF property handling with fwnode in the probe function to read
> the channels properties, improving the driver compatibility since this
> method is not limited to Device Tree only.
> Add also the needed headers for explicit include and clean up related
> function naming.
> 
>> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
>> index 4b9c0ccdf2609..03779c1a251a2 100644
>> --- a/drivers/hwmon/lm90.c
>> +++ b/drivers/hwmon/lm90.c
> 
> [ ... ]
> 
>> @@ -2739,18 +2744,17 @@ static int lm90_probe_channel_from_dt(struct i2c_client *client,
>>   	return 0;
>>   }
>>   
>> -static int lm90_parse_dt_channel_info(struct i2c_client *client,
>> -				      struct lm90_data *data)
>> +static int lm90_parse_channel_info(struct i2c_client *client,
>> +				   struct lm90_data *data)
>>   {
>>   	int err;
>>   	struct device *dev = &client->dev;
>> -	const struct device_node *np = dev->of_node;
>>   
>> -	for_each_child_of_node_scoped(np, child) {
>> -		if (strcmp(child->name, "channel"))
>> +	device_for_each_child_node_scoped(dev, child) {
>> +		if (!fwnode_name_eq(child, "channel"))
> 
> [Severity: Critical]
> This is a pre-existing issue, but switching to
> device_for_each_child_node_scoped() exposes this driver to a regression
> in the core fwnode_get_next_child_node() framework.
> 

Interesting report, and quite possibly valid, but not caused
by this driver.

Guenter

