Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901D8463B8C
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 09:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982719; cv=none; b=MAoY2TdVlEJutQXZ4RhXzmA3CrhJHjgvXzI8yExkKiuLSueiOk+JxKDBd9YYrE8n/SgnipK7xoqRB/+XhvGE6JlWd0NFhTHX00773J0gin/C/1aKNCjSyedZIunQr9J56olQLlQpI+EOMXN6Q1bkrbWFxVTMTLjg88qtILNEB9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982719; c=relaxed/simple;
	bh=YSCpY8tqNlknDrx0+gBTDvR7njLZyPar6Kwps8b3VhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjfklBp/Vq772mUSFe6qdGslJJ6F60CBhNgCizisJulF/TGvbY9/iomRSzHa/O3gYckQIPXHMC6JOAiWqcAo4YjH3ksCM9ClURMBGkX9annfGzjRZjkdID9hPeraaLBfUVv5mFBhfPCwZMnK/WWLM+oGz1tYMyATVLieAIMBpcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net; spf=pass smtp.mailfrom=marmottus.net; dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b=SzF/aoSY; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marmottus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b="SzF/aoSY"
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 821165816EA
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 09:04:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04E263EC33;
	Mon, 21 Sep 2026 09:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marmottus.net;
	s=gm1; t=1789981474; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=xlP+IH2SlJ1ApoTn35mCssnsxHazfM1zvnYS3L3OSoM=;
	b=SzF/aoSYvL5WCOrUN+GxNiTrvYW2GGhNrDRkEifMQBR7ft+qfXbEmBpcecKS1hKZgEQzMS
	WAeyPF9mMlzA2zPnIzD79RVeWtSDOfzgYsmlSRyPiTGHTpMGjHXG17z2laqZpgaRYQ5Iw9
	NiCf4452kyaDhXrnVFhsVab7hce6Su5qjaTE1qqHsXT7wF4mWUCNpffrDxYg10pELZtuzJ
	H6g/VGIJ0dtHk9Psu2x7y3oF/KSI3YPilhtw0yLcx1fZrEX4uJD4dKXNLWX2oW93iFeOc9
	p5oV3XuoI2+napbf9Rhd2zR0CBJq4KvjKCfafEP/8+Vvx2ftJnHbMhgq5F4YIA==
Date: Mon, 21 Sep 2026 11:04:32 +0200
From: Arthur Crepin Leblond <arthur@marmottus.net>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v9 3/3] w5100: detect carrier state using link
 status bit and optional interrupt
Message-ID: <20260921090432.GA84626@marmottus.net>
Reply-To: arthur@marmottus.net
References: <20260918-wiznet-link-gpio-v9-0-5536f24d8d6d@marmottus.net>
 <20260918-wiznet-link-gpio-v9-3-5536f24d8d6d@marmottus.net>
 <20260919151421.2FE471F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260919151421.2FE471F000FF@smtp.kernel.org>
X-GND-Sasl: arthur@marmottus.net
X-GND-Score: 0
X-GND-Cause: dmFkZTGgWBHBy0DWBBmEWHqm0kizxMqPyqjPRcoflXLOVD1xCRWAA97ciK0B7dU0G3o/oZDUTyLVqIZ0yagT77TStZJx60dZsikvFyJUBQ9D0kW1mXA+gb7jIHbe+kOrDwdXqoq+3c7307UXdpUYAGrJ6hIPZ/goW2NLI0gUaUs77oxeO7aEa1BVroT9X/3Qbq4YEyZqMJ6u3S7EjozqNVwzW+6Zzy9xfkJu2SD5iu2/AFJtbI1lfQMQR+v7nP4h8TH5OdikCe0ziQCzVV0PSa2jinqCc6HXGQnf5dz4dnoi8pZbq9lgNWnFSU+QZikatfi8Hbw7KyVos+ATPh+aVFTPsC2kRZJ7SoQ9YuLmsPH7maOVNLPXOM3aBiRxQ3+6lOrxk2reNRyqYxsuYcyXg21E4YeouRMzNammzjZhF9WbS4cWoYyQi92eFdMimQvy7OTRrGe7v8dHXgjck82Md2lgeOYpwMOCFh/FlvAxBGNYG9QiP6LqEC/03z++6DhsQ/dew3YORnxcFfenu/Q9Y3o5hgQJHkKFNfRDIJr5Us8reCPTXfuYQuIi+CbxrW5OzcrFGVosfAQLY9u3PfZHupwekA3vVXz6BHvqsRSIyLFXb3BWAdT3HH7ZRe2XCxXKjoDNi14Pz0NiBqKFupo4IBw+H7UNHbaRncQb3rP1TJbYbOGH2g
X-GND-State: clean

On Sat, Sep 19, 2026 at 03:14:20PM +0000, sashiko-bot@kernel.org wrote:
>> @@ -448,12 +526,25 @@ static void w5100_restart(struct net_device *ndev)
>>  {
>>  	struct w5100_priv *priv = netdev_priv(ndev);
>>
>> +	if (!netif_running(ndev) || !netif_device_present(ndev))
>> +		return;
>> +
>> +	disable_irq(priv->irq);
>> +	if (priv->link_irq > 0)
>> +		disable_irq(priv->link_irq);
>> +
>
>[Severity: Medium]
>Is it safe to call disable_irq() here? disable_irq() is a sleepable function,
>but w5100_restart() can be called from atomic context when using memory-mapped
>I/O.
>
>Looking at w5100_tx_timeout(), which executes in atomic context, the timeout
>handler falls back to calling w5100_restart() directly if the device cannot
>sleep:
>
>w5100_tx_timeout() {
>    ...
>    if (priv->ops->may_sleep)
>        schedule_work(&priv->restart_work);
>    else
>        w5100_restart(ndev);
>}
>
>While current in-tree drivers might set may_sleep to true, this code path
>explicitly exists to support may_sleep == false. Could this introduce a
>'scheduling while atomic' panic for non-sleepable devices?

It looks like all the ops in the spi driver are setting may_sleep to
true but indeed disable_irq should not be called from an atomic context.

Would disable_irq_nosync just work here? enable_irq is not affected
from what I understand.

>
>>  	netif_stop_queue(ndev);
>>  	w5100_hw_reset(priv);
>> +	enable_irq(priv->irq);
>>  	w5100_hw_start(priv);
>>  	ndev->stats.tx_errors++;
>>  	netif_trans_update(ndev);
>>  	netif_wake_queue(ndev);
>> +
>> +	if (priv->link_irq > 0) {
>> +		w5500_report_carrier_state(ndev);
>> +		enable_irq(priv->link_irq);
>> +	}
>
>[Severity: Medium]
>Similarly, w5500_report_carrier_state() attempts to acquire a mutex
>(priv->link_lock).
>
>If priv->link_irq > 0 and priv->ops->may_sleep is false, wouldn't taking
>this mutex in the w5100_tx_timeout() -> w5100_restart() call chain also
>result in sleeping in atomic context?
>
>>  }
>

Maybe I could use a spin lock instead of a mutex.

Arthur
