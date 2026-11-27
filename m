Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.181.97.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779272;
	b=ZcmwNt552PyGugfKWn4Azho1KtyOfuNqbN1yDuP1ewd9XGMCJf3ND0KYFD8v6vj245yl
	 lp22iHCAg4r4Jj4GIR4IuJfUOeQB5YpQeYS9Sc3nohn5es9wau9xOJQRTiG3vLgF3X9a0
	 MNv1/e693PiZ9AdgGP6FOuXNiG1AyG9PAcr2HK7hFY6PO/Lud7QWUDdDDTBBW5hKP/6/y
	 qAmJ4zBbQaU28FfxNzhTByZKwJB12qt4OkKxZNR7EwUJc1qPKnhL9auvYn8q0NkgEIuH9
	 7kagEzCgWaMurct4LFFrMAu07wcfCX5P47wVtiGnOACvu4VBy5trUD+fAeq9IbKQJkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779272;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Anti-Virus-Server:
	 X-Virus-Status;
	bh=SZj86gxIiVs29Md6IT0R6WLIXiHy6gT1OGtgNLOe3b8=;
	b=MUkWCoXJz6iyumareDJDuVhES+OFa5WPWyMowhuJKep8JffaW04/bPv/Jq6LhEFctsbn
	 VvqxIUiv40OM4/2UnwWjSF0odmotg+B19fj6W/POkjqAQTif75Fq5z3JYhrR4B1BZSInE
	 d2MrypK0wDKzP/K9m8+4ud9zyb6Wu5S9s5xAHVtbPhvw11/k2kiocKmAkcFvvP7UGu8OZ
	 jAUgn3D28N4rs59nGElURuKOU/XU7rWxd6ym7ZUZNRaGvW2MmNDEuvvsYcKw3u2Nijj2M
	 5KZM6oJFT7JEOj37p6MeLhAPf0QTgmpV+EpbxtRDMkQ7Ml2cPDT8TjBwI9QM4h5jl+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=I-love.SAKURA.ne.jp;
	spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp;
	arc=none smtp.remote-ip=202.181.97.72
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932BF606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 11:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 932BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 6ARBY2C1066097;
	Fri, 27 Nov 2026 20:34:02 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 6ARBY268066093
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 27 Nov 2026 20:34:02 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <9c6075f2-5dff-4ede-bd15-48de2fe2e2a5@I-love.SAKURA.ne.jp>
Date: Fri, 27 Nov 2026 20:34:01 +0900
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH can] can: j1939: don't drop the last ECU reference without
 priv->lock
To: Oleksij Rempel <o.rempel@pengutronix.de>, sashiko-reviews@lists.linux.dev,
        Patrick Dahlke <me@patrickdahlke.com>
Cc: linux-can@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>,
        Oliver Hartkopp <socketcan@hartkopp.net>,
        Vincent Mailhol <mailhol@kernel.org>
References: <20261015-j1939-ecu-release-lock-v1-1-39dcb8a0f2f9@patrickdahlke.com>
 <sashiko-outbox-172364@kernel.org> <awlhvDKawNFb96WV@pengutronix.de>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <awlhvDKawNFb96WV@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav111.rs.sakura.ne.jp
X-Virus-Status: clean

On 2026/11/27 19:55, Oleksij Rempel wrote:
> Hi Patrick,
> 
> thank you for the patch and the careful testing, and sorry for the
> long silence.
> 
> On Thu, Oct 15, 2026 at 06:47:20AM +0000, sashiko-bot@kernel.org wrote:
>>> diff --git a/net/can/j1939/bus.c b/net/can/j1939/bus.c
>>> index cdc3c0a719379..ec8ee0f980fb4 100644
>>> --- a/net/can/j1939/bus.c
>>> +++ b/net/can/j1939/bus.c
>>> @@ -19,6 +19,11 @@ static void __j1939_ecu_release(struct kref *kref)
>>>  	struct j1939_ecu *ecu = container_of(kref, struct j1939_ecu, kref);
>>>  	struct j1939_priv *priv = ecu->priv;
>>>
>>> +	/* priv->ecus is protected by priv->lock, so the last reference
>>> +	 * must only be dropped with priv->lock held for writing.
>>> +	 */
>>> +	lockdep_assert_held_write(&priv->lock);
>>> +
>>>  	list_del(&ecu->list);
>>>  	netdev_put(priv->ndev, &ecu->priv_dev_tracker);
>>>  	kfree(ecu);
>>>  	j1939_priv_put(priv);
>>>  }
>>
>> [Severity: High]
>> Does enforcing this pattern cause a use-after-free of priv->lock?
>>
>> If j1939_priv_put() drops the last reference to priv, it will free
>> priv while
>> priv->lock is still held by the caller of j1939_ecu_put().
> [...]
>> Can this use-after-free be avoided by taking an explicit reference to
>> priv
>> before dropping the ECU, or deferring j1939_priv_put() outside the
>> lock?
> 
> This looks valid to me. Tetsuo is already working on that part in his
> series:
> https://lore.kernel.org/all/98c16a74-5ea7-476e-ab36-c98fb77b6be4@I-love.SAKURA.ne.jp/
> 
> Tetsuo, for your information: if I read it right, this patch addresses
> the same list corruption as "Problem 3" in your v15 1/3, in a different
> way.

Yes, this patch tries to address the same list corruption. But my patch
also addresses UAF of the timer, by deferring to WQ context and calling
hrtimer_cancel().

> 
> Regards,
> Oleksij
