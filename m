Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B2B545DB9
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 14:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085772; cv=none; b=mJpCRjqDEahkX1qI0NioUQD9omkF7VQTLuirO13/PCwQKihvN3I2Aemkj0jtqhl2SIjQT61/4gIw9q3mouWYxrce8HypTfFnW1Q+4eSyQX0xr7ssEhN4i26elBzLF+C4DDkcu5Tlq2vNb8yleHWmBYjrJWUgsF908VnBMleZRvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085772; c=relaxed/simple;
	bh=1YKcPomv6P6yRmTvPJwEl4rh5BOtJinHDXYjgkdRQ2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4CkKS9iFdiTLk8IHrHKYZZL1gcVDr+EY7h2NZ5LdTP9bCRKGag9rV7XZkt2PoHvImTRYVctFqIjWR+KxBnNUxy4OArTyjESRe/OJyo59NWbzMl7APdHs5ExSq0rRyQsvZ7FHlYzajkX1xmomuBFr0aCoMzz1Z4Q0FqAaGDkk1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net; spf=pass smtp.mailfrom=marmottus.net; dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b=Pt25Yx4t; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marmottus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b="Pt25Yx4t"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FCAE3ED8B;
	Tue, 22 Sep 2026 14:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marmottus.net;
	s=gm1; t=1790085762; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s7R3jnvQZtHhs1q4noOLfzmmVxS8mbJwrU7Y7u04sO8=;
	b=Pt25Yx4tcMlJVM7ykX4t/6mWUMk0qPxlSvFEErJFZyd7GxOy3GaETBJh+WqupheoiDbc1A
	uXpm/TStuMVWJK8s1Ama5ewUO65ba7IoQ9Ov2NLmgvgKQB5LAfeKospIZnhlz1/mASU1ZP
	ri/Mby8GSDgneKNqR4p64fpwDuvyBrdORo3ghepvWCPZNwcd3FfuByCdnMjcoC8Id8MVeA
	x21nZztqKLTsRPdRwQmE2/h15awJqlnlDuS5eJlXPi53b9qCbHO1cHrYVIsQyH3AQK8gYB
	dygJ4WBfxf6Hm+RJssUkRx3Z2Vd6ckzqbc29TQS2ejuTcuhVOL2aROkT8BASyg==
Date: Tue, 22 Sep 2026 16:02:39 +0200
From: Arthur Crepin Leblond <arthur@marmottus.net>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH net-next v10 3/3] w5100: detect carrier state using link
 status bit and optional interrupt
Message-ID: <20260922140239.GA85030@marmottus.net>
Reply-To: arthur@marmottus.net
References: <20260921-wiznet-link-gpio-v10-0-5874a7a147a2@marmottus.net>
 <20260921-wiznet-link-gpio-v10-3-5874a7a147a2@marmottus.net>
 <20260922105316.82F431F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922105316.82F431F000FF@smtp.kernel.org>
X-GND-Sasl: arthur@marmottus.net
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: dmFkZTFAHYin0jq1e2g3YPE6IZPR0Oxt90ut5WR3wudyL8IPXHwNGMLv66y/Ov/37xJ2xG/aiaKmIPZwiCuYM9mn4UJ261I1CUz/upcq9ADhIbludDn6YpYRx+z/4XxE/1gzqnhJSRRLggwU8z12cK1QLHfrcF2LddTAAenEsMfy5LENxelGT4837If/RXgqCg7bB3M1MkXApNfMKTjZg1zN4aSPRQRwkfVX82VEnulbsu/6bBXIQyZXdRhkQMT/o7+lHfO5ZozMlqaUUYr8btK6ovph3GReF6Fmdj31BC54SI+bYbgNRpWuE7TjU1W5ZIBiuuxKBEMVRq7bd7R0UlP6dstAcMC9uZGCCoxe+DL+aYoi875OhGL5w96mFnFB8e9LaKOlZ+Ua+KaJbtBp+F4Ya1KJag6PrItFmxZqXRhXJXQJ1cZPaZq804t7xx1mVBHg4LCCQoflWuVFClDT2ucYFuH9x22zCTfxGvHfzhob20yEfa8WgzBbhoTiKNlt8L/+Sl2nZGj2tgyfdy1Rul8wNgdCuNQnZicuJj2AXa1pMvxRLfJVsNxrlkIplLK8+CwtQSxY87Mnzq6ZbXmD1RLVdCInW6KB9UuBbnw0nieET1bK14OhjauR1KNET6VzffjdAHVcqoeW+yLPDQjOkMJ2FvgLWfEl1XC8Yw4ha/jsLya7QQ

On Tue, Sep 22, 2026 at 10:53:15AM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>- [High] net: w5100: race in w5100_suspend due to incorrect detach ordering and missing work flushes
>--
>
>commit 4b50b6b7047dc53f16eedfdba4f4a537ef54c0fd
>Author: Arthur Crepin Leblond <arthur@marmottus.net>
>
>w5100: detect carrier state using link status bit and optional interrupt
>
>This commit adds support for detecting the carrier state on the w5500 Ethernet
>controller using the Link Status bit and an optional interrupt. It also
>refactors the bring-up and teardown operations, including changes to when
>net device registration and work queue cancellations occur.
>
>> diff --git a/drivers/net/ethernet/wiznet/w5100.c b/drivers/net/ethernet/wiznet/w5100.c
>> --- a/drivers/net/ethernet/wiznet/w5100.c
>> +++ b/drivers/net/ethernet/wiznet/w5100.c
>[ ... ]
>> @@ -839,9 +997,20 @@ static int w5100_suspend(struct device *dev)
>>  	struct w5100_priv *priv = netdev_priv(ndev);
>>
>>  	if (netif_running(ndev)) {
>> -		netif_carrier_off(ndev);
>> +		disable_irq(priv->irq);
>> +		if (priv->link_irq > 0)
>> +			disable_irq(priv->link_irq);
>> +
>> +		cancel_work_sync(&priv->restart_work);
>> +
>>  		netif_device_detach(ndev);
>
>[Severity: High]
>Does this code leave a race condition in w5100_suspend() due to the detach
>ordering?
>
>If a TX timeout occurs between cancel_work_sync(&priv->restart_work) and
>netif_device_detach(), wouldn't restart_work be re-scheduled because the
>netdev watchdog is still active?
>
>Also, rx_work, tx_work, setrx_work, and napi do not appear to be flushed or
>disabled in w5100_suspend(), unlike in w5100_stop(). Could this allow them
>to execute concurrently with or after w5100_hw_close(priv) and access
>suspended SPI hardware?
>
>>
>> +		if (priv->link_irq > 0) {
>> +			mutex_lock(&priv->link_lock);
>> +			netif_carrier_off(ndev);
>> +			mutex_unlock(&priv->link_lock);
>> +		}
>> +
>>  		w5100_hw_close(priv);
>>  	}
>>  	return 0;
>
>--
>Sashiko AI review · https://sashiko.dev/#/patchset/20260921-wiznet-link-gpio-v10-0-5874a7a147a2@marmottus.net?part=3

Probably very low chances to happen but YES, w5100_suspend() could
cleanup the same way as w5100_stop()

Arthur
