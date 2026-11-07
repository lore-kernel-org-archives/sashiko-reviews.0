Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794053570;
	b=HFYIzdwtV+zUbiVj1vaXm16PgMxU4j7fSOFbXIuwVJAbsL9dVTKfSTbR2D9eOIpTOnJ4
	 /0gl6VhFpN4A5MNtS5j/xOFrw/wqNBQnP3PK0TRIyf6UVG52Zi/cx75qgbUV1v4dtvwQQ
	 2Sc02uzQXmqh7IEhQEuzwdf8PPFNjkHo3Byh0ijHklA16Png81IeNy15e3iaCVtHBAXUR
	 2H0AiB2ImMBtThck9nvheSL2FX6BIWaQB/onMG+udw5MF5+qMQ07X5LSJx3BgIsFU2EgA
	 wv6gxsxRIXP+BJ3+ZBCvul8CsZspQ9ldaDteOa29xVMk63n77tonqh4+WBaCyZM+8jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794053570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=joOmkXSw0O2SmDMQYKP/KK+arA5jKruVL2WAfyianeE=;
	b=EuWKXC+zoVkdqEWg8PtEc6HPxczfahkuRjt2WyRE+SF7ia+GMqsbbpHwSSfI5YLrcn1W
	 s/AQV8mCRi8PJF7hlP0ylobyxiHeSN8iRU2aPcrc0ZdTX9Ye5GIIGbB2u6pDacnq+HUKJ
	 5bv9Nl1IQxbfgqf8fH8Ec1rc7/g7Q1hSW90fT5NLpG490lmqoqeDeph6WtBx/dfNc7hOR
	 2ONR5H4HZ9hFBsIW6fwOCCdglpPs2aMFcCrnVyZiCdxfNXb+3eE39SghG0OcHF+T0g/Ox
	 VFwdNDcLq6nw4lk+iB5kw7p+vDWZ77Era22GDbD+gM3Tzj/DmgcjYh5v7HoaBHK/7Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qzbAYbFY;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF412606A326
	for <sashiko-reviews@lists.linux.dev>; Sat,  7 Nov 2026 12:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF412606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qzbAYbFY
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso1799595a12.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 07 Nov 2026 04:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794053568; x=1794658368; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=joOmkXSw0O2SmDMQYKP/KK+arA5jKruVL2WAfyianeE=;
        b=qzbAYbFYg6ooIkr18Pbrfh8Uc9j4+glllQS8nJC1kBHYF/6r4xqTDnfGf/uYOej2IM
         7GOItMGad9O6nqDpbiM+7da7m16AkwOa6SEWeReIf8u8Tpd9tgflLMNYY+PpZNUdsR25
         2GuQExuz8HQNKyeIVhhU5l4ixNN5IEM6eCkctXkQbEZIJ36kiLvSX8oY1f9N3hL5Vg0r
         7Pjrf5jtGUuqh/JUf72Aymy+VY/n6OKye6LuNnZuXJCWuoFDI7gX7ApKgYhZq/3BtOtK
         NO1l/VH1XI5XAlwNQnIAQY/aoTpFmwp7ttcdJjFmTj93n4jOLRBHccKzJKkVbifTCKzb
         3Bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794053568; x=1794658368;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=joOmkXSw0O2SmDMQYKP/KK+arA5jKruVL2WAfyianeE=;
        b=WpNycYhCtUVvCvNwzRgI3FVdIXzMLtr1mqN96ffzeMTPtXDufjCZItoIfBo7HeDzzS
         skUTr5S5N2xzIRtXY0GDk33CLr7s/oOSCgPm+GKRQzZ6tM9ejz490XtdHMWdfA8NJi59
         SnNyX5Ax7Px25LNwyTXcgPwMGwbCK1/o5oJB61pT0bYH6b0B5q95FlS8+5AdUxjhAojx
         v6K82sRDapj8iYgZbak0IJ31t1M4FnGdb5OWU4ObTzczEYpsZ8sZR7K808JroUAxEaJz
         /NjkHakBAUT7RpNYJQgsv3uHat1RiGPHmpnon35SCz0r+QLbRt3/f/qKUZXpqbG9BkNH
         mmTA==
X-Gm-Message-State: APuU4Z9ct0TFnuczQtSP/6QUFDSCPcltr6kxj0pxh3kydVc+nuzbahF9
	6UuYF+DPFxtNcT8ipcBakZ0tljP72fj8mkHFEMp43nzJTZNiMEjOrMIlN0VW3SUm
X-Gm-Gg: AYBFou3QkSkvxrwrLi/qnPnh62dxkiCVPVbztxzpNESLLNmzYEuUZDido0cy9DOsht1
	mapLyoUFTO/lVzgHFdYBhksvNKXI2nwA9dFISd9rfGh4ovCZYTRockVU0EsSUeyatRI4msMgxVk
	R4FDBJqd4dltKPd+MKE3waHWsaUFp1pRBJu/6QM4MQbLf/ZlqWKa4q7357kXAfuo9+IRwKA8Ztm
	9k+T4YurSwTrABasM4RIGhryuZC+eX/VUSgQnEA2EjNXV/+ALTwlv+wcZgZs9RtO2vfdO6eJYvE
	o3Uy0dEaouy4d9ar3+tBH++0Z2Cil3nHwj6eik2bxRil8zC5njGCNCO2Umuu0slQw8cf9/R5FDG
	mxMNlCOFht1TUu8Q47JqZ/4LDySIOyHGpI+BioQaFiGQGS1G48soW87Mz/+uDFE8pdMmpcXzIhe
	4fokZTydSkW9rWTrWkyiA/2bKZTZNwZR6O+GGBA8SdSBG1qtGZmJOPnPMqIJW6ptcHHynSg/7bW
	prm88jp9ELsKBca4MV7Nj8S0OSDuYz+b5VKLAUyYRlpivZjLMUtfUDo34JkKsJl2QgsiA+B61sx
	vjldIE0t2ZoW5qeVEwwiWUw95At60JDhESHnO8sptUjhVUuQF/IJ6DsyODfQNGKC
X-Received: by 2002:a05:6402:4143:b0:6b1:8316:ba32 with SMTP id 4fb4d7f45d1cf-6b5977e97d9mr4204070a12.17.1794053567981;
        Sat, 07 Nov 2026 04:12:47 -0800 (PST)
Received: from localhost (h-155-4-132-44.NA.cust.bahnhof.se. [155.4.132.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664b0239csm1854101a12.26.2026.11.07.04.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 04:12:47 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Nov 2026 13:12:45 +0100
Message-Id: <DMOYWU5HB1UM.BQG0BZT7RFCP@gmail.com>
Cc: <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: musb: gadget: don't flush a waiting RX packet
 when queueing a request
From: "Elvira Khabirova" <lineprinter0@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Elvira Khabirova"
 <lineprinter0@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261107105505.6554-1-lineprinter0@gmail.com>
 <sashiko-outbox-202856@kernel.org>
In-Reply-To: <sashiko-outbox-202856@kernel.org>

On Sat Nov 7, 2026 at 12:30 PM CET, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] usb: musb: gadget: overlapping musb_g_giveback() calls wedge
>   ep->busy
> - [High] usb: musb: gadget: race and ordering bug in
>   musb_gadget_disable() for rx_kick
> - [Medium] usb: musb: gadget: lost rx_kick across system suspend and
>   resume
> --
>
> commit cef9b9e2278bf856fd53af421c899c0ae67866b7
> Author: Elvira Khabirova <lineprinter0@gmail.com>
>
> usb: musb: gadget: don't flush a waiting RX packet when queueing a reques=
t
>
> This commit replaces the RX FIFO flush in musb_ep_restart() with a
> system_bh_wq work item that invokes musb_g_rx(), and defers RX processing
> via ep->rx_kick_deferred while ep->busy is set.
>
>> diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadg=
et.c
>> index 016d3f3fc1e05..c71c60efe5106 100644
>> --- a/drivers/usb/musb/musb_gadget.c
>> +++ b/drivers/usb/musb/musb_gadget.c
>> @@ -148,6 +148,21 @@ __acquires(ep->musb->lock)
>>  	usb_gadget_giveback_request(&req->ep->end_point, &req->request);
>>  	spin_lock(&musb->lock);
>>  	ep->busy =3D busy;
>> +
>> +	if (!ep->busy && ep->rx_kick_deferred) {
>> +		ep->rx_kick_deferred =3D false;
>> +		if (!queue_work(system_bh_wq, &ep->rx_kick))
>> +			pm_runtime_put_noidle(musb->controller);
>> +	}
>> +}
>
> [Severity: High]
> Can overlapping musb_g_giveback() calls finish out of LIFO order and leav=
e
> ep->busy permanently stuck at 1?
>
> musb_g_giveback() saves ep->busy in a stack variable, sets ep->busy =3D 1=
,
> and drops musb->lock around usb_gadget_giveback_request().  With RX
> givebacks running in system_bh_wq, a second giveback on the same endpoint
> (for example via musb_gadget_dequeue(), which enters musb_g_giveback()
> when musb_ep->busy is set) can overlap on another CPU:
>
> CPU0                              CPU1
> musb_g_rx_kick()
>   musb_g_rx()
>     musb_g_giveback()
>       busy =3D ep->busy; // 0
>       ep->busy =3D 1;
>       spin_unlock(&musb->lock)
>       usb_gadget_giveback_request()
>                                   musb_gadget_dequeue()
>                                     spin_lock_irqsave(&musb->lock, ...)
>                                     musb_g_giveback()
>                                       busy =3D ep->busy; // 1
>                                       ep->busy =3D 1;
>                                       spin_unlock(&musb->lock)
>                                       usb_gadget_giveback_request()
>       spin_lock(&musb->lock)
>       ep->busy =3D 0;
>       queue_work(..., &ep->rx_kick)
>       spin_unlock(&musb->lock)
>                                       spin_lock(&musb->lock)
>                                       ep->busy =3D 1;  <-- stuck at 1
>
> First, CPU0 clears ep->busy to 0 and schedules ep->rx_kick while CPU1 is
> still in usb_gadget_giveback_request().  Second, when CPU1 finishes, it
> writes its saved busy =3D 1 back to ep->busy.  After that, every subseque=
nt
> musb_g_rx(), musb_g_rx_kick(), and musb_gadget_queue() call sees
> ep->busy =3D=3D 1 and defers work forever, wedging the endpoint and leaki=
ng
> the runtime PM reference taken by musb_g_defer_rx_kick().
>
> Making ep->busy an active giveback counter (incremented before dropping
> musb->lock and decremented after re-acquiring it) would ensure ep->busy
> only reaches 0 when the last giveback completes.

Yes, that is possible, but this is a pre-existing bug. I even have
a separate patch prepared to make `busy` a counter instead of a flag.
This patch does not aggravate this problem.
The same race is possible between a dequeue and a HW IRQ.

>> @@ -1111,6 +1137,12 @@ static int musb_gadget_disable(struct usb_ep *ep)
>> =20
>>  	/* abort all pending DMA and requests */
>>  	nuke(musb_ep, -ESHUTDOWN);
>> +	if (cancel_work(&musb_ep->rx_kick))
>> +		pm_runtime_put_autosuspend(musb->controller);
>> +	if (musb_ep->rx_kick_deferred) {
>> +		musb_ep->rx_kick_deferred =3D false;
>> +		pm_runtime_put_autosuspend(musb->controller);
>> +	}
>> =20
>>  	musb_ep->desc =3D NULL;
>>  	musb_ep->end_point.desc =3D NULL;
>
> [Severity: High]
> Can musb_g_rx_kick() run while nuke() drops musb->lock or after the
> endpoint is re-enabled?
>
> Because musb_ep->desc is cleared after nuke(), musb->lock is dropped
> inside nuke() -> musb_g_giveback() while musb_ep->desc is still non-NULL.
> If an earlier giveback on another CPU finishes during that window, it
> restores ep->busy =3D 0 and queues ep->rx_kick, allowing musb_g_rx_kick()=
 ->
> musb_g_rx() -> rxstate() to run after nuke() has already freed
> musb_ep->dma.

Good catch, and actually I think this can be resolved with making
ep->busy a counter instead.
I will send them together as a series for v3.

> In addition, cancel_work() is non-synchronous:
>
> CPU0                              CPU1
>                                   <softirq>
>                                   musb_g_rx_kick()
>                                     // waiting for musb->lock
> musb_gadget_disable()
>   spin_lock_irqsave(&musb->lock, ...)
>   cancel_work(&musb_ep->rx_kick) // false
>   musb_ep->desc =3D NULL;
>   spin_unlock_irqrestore(&musb->lock, ...)
> musb_gadget_enable()
>   spin_lock_irqsave(&musb->lock, ...)
>   musb_ep->desc =3D desc;
>   musb_ep->busy =3D 0;
>   spin_unlock_irqrestore(&musb->lock, ...)
>                                     spin_lock_irqsave(&musb->lock, ...)
>                                     if (!musb_ep->desc || ...) // false
>                                     musb_g_rx()  <-- stale kick runs
>
> Clearing musb_ep->desc and musb_ep->end_point.desc before calling nuke()
> prevents musb_g_rx_kick() and musb_gadget_queue() from acting on the
> endpoint while nuke() drops musb->lock, and prevented stale kicks will se=
e
> the updated state if musb_gadget_enable() also cancels any pending
> rx_kick.

Is this any different from before the patch, with a HW IRQ?
I think a stale kick handles everything well, if there is no work,
musb_g_rx() just returns.

>> @@ -1810,6 +1881,36 @@ void musb_gadget_cleanup(struct musb *musb)
>> =20
>>  	cancel_delayed_work_sync(&musb->gadget_work);
>>  	usb_del_gadget_udc(&musb->g);
>> +
>> +	musb_gadget_disable_rx_kicks(musb);
>> +}
>> +
>> +static void musb_g_disable_rx_kick(struct musb *musb, struct musb_ep *m=
usb_ep)
>> +{
>> +	if (musb_ep->rx_kick.func && disable_work_sync(&musb_ep->rx_kick))
>> +		pm_runtime_put_noidle(musb->controller);
>> +}
>> +
>> +void musb_gadget_disable_rx_kicks(struct musb *musb)
>> +{
>> +	int i;
>> +
>> +	for (i =3D 0; i < musb->nr_endpoints; i++) {
>> +		musb_g_disable_rx_kick(musb, &musb->endpoints[i].ep_in);
>> +		musb_g_disable_rx_kick(musb, &musb->endpoints[i].ep_out);
>> +	}
>> +}
>> +
>> +void musb_gadget_enable_rx_kicks(struct musb *musb)
>> +{
>> +	int i;
>> +
>> +	for (i =3D 0; i < musb->nr_endpoints; i++) {
>> +		if (musb->endpoints[i].ep_in.rx_kick.func)
>> +			enable_work(&musb->endpoints[i].ep_in.rx_kick);
>> +		if (musb->endpoints[i].ep_out.rx_kick.func)
>> +			enable_work(&musb->endpoints[i].ep_out.rx_kick);
>> +	}
>>  }
>
> [Severity: Medium]
> Does musb_gadget_disable_rx_kicks() lose a pending or deferred rx_kick
> across system suspend and resume?
>
> If ep->rx_kick is pending when musb_suspend() calls disable_work_sync(),
> the work item is cancelled and its runtime PM reference is dropped, or if
> musb_g_rx_kick() is currently in musb_g_giveback() with
> ep->rx_kick_deferred set, disable_work_sync() marks ep->rx_kick disabled
> before waiting for completion so queue_work() in musb_g_giveback() fails.
> On resume, musb_gadget_enable_rx_kicks() only calls enable_work(), which
> does not re-queue the cancelled work.  When the USB session is preserved
> across suspend/resume (such as with MUSB_PRESERVE_SESSION or standby),
> MUSB_RXCSR_RXPKTRDY remains set in hardware with no interrupt to
> re-trigger it, stalling RX on the endpoint.

I see, I wish I had more hardware to test on.
This seems to be possible on da8xx.
I will find a way to re-queue the cancelled work items for v3.
