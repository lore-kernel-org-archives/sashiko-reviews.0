Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44D6478E52
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 10:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987386; cv=none; b=UiQLTE1yL9qt3Aoj518EVRsBSz7OwPgyPJOYzgOOj9BdifQu9KVUbbntUqvhimNyewCmpXtjyMJE3Ivdc3+JIWzyvxiqcOgt0DDYOiWs9+TNLXhAFpUMiutHn1R495eE6pwGvotmjfTHJ3F+xIPvawgJG/aAXaM4pLqlavDq+M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987386; c=relaxed/simple;
	bh=YiB1rT1BLZ4iTmSDC5HQ8BhCwfePYdi/rMv0Hoez/Nc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=om2KFiqsxFhLERP83IbE6Stke5KDM/uKf9JMcfMLb2vTPMf3fugCNy9u3EwsgYghgPHy4YmowhcAdCus08b+j7H0fB7UtWa6lk2xg6x3+xVS0iSxWF2SQUcW69k+UYZgeZ+AYhPpozcSUqeHE1Tif6vYv96HkhArZbg+H3GSqow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net; spf=pass smtp.mailfrom=marmottus.net; dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b=bS0knvca; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marmottus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b="bS0knvca"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85BD03EBD5;
	Mon, 21 Sep 2026 10:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marmottus.net;
	s=gm1; t=1789987376; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=OWQA8Op92XVd4S/Z25ofdeqyhu6F+swOiKuyb8CmnoE=;
	b=bS0knvcaya0afHLl7IYK4s4vBNcxvYMcjoey7fnA9mqbmUbFZGjRSluETKtP8zdwhC6Oao
	lIZPpNP17/XhGS0U5iRcrCNuvwDUsTgfl+w6RNDEfgzCXIwomiVh9aGJ6z0mjVBk3Lcwfa
	W2TFdxipxT2jhAQ77fpeecM2ObxrQ/IQMZiB1QfWBDPvAXtJ4oav5U9FWgYOA/WOWWjgVQ
	XiEmXYy/sDeKAwsDp3FJ3AdTKvAwC+wVYPetp/6BGAnDwC/ZZXfDKAaeQN8wMAJ06O2xnL
	gq9IepJk+kO0R+55PwOkNHivBoDAJOVk57b0VHefDIa7cUfPpxIaG3kKCCjvsQ==
Date: Mon, 21 Sep 2026 12:42:53 +0200
From: Arthur Crepin Leblond <arthur@marmottus.net>
To: sashiko-reviews@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v9 3/3] w5100: detect carrier state using link
 status bit and optional interrupt
Message-ID: <20260921104253.GA248881@marmottus.net>
Reply-To: arthur@marmottus.net
References: <20260918-wiznet-link-gpio-v9-0-5536f24d8d6d@marmottus.net>
 <20260918-wiznet-link-gpio-v9-3-5536f24d8d6d@marmottus.net>
 <20260919151421.2FE471F000FF@smtp.kernel.org>
 <20260921090432.GA84626@marmottus.net>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260921090432.GA84626@marmottus.net>
X-GND-Sasl: arthur@marmottus.net
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: dmFkZTFc5sjDS5yO4DZdkaYQ5GCOekVxOEqqhhqOW1dL0dTUSDsz3qMcGoxcC2rL2B2zmd7stoEaWVqWHj2Y5ZrSXMfQ6nlZJ6OCSoXs0zUAgRyxSU05QON6rYRbpt8XEO3oYSIm1BJqW0O+K9n7lCjNBbktj3NZQf8en2UtDFUGyGGWKong6ve1DUr2L6cd3Rolm0WVlLECSn5H4WA6B+uh7z97RlxlZXz5fU7INKHtBgZceDNZlAIj3W4eSWfcAX1Qe43Dz3ZCaHzhWZdMx8KPL2H0f48PN0BwxISVxR9DMmpfmOTc3QpctcqMv2ClKukCa2aGJ7EpW4l28FOJE8rgsJ/7B1uTYzIobixyFRCvI5tHdlNQn0Z+SKl+SN7RKpYLL0yOlDc6qa5fOQmAh1sPBDT+/w6sKttvhMjZM9gniM7PyVE5J9QAUvvFXAGCL3lvpIJruLmrQEgSzyxIX6Mz3VSEzd9zNa9g2uAiORBjQQJCh+DwHoxADdp9a9RyYyQXfD9Z1i7nuhnQtABthA60EXOYRj562yZQdh6ydk4cp90fzjaFx+Y84SWUGXdf6cxwfvPydv7iuc3hQ9iWfrnaEZ9lkQfIosA5A7pFT7IwcVLw//7fqxfR1QF13nSGZ7xmimcFNy1QmMrpfS73GIxqX8AOw5xCmsu2pvSgQUUOkA5MRw

On Mon, Sep 21, 2026 at 11:04:34AM +0200, Arthur Crepin Leblond wrote:
>On Sat, Sep 19, 2026 at 03:14:20PM +0000, sashiko-bot@kernel.org wrote:
>>>@@ -448,12 +526,25 @@ static void w5100_restart(struct net_device *ndev)
>>> {
>>> 	struct w5100_priv *priv = netdev_priv(ndev);
>>>
>>>+	if (!netif_running(ndev) || !netif_device_present(ndev))
>>>+		return;
>>>+
>>>+	disable_irq(priv->irq);
>>>+	if (priv->link_irq > 0)
>>>+		disable_irq(priv->link_irq);
>>>+
>>
>>[Severity: Medium]
>>Is it safe to call disable_irq() here? disable_irq() is a sleepable function,
>>but w5100_restart() can be called from atomic context when using memory-mapped
>>I/O.
>>
>>Looking at w5100_tx_timeout(), which executes in atomic context, the timeout
>>handler falls back to calling w5100_restart() directly if the device cannot
>>sleep:
>>
>>w5100_tx_timeout() {
>>   ...
>>   if (priv->ops->may_sleep)
>>       schedule_work(&priv->restart_work);
>>   else
>>       w5100_restart(ndev);
>>}
>>
>>While current in-tree drivers might set may_sleep to true, this code path
>>explicitly exists to support may_sleep == false. Could this introduce a
>>'scheduling while atomic' panic for non-sleepable devices?
>
>It looks like all the ops in the spi driver are setting may_sleep to
>true but indeed disable_irq should not be called from an atomic context.
>
>Would disable_irq_nosync just work here? enable_irq is not affected
>from what I understand.
>
>>
>>> 	netif_stop_queue(ndev);
>>> 	w5100_hw_reset(priv);
>>>+	enable_irq(priv->irq);
>>> 	w5100_hw_start(priv);
>>> 	ndev->stats.tx_errors++;
>>> 	netif_trans_update(ndev);
>>> 	netif_wake_queue(ndev);
>>>+
>>>+	if (priv->link_irq > 0) {
>>>+		w5500_report_carrier_state(ndev);
>>>+		enable_irq(priv->link_irq);
>>>+	}
>>
>>[Severity: Medium]
>>Similarly, w5500_report_carrier_state() attempts to acquire a mutex
>>(priv->link_lock).
>>
>>If priv->link_irq > 0 and priv->ops->may_sleep is false, wouldn't taking
>>this mutex in the w5100_tx_timeout() -> w5100_restart() call chain also
>>result in sleeping in atomic context?
>>
>>> }
>>
>
>Maybe I could use a spin lock instead of a mutex.
>
>Arthur

The easiest is probably to always run w5100_restart in worker.

Arthur
