Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794075788;
	b=QTt9gKIzh+WnmMGJnuKA3nKYrBTE5Ksy5y0cbDS7jxu0TN3gqyl+P3ugpMnMXyErHqiy
	 J3IXpqO0Bs19P7EJ2Y0chHVw76vcKZCT4v4gfKurNpz5qtqxcSVkfEU9pmhK8EIAT/Ez3
	 vfH9ZsFfA/bJPkX4zsMDei+tDRfoZJ2ykADEVe59uma+w+7wCTMaevrSU9LoH5CfBvMSP
	 bQuno6xfxVVCWgtc8brxwVms/rtRHe+3iewlZIIf6M9zTz+Iufmf+b9DK8+q7ExgQhJGA
	 9GbbmE7WC/18VJ5XAJvwBERpT+4Tx16Z3sKCbVnP30tMM281v0kGoH+cstbj/obw4sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794075788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=K23MhLZOcWBCytCW5qXMIV4InbcImupuRe8w+3QqX2s=;
	b=YEp9g3j/GkDi+MtrTxj2/goLo6winTuCDRxlEUhZXSBpvyoQxbILUgFWqcxRTlNMsXQv
	 EFCy9DkMDC1aORGSI4CvCIPqysSCFr2ZTHD2ZEpGBxotwo79kqvFo3oW3Mtrop0jaciTJ
	 ebXKJ4H198SyJVbaNrkOBhgyzG7KjFTjy9Uk3IGA2Cuhp1hzpFXS1T37/3Msup/yANZ0Z
	 4fMkwvzl+fbLKseiQPQ5BUjeQ76CcZF112j/876kQ2F35ncPL00tI5mBM2wgiZTvDJ8my
	 u76v5x5ccE6/mSh+4Me7p/GAxEOu1eLq266I8rrm0vFgZF2Og8OVam4YmdO+1dqmhrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bHDanQl4;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34208606A32C
	for <sashiko-reviews@lists.linux.dev>; Sat,  7 Nov 2026 18:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34208606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bHDanQl4
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d28f75d62so219806566b.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 07 Nov 2026 10:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794075787; x=1794680587; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K23MhLZOcWBCytCW5qXMIV4InbcImupuRe8w+3QqX2s=;
        b=bHDanQl4YxevLf54gsHrHKEgM6LwOmDNSoWcEGN/1WYiuJyhbRf3t9YjTjJMbKtZkJ
         BzCmLVf1l1VwQFB3WKYrdZpbARdfFhbs7MRkeGPmVJcgHdbuMzKEQuCRzq97xe3EYV4j
         XQny4EeJKzmB25D8iHj6V2f54WN+GpU2pnVsbj0o2CtzZS+S1c3BzovX7yxM0Ergl+oL
         igkJhCfuxQTL7M8PxbOyBz3Ri1l/OkO73JL15PLXsvYdgGXl1IkNXaA665oC1LA/gHQG
         ZJK8aO84wx5Vp7Er00DTMmitFslHbzrn4V24EatcOHjEfwgHUncKAuo/U8fsPYAKrTSH
         xmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794075787; x=1794680587;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K23MhLZOcWBCytCW5qXMIV4InbcImupuRe8w+3QqX2s=;
        b=NqHe+V7BfHuySC2b6AP9V2c20TDsgumTa5hsPw71r3EdPhiACKuCvPexBAu6FYqkPU
         djmfTNsue/j4c/Z1lKXrs190ypGUTf0yGm1CzoJDzuADHuVtHpFjdRkV6uxBCibzXy5u
         gogDHILojKcO7MwRd6jms+bykjoDE+cuZcQv2EBazO0BtYq+X4qDGHzpa2y2URQRj/p/
         OU6qKXcbiIxnI6S7IrPTczyOqO7bNL1Nst76FxsZuxF/r4EZDZ6bBIXWGZWGshyQGNRd
         aZR4Qqd5/G0PgqwE4RaZiW5uvJvs8R8sQKqGltyC+hWGwm2JXc7ArQvFUooaDvn1430e
         7jfA==
X-Gm-Message-State: APuU4Z+uAk0iIRSMIJzEdl4tK1LXFtOzF9LD+CDx2XXA4Qnw5pailUVu
	W4n/wJRIH3ddXIxvrvnQzoNvxrTBv0CYBeDwfQx6yulcZ2dZQFnc2Cs2BqDFtxaF
X-Gm-Gg: AYBFou2c/RlBZiw2oOEwuwuxnR78DGKqpqJAenqmSppp1EkoOpk39CUId8oW52haF+r
	fDcuu97wcD4vGqAupAQKg/oQAtqF+m+3iqggYDcp5A0M59zcImsIEmQF1az0A3K3h6CeZDHLnVX
	ygkVrQ8WTdfzIqpXTnmOxgsicyYrvj3T8UaUgtjjZegS2Hz9rxg6EYjlJVHlgg0KB1cEvbZ6zXq
	r/oKAt/p3UU/36WIxxH5o+A47xsrbU1TrDhruegKWjEQdZ2cckVdDm3fC3/9dsI5kdV0WOAdC0Z
	DUsuK3WmnD/s2RV6GAj8ynlrhEdB2f0AKjbhv0cFBZ3MF1LUWUzw+I8qWPNyJx1+el6VROEkvXs
	vt7iWbSQ5FMd9u0Tcb8DFrec1RHMG2JLGrNXdyYc80og2JrcmfNhyaM7mfmludrnhgmfFGWaUa9
	BJufu/BWcU4FPJTeatBZq+4CPA4W/EhPXnBgJIG14CU0EjXavSCy8b3+HwKyjjMpodJgb3JOsji
	o3bbGOAsQWlBlMiiv2zAwU6UqnQErN//Q2/kWOkabEvHbnPRa9I24GEp1KrngQWLmjGqAdTKxt5
	7lhH7s8WFuHCnVsi89Slilwo89JU3kMguh7v1B/82IeHqrWJs/rp/QAJkfnt0fBH310RO2pkJMU
	uqQPXeaZ/IQ==
X-Received: by 2002:a17:907:980c:b0:c41:1e13:4ba9 with SMTP id a640c23a62f3a-c4d344a8b88mr456842766b.6.1794075786536;
        Sat, 07 Nov 2026 10:23:06 -0800 (PST)
Received: from localhost (h-155-4-132-44.NA.cust.bahnhof.se. [155.4.132.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d68d53b6csm1515566b.9.2026.11.07.10.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 10:23:06 -0800 (PST)
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
Date: Sat, 07 Nov 2026 19:23:03 +0100
Message-Id: <DMP6SD3R8V63.29JPIY8YRRCIS@gmail.com>
Cc: <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] usb: musb: gadget: don't flush a waiting RX
 packet when queueing a request
From: "Elvira Khabirova" <lineprinter0@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Elvira Khabirova"
 <lineprinter0@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261107173601.63095-1-lineprinter0@gmail.com>
 <20261107173601.63095-3-lineprinter0@gmail.com>
 <sashiko-outbox-203154@kernel.org>
In-Reply-To: <sashiko-outbox-203154@kernel.org>

On Sat Nov 7, 2026 at 7:11 PM CET, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] usb: musb: gadget: premature and unlocked rx_kick queueing in
>   musb_resume()
> --
>
> commit c9ae36b9b6933c41b159c85ef258637f80341755
> Author: Elvira Khabirova <lineprinter0@gmail.com>
>
> usb: musb: gadget: don't flush a waiting RX packet when queueing a reques=
t
>
> This commit replaces the RX FIFO flush in musb_ep_restart() with a
> system_bh_wq work item (rx_kick) to process waiting RX packets when a
> request is queued or after an in-progress giveback finishes.
>
>> diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
>> index 73ac25f53698f..38469727acc6f 100644
>> --- a/drivers/usb/musb/musb_core.c
>> +++ b/drivers/usb/musb/musb_core.c
> [ ... ]
>> @@ -2866,6 +2868,7 @@ static int musb_resume(struct device *dev)
>>  	if ((devctl & mask) !=3D (musb->context.devctl & mask))
>>  		musb->port1_status =3D 0;
>> =20
>> +	musb_gadget_enable_rx_kicks(musb);
>>  	musb_enable_interrupts(musb);
>>  	musb_platform_enable(musb);
>> =20
>> diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadg=
et.c
>> index b500e0d8b0bd3..08bb605aa0b31 100644
>> --- a/drivers/usb/musb/musb_gadget.c
>> +++ b/drivers/usb/musb/musb_gadget.c
> [ ... ]
>> +static void musb_g_enable_rx_kick(struct musb *musb, struct musb_ep *mu=
sb_ep)
>> +{
>> +	if (!musb_ep->rx_kick.func)
>> +		return;
>> +
>> +	enable_work(&musb_ep->rx_kick);
>> +	if (musb_ep->desc && !musb_ep->is_in) {
>> +		pm_runtime_get_noresume(musb->controller);
>> +		if (!queue_work(system_bh_wq, &musb_ep->rx_kick))
>> +			pm_runtime_put_noidle(musb->controller);
>> +	}
>> +}
>> +
>> +void musb_gadget_enable_rx_kicks(struct musb *musb)
>> +{
>> +	int i;
>> +
>> +	for (i =3D 0; i < musb->nr_endpoints; i++) {
>> +		musb_g_enable_rx_kick(musb, &musb->endpoints[i].ep_in);
>> +		musb_g_enable_rx_kick(musb, &musb->endpoints[i].ep_out);
>> +	}
>> +}
>
> [Severity: Medium]
> Can calling musb_gadget_enable_rx_kicks() unlocked before
> musb_enable_interrupts() and musb_platform_enable() in musb_resume()
> wedge an OUT endpoint or race on endpoint and interrupt state?
>
> During system suspend, musb_suspend() calls pm_runtime_get_sync() (leavin=
g
> musb->is_runtime_suspended at 0) and musb_disable_interrupts(), which
> zeros musb->intrtxe, musb->intrrxe, MUSB_INTRTXE, and MUSB_INTRRXE.  On
> resume, musb_restore_context() writes those zeroed masks back to hardware
> before musb_gadget_enable_rx_kicks() queues rx_kick on system_bh_wq:
>
> CPU0                                  CPU1 (system_bh_wq)
> musb_resume()
>   musb_restore_context()
>     /* MUSB_INTRRXE is 0 */
>   musb_gadget_enable_rx_kicks()
>     queue_work(..., &musb_ep->rx_kick)
>                                       musb_g_rx_kick()
>                                         musb_g_rx()
>                                           rxstate()
>                                             /* clears RXPKTRDY */
>                                       /* next host packet arrives while
>                                        * MUSB_INTRRXE =3D=3D 0 or platfor=
m
>                                        * interrupts are still disabled
>                                        * <-- IRQ lost, endpoint wedged */
>   musb_enable_interrupts()
>   musb_platform_enable()
>
> In addition, musb_g_enable_rx_kick() inspects musb_ep->desc and
> musb_ep->is_in without holding musb->lock, and if musb_g_rx_kick()
> completes a request via musb_g_giveback() before musb_enable_interrupts()
> runs, the gadget completion callback (or a thread it wakes) can call
> usb_ep_enable() or usb_ep_disable() and modify musb->intrrxe,
> musb->intrtxe, and musb_ep->desc concurrently with the unlocked loop in
> musb_gadget_enable_rx_kicks() and musb_enable_interrupts().
>
> Calling musb_gadget_enable_rx_kicks() under musb->lock (or splitting
> enable_work() from queuing rx_kick under musb->lock) after
> musb_enable_interrupts() and musb_platform_enable() would avoid this.

Makes sense. Will be back with a v4 shortly.
