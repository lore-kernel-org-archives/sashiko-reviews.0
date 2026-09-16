Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6CB472F62
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 08:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548354; cv=none; b=RZyz2ZMURdxDuIuc9OdQlZOTt0YFaRwDfHOvQU3PMCDDT5atRO5bseoOlefxihksK9wbZOS76xs8KFrpe0QJ6ClqsSH9RGsTJIh846x7OYvoTD8yRZgODZ8cWdSC6A4jx6L4TlsWxAWvEJuqoCoQ9+5pYgwwSkCTWdMfRQ6nPqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548354; c=relaxed/simple;
	bh=YSgXIzhg++9vDHgCGBKZv9F1BA9wqWdoQTudKaMXtQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtrlXEjDrJ6LDAGnd/JPAeHlPj5ahLZzUkagWQnjvoCnyZ7a9GATCEBKAn1HySG/eHUUovxHuPKfgU47LF+XGtal+JSTb7T5eRNDf4IiIiDwZlTF4vXAW4C5i/seLvhb9uB+Mvr3LhAMl2faPyNjuTSB2SlGOALetAR6b6Cypi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net; spf=pass smtp.mailfrom=marmottus.net; dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b=WUHFBjQY; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marmottus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b="WUHFBjQY"
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 85BB6582748
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 08:26:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 394883E9D6;
	Wed, 16 Sep 2026 08:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marmottus.net;
	s=gm1; t=1789547190; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=wRjr34jj7++KZjPe8ph6ml2ioy/xkv6jxMXjHoOskuA=;
	b=WUHFBjQYRaH7VvjmSJHXVcqSxfBtI5Bbj140enQtxwyYR8kH/LbCr7ORjJlNsSacyrnXjf
	1HG1H6GQ7uVLD0tfjwt8qm4nc+HgYAnUeFbGjcCWeFNn8m3XCEd4jP6SvquYIhe3utgJPQ
	xsWJrOcqvvTdJVrpxnMd0udl1eWl7ll5QoQld4IMWR2A5VFT+sLNVIjrOPASlMHUuWII7A
	swMwtU0oFQF3zOGsOLKRUma4KxnkBOOk7hPjkK/d4zUZChdTOpOyGXOzlDFMkcLb0tmBuL
	k8aq7GHyB1hpoKy8TOjhCqkjX+1fNbADXIKcvzJYMi29brqQtom81rFlJC60nA==
Date: Wed, 16 Sep 2026 10:26:28 +0200
From: Arthur Crepin Leblond <arthur@marmottus.net>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v8 3/3] w5100: detect carrier state using link
 status bit and optional interrupt
Message-ID: <20260916082628.GA100127@marmottus.net>
Reply-To: arthur@marmottus.net
References: <20260915-wiznet-link-gpio-v8-0-d173622474cc@marmottus.net>
 <20260915-wiznet-link-gpio-v8-3-d173622474cc@marmottus.net>
 <20260916080754.A4FED1F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260916080754.A4FED1F0089A@smtp.kernel.org>
X-GND-Sasl: arthur@marmottus.net
X-GND-Cause: dmFkZTENTNQvFFcJsQHaRDGFTnpeeaD4kgCqLQhGqd/9+PCmMs/lVpKJwOBpbgVGDbFVSgo6rZnW7nozytMvGg9/A+pP3ZfGdzTPQXC5ljcd99G+mNXL+qRkST/sboCnAE+WvANJ84VrYqEoPsqlCT/lMlCSqN7rginmO7qEQ1dLVHACwwVtsQcOITxq9doXg6+NKl+eC0vvDvVN26O4KmBhrNqqQTRKBdZ/dldKdpkhK8kKvvS1uP/0s4b6NN5N1lFJykjeZmBGa8xcjHL5QG3iAk6U8/s85GX0qEx41w1sq7zE+kMmLyQIIAWJUX2ttu0K7dn2QBPS8ljW6wm7BjP/qVReFi2ZqqAMeR24DKS0ZfvAmMP9MOONW9Jq21n/5UsTr7a8+CrcbYKImJ00/rvXXCqR7TLJPcTVFzaC79PJyDUuzRbcD+OqwWayBF+iSPz0hD08K4cp73YiDvNrJOD4I3S5zWXZ79ibD3cREYUqcxNgEdPXmPa65/WUtDfThuY+qUIa8Au8iZY04Oh944X5KGAdceR+cR28OrSgybYdUF25ZnnAc3Qqc7cnpUR2zHN0ZjGgSg8SVa/+pORkwgWpZoPwihNETYizPnF6acU5eHvS/7vzqZobc3zOjOjbLZd7PuKlBq3AJ1ZUTVcWSKSXuZP9MpzurJ3l3Zxc2A+52o1f/w
X-GND-State: clean
X-GND-Score: 0

On Wed, Sep 16, 2026 at 08:07:54AM +0000, sashiko-bot@kernel.org wrote:
>> @@ -820,14 +953,22 @@ void w5100_remove(struct device *dev)
>>  	struct net_device *ndev = dev_get_drvdata(dev);
>>  	struct w5100_priv *priv = netdev_priv(ndev);
>>
>> -	w5100_hw_reset(priv);
>> +	unregister_netdev(ndev);
>> +
>> +	cancel_work_sync(&priv->rx_work);
>> +	cancel_work_sync(&priv->tx_work);
>> +	cancel_work_sync(&priv->setrx_work);
>> +	cancel_work_sync(&priv->restart_work);
>> +
>> +	if (priv->link_irq > 0)
>> +		free_irq(priv->link_irq, ndev);
>> +
>>  	free_irq(priv->irq, ndev);
>
>[Severity: High]
>Does this code introduce a teardown race by canceling the work queues before
>freeing the interrupts?
>
>If the threaded interrupt handler (w5100_interrupt) is running concurrently
>during w5100_remove(), it could queue a new rx_work or tx_work immediately
>after cancel_work_sync() returns.
>
>Later in the teardown, destroy_workqueue() drains and forcibly executes all
>pending works. Since w5100_hw_reset() is called prior to destroy_workqueue(),
>could these newly queued works execute against a reset and uninitialized
>hardware state, potentially causing I/O corruption or kernel crashes?
>
>Should free_irq() be called before cancel_work_sync() to guarantee the
>interrupt handler has completed and no new works will be queued?

Good catch and seems like it's the only issue you found! Let's see
what Clashiko will find. I'll fix that in the next patch.

Arthur
