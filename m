Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA694ADD8A
	for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 14:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321104; cv=none; b=sgQj6WtcoSKyX13RESZjjGlU9KayMzdY+4zvSCLV1UOShBDvk1OvLylg7ilOHeMXMd3L99bXqIuWfdISCtBkf0ZOLkzjn+RLOXZxgM9iCVpHl6oIR8J6szOnFtAjL9zxnWGmOLVivfYvyPqb624LaHRbdh8RXpwGN+/4Qzko/6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321104; c=relaxed/simple;
	bh=hB9qC8v2/L9JvCLIpWQjSoFidpI3TtjoPXM+GtJRRvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTZhB3x2InT9dBuS8nzZPXTPH2s/aAcvRcmzzFz6/HTjzGUidvtu3XmNCxWA0xeJfWcub5pBDP309crbnSLFDraWX0a9jc8PZrtuhSMwoWOi+z5KVBsbvM3MACGGLXPQxg6nTYvCTx7XyvhxWnPzuzWYvjbiGnTE3BoN4VGLmdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y7DhhTCM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y7DhhTCM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B28F1F000E9;
	Fri, 21 Aug 2026 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787321103;
	bh=wFp0WQU6prZEOfxRWYb5KCCkoyC6LtJnLLnm35OLSA0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Y7DhhTCMwyn6zebC0O86NBBhqvjmBi54mXdqf9OaS5WgNQQ8qq13rZ/0d+M1lZFPf
	 u0OQqPbcCnpIMiuO3ormf2ctISFoQG/6haFezdd3C6g86RFZe0wODK4l7KQexTFShE
	 DDENnwPOSPljVM7FtcoI7PdnX7bshlL354Rq/BfLzt9lAxksaAtg7PMfPPQJK7PR7g
	 CwtXuSyQC2pMMnYtptvcROmw8hCYDRAPiPuAhwVMHeDd4FJRvDr6x9rIPEseMzR+t/
	 fuVEXU76QbgYIaPleL3GZdsE82YGxInw69oY3VEwWFwqacBUOO1przwCZpTdKPB1Or
	 5sYEnGwHF56Yw==
Message-ID: <12b4ad0b-5323-4eee-8772-2bf07ad89a16@kernel.org>
Date: Fri, 21 Aug 2026 16:05:00 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] phy: apple: atc: Implement the USB4 pipehandler state
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, vkoul@kernel.org,
 neil.armstrong@linaro.org, olteanv@gmail.com
References: <20260821-b4-atcphy-usb4-v1-0-45c0b741e0c0@kernel.org>
 <20260821-b4-atcphy-usb4-v1-3-45c0b741e0c0@kernel.org>
 <20260821140146.0D53A1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260821140146.0D53A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/21/26 16:01, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> New issues:
> - [High] Missing cleanup of `PIPEHANDLER_OVERRIDE` registers on lock failure leaves link detection permanently disabled.
>
> Pre-existing issues:
> - [High] Unconditional state update of `atcphy->pipehandler_up = true` on the error path masks hardware configuration failures.
> --
>
> --- Patch [3]: [PATCH 3/3] phy: apple: atc: Implement the USB4 pipehandler state ---
> commit 6b90c04f8cd4e7a3f818a4bc0eb1057996bb1845
> Author: Sven Peter <sven@kernel.org>
>
> phy: apple: atc: Implement the USB4 pipehandler state
>
> This commit implements the USB4 pipehandler state for the Apple ATC PHY driver.
> It switches the dwc3's PIPE interface to the USB4 NHI which takes care of
> tunneling USB3 over USB4.
>
>> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
>> index 96158d3486560..613bcd0ae8865 100644
>> --- a/drivers/phy/apple/atc.c
>> +++ b/drivers/phy/apple/atc.c
>> @@ -1084,6 +1084,41 @@ static int atcphy_configure_pipehandler_usb3(struct apple_atcphy *atcphy, bool h
>>   	return 0;
>>   }
>>   
>> +static int atcphy_configure_pipehandler_usb4(struct apple_atcphy *atcphy)
>> +{
>> +	int ret;
>> +
>> +	ret = atcphy_pipehandler_check(atcphy);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Force disable link detection */
>> +	clear32(atcphy->regs.pipehandler + PIPEHANDLER_OVERRIDE_VALUES,
>> +		PIPEHANDLER_OVERRIDE_VAL_RXDETECT0 | PIPEHANDLER_OVERRIDE_VAL_RXDETECT1);
>> +	set32(atcphy->regs.pipehandler + PIPEHANDLER_OVERRIDE, PIPEHANDLER_OVERRIDE_RXVALID);
>> +	set32(atcphy->regs.pipehandler + PIPEHANDLER_OVERRIDE, PIPEHANDLER_OVERRIDE_RXDETECT);
>> +
>> +	ret = atcphy_pipehandler_lock(atcphy);
>> +	if (ret) {
>> +		dev_err(atcphy->dev, "Failed to lock pipehandler\n");
>> +		return ret;
>> +	}
> [Severity: High]
> If atcphy_pipehandler_lock() fails and returns early, the link detection
> override bits (PIPEHANDLER_OVERRIDE_RXVALID and
> PIPEHANDLER_OVERRIDE_RXDETECT) are left set.
>
> Does this permanently disable link detection on the PHY hardware for
> subsequent retries until a hard reset occurs?

No, if this fails the port will be broken until the next unplug/plug 
which resets everything anyway.
Same pattern has been working in the other paths and since we have no 
documentation for this PHY I won't touch it or do anything else here.



Sven

