Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E073D5C06;
	Wed, 19 Aug 2026 07:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787124560; cv=none; b=pk30tBSNr7ozBHAV4m0LAeiUoaKpYryfOAwDnK7nGWDZArsF6s+MkL13UrCQUTd5RwBQyWAWtoeQFTtrEQhg3I3yR2mffYETSpTsHSV2TAi4IuKzzy8WphAWJt+Aj4Yn+a4H0OoSSqTJxlvexC+u8xavtqssxevWb5bdL18SQ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787124560; c=relaxed/simple;
	bh=Mu+7LLfVGJEa7egrQJ85+es5WpyywoehYqfJDmwmG9c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kVn5UpULcDGBrROSBf9jJHzIoc3EPNGHyd2z1PvDTdUm2NGCsUaoTyUYWVFrY3yptXPeufjVaxw0wVBIQq4h0UXBaK7O7x0bIChmsdvP+fpzdggviHcnB+09LCQgwYhp/nVexoTkPFHVV0eVhjuAV56ZdORQfaWhZqyIsYMH/Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=Bp/jOf1o; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="Bp/jOf1o"
Message-ID: <0ca5c247-18b4-4711-83c9-f0fa6570404d@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1787124553;
	bh=Mu+7LLfVGJEa7egrQJ85+es5WpyywoehYqfJDmwmG9c=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Bp/jOf1oKfFdpCH+Zeh00mSopBGHf2Lkn66R1D49WVY/1pwnLxLS4klyg//FH2iFs
	 D/bZw5GLQdcpBxJD8UVbO5qIW2o4zAQolSp4zmZUthYoDWmFafdoHQC3jQf466cZFd
	 q/dHXar5lC5Jr9XeqYYKX/o4v8PckUa1GauWTTSo=
Date: Wed, 19 Aug 2026 09:29:12 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v9 3/6] mfd: khadas-mcu: Add support for VIM4 MCU variant
To: Lee Jones <lee@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org,
 mfd@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org
References: <20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr>
 <20260805-add-mcu-fan-khadas-vim4-v9-3-75df78710b9e@aliel.fr>
 <20260805081913.272991F00A3A@smtp.kernel.org>
 <20260812120007.GO1072730@google.com>
Content-Language: en-US
In-Reply-To: <20260812120007.GO1072730@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/12/26 2:00 PM, Lee Jones wrote:
> On Wed, 05 Aug 2026, sashiko-bot@kernel.org wrote:
> 
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [High] The driver unconditionally fails to probe on generic Khadas MCU boards (VIM1/VIM2/VIM3) due to a NULL pointer check on valid match data.
> 
> Please review, explain or fix the Sashiko review(s).
> 
> If this is a set, this request includes the other patches too.
> 

Yes I will check all those reviews.

>> --
>>
>> --- Patch [3]: [PATCH v9 3/6] mfd: khadas-mcu: Add support for VIM4 MCU variant ---
>> commit eab418dac1b5e94bd297b0a14e92e87b2063dc9b
>> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> mfd: khadas-mcu: Add support for VIM4 MCU variant
>>
>> This patch refactors the probe function to use per-variant values instead of
>> hardcoded globals. It adds dedicated regmap configuration, fan control register,
>> and duty-cycle levels for the VIM4 MCU variant. A new compatible string
>> "khadas,vim4-mcu" is introduced for this new device.
>>
>>> diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
>>> index 0e74efe14f367..4cb305ac915e1 100644
>>> --- a/drivers/mfd/khadas-mcu.c
>>> +++ b/drivers/mfd/khadas-mcu.c
>> [ ... ]
>>> @@ -75,47 +75,138 @@ static const struct regmap_config khadas_mcu_regmap_config = {
>> [ ... ]
>>>  static int khadas_mcu_probe(struct i2c_client *client)
>>>  {
>>> +	const struct mfd_cell *cells, *fan_cells;
>>> +	const struct regmap_config *regmap_cfg;
>>>  	struct device *dev = &client->dev;
>>> +	int ncells, nfan_cells, ret;
>>>  	struct khadas_mcu *ddata;
>>> -	int ret;
>>> +	const void *match;
>>>  
>>>  	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
>>>  	if (!ddata)
>>>  		return -ENOMEM;
>>>  
>>> +	match = i2c_get_match_data(client);
>>> +	if (!match)
>>> +		return -ENODEV;
>>
>> [Severity: High]
>> Does this code inadvertently break the probe for generic Khadas MCU boards
>> (VIM1/VIM2/VIM3)?
>>
>> Because KHADAS_MCU_GENERIC evaluates to 0 in its enum, i2c_get_match_data() will
>> return a NULL pointer when matching "khadas,mcu" in khadas_mcu_probe() in
>> drivers/mfd/khadas-mcu.c. This will cause the check here to evaluate to true and
>> unconditionally abort the probe with -ENODEV.
>>
>> [ ... ]
>>> @@ -123,7 +214,8 @@ static int khadas_mcu_probe(struct i2c_client *client)
>>>  
>>>  #ifdef CONFIG_OF
>>>  static const struct of_device_id khadas_mcu_of_match[] = {
>>> -	{ .compatible = "khadas,mcu", },
>>> +	{ .compatible = "khadas,mcu", .data = (void *)KHADAS_MCU_GENERIC },
>>> +	{ .compatible = "khadas,vim4-mcu", .data = (void *)KHADAS_MCU_VIM4 },
>>>  	{},
>>>  };
>>>  MODULE_DEVICE_TABLE(of, khadas_mcu_of_match);
>>
>> -- 
>> Sashiko AI review · https://sashiko.dev/#/patchset/20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr?part=3
> 


-- 
Best regards,
Ronald
