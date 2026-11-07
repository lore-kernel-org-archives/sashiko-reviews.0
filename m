Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794092904;
	b=Qz4twVEo3Pah8EZmRkRkQS7SSJrxPYjTjaNUKoLdXXnw8FiWNT6wq2movt3deNUdTzL9
	 SxFEbx9ivLRQ+jm53CXNs9VPvVY4jWbg2GmzmbjcQD5SXD/nhihxQfciopVioT6VGJZux
	 q+SNr7b2WpktwBPWeAUPYoA/jP/qVOjNzoyrKqGaYWZ3pr4dsbN5d3QbskXx2StklOzci
	 pHRns2A5Csxyksvk1NFsaj+YfhrkMdmJQq8fc++v1hiYeaz3iCywKLOBZcVY5ei9/XzRK
	 K4OwxmH/ljcBq2EKVlaohhLqmAe1bXq/zEf321iyg27BDMCl/YO3Ixth0AaBOyVqpbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794092904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:Cc:
	 Subject:X-Mailer:References:In-Reply-To;
	bh=RiWWFK5Yf30SlopCjvVOtFqcpYgrQCHqfBBIPIoZ+9w=;
	b=LNsNomys5Jo+QhDG1XlUT051Qza1cm3T85N3hMmvVPofGKQstRfF4IfZhC3GcoxuVPLW
	 6xmeV+DeUiXUbaju4tOQ3Q4aRZCa7GZL8EUTCWOXbgOREkD86bTfMdjEHw9sil6QyM6WD
	 EQj/ozhbmplDXj1BsUHgjU0/0lQBrtMc/5t0WabgLhFJZTKCU4kVsDE2cboSyL4Z7CttS
	 m2u5npfxiS7DPx4du4wNb9VrrcE0p9cSKs/Ui8MdY5hyYdOn+P3gTHp3TrVJ6sAkwtfFu
	 8vbqwtunnjNa2aqt9YsM9+8GNCqCIDXGbx26mPtB+yFVYBO8vQ49Qu4FwQcFCSl9iyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qiDVIL5E;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FC6606A32C
	for <sashiko-reviews@lists.linux.dev>; Sat,  7 Nov 2026 23:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12FC6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qiDVIL5E
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c445c95d553so6723766b.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 07 Nov 2026 15:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794092902; x=1794697702; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RiWWFK5Yf30SlopCjvVOtFqcpYgrQCHqfBBIPIoZ+9w=;
        b=qiDVIL5E0BTg10uYZpwzpPXmkBaIrQvm1KRxdh9h4g0X6fWhfQB41SFbjVaLqaaxW7
         znh1mxGbO4Ivdp5xNDPykdbxZDgaXLUbtkfcbt5+t4s66fjgxqdMow+MnT84ebnfjxzW
         /CyAbDg06ED5aQeaa0HBcQoXWJofOpW2BR8C5PtQ2gbAa+OVgtjLcHSR1hWBI0aF9vZV
         bgPbqYlPd0LcfU5PuNXUqmtQV8gbM+7GhAabVKdxQLR91pN22/fbuxtzX71NuQFUDyUl
         y5AJzvswi4oTsKT3qol3cDOydTGW4ZZ3gxAJF+sB/Q5SAv32KqH+NY/ORV6DHc7gN9mx
         7s4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794092902; x=1794697702;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RiWWFK5Yf30SlopCjvVOtFqcpYgrQCHqfBBIPIoZ+9w=;
        b=OfDqozSaWzyZDmqvjBis8Y6S3LbSmSgE/LOzsDxLogJ4EtMhjQF5KVuU5X9+Wski75
         +QBHk768TSgVjhOncOflFmkzaTMAfLtMmAxHRKK5XMgFw7Q7lG1tJ0Hq+M3U6WQ8JCf0
         lH7E2udr0qGCF7ZlpbF/nFDbWfLkBd8KG74bQeBFfH1ay0nZrWtZupfcF/gIM7QgCrUq
         GngzgsRnQCh93cM0BcuGFQiplyG7vnLgo29dR1r9vlxz1Exa9d5oYKD/sVCZwzrzGgf6
         ErBR9WT3QHv0Nd9ZvPhAfRtF6gGnFA24gW9qOFC7xRFEQr5UQnwiQ41R8ARpfHosHnOj
         Z6zQ==
X-Gm-Message-State: APuU4Z/nR7DRagGue+q0Tbe1yJ61oXMFC9gZjT4zoGHgs18MTufI6Wkb
	FhVffPEuKBLleWSUk7hTND43N3Z7ccJEvocRgcXqk2RzyDxz/NCA9UJX5I2hBytK
X-Gm-Gg: AYBFou0NcvfH98QNP2NMfGc0lrlDBjJ8WDA8dTXbP230vtjEXazoNNnjb9gv3uYU1mU
	3tHx/MBDsvxbKneysQamkijKhuE/8+kuk3HUi+wEDNpq7N8NVbltDbM5ehm8j4wUn9jQaHtXB1f
	MpiDSZYma43wD1IkPEWg4/nZYdQBA6KHUVyXYkslEODzcJkNOXmN6foYoFJgFzCkw1LkCsTntX/
	v8UeRvx45Oili35jvtHXQypq/1KSPFJ0XdY7Gx4CFYH98DlEbBZCw2nUOoVsy7JFg/QAk40Z6NC
	kHtW7ZsOIpODOmLNEoiABTyj3MiSia/xRZK6rjFfUZCrAcXYvlkVADj5ot0ndFlPSLXfRCs2T5z
	ivCD3SipAr3Eh7ZGlIK1vDECfYe1oKl70llgtJ/qYz66Br41oQI6K3qHKTK9p4L49aJdPw1nJUX
	hzfoo+3a2LyYNjRx6Vt1rZ8rSgkKBb2+vyhl7a7ndGZKOcvg/vnz82xR64vX27XG3/sI2A/MGgO
	kORhWmAqQb32pLbvsLr+X2urlQ+sJldMTrbQkRbYL03aJAfA3ySTckKHAWhZ9hDGVZy0rwgnmwM
	OXHqbHuB+XSzDaPidXOTog8ISHGgneHiqUvTFp4r991B+rNRF5bG6UTdkkbn0RXp
X-Received: by 2002:a17:907:1b18:b0:c49:8f1e:af0a with SMTP id a640c23a62f3a-c4d6d160d03mr24113766b.7.1794092902179;
        Sat, 07 Nov 2026 15:08:22 -0800 (PST)
Received: from localhost (h-155-4-132-44.NA.cust.bahnhof.se. [155.4.132.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a474b2bsm16348966b.35.2026.11.07.15.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 15:08:21 -0800 (PST)
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
Date: Sun, 08 Nov 2026 00:08:19 +0100
Message-Id: <DMPCURRCFE4Q.1OLZYCFH1GY27@gmail.com>
From: "Elvira Khabirova" <lineprinter0@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Elvira Khabirova"
 <lineprinter0@gmail.com>
Cc: <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] usb: musb: gadget: count givebacks in busy
X-Mailer: aerc 0.22.0
References: <20261107221904.82487-1-lineprinter0@gmail.com>
 <20261107221904.82487-2-lineprinter0@gmail.com>
 <sashiko-outbox-203368@kernel.org>
In-Reply-To: <sashiko-outbox-203368@kernel.org>

On Sat Nov 7, 2026 at 11:35 PM CET, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] usb: musb: gadget: no TX restart when busy drops to 0 in
>   musb_g_giveback()
> - [Low] usb: musb: gadget: missing Fixes trailer for ep->busy race fix
> --
>
> commit 38e2611af12585f304377ba06a8095186ff11968
> Author: Elvira Khabirova <lineprinter0@gmail.com>
>
>> usb: musb: gadget: count givebacks in busy
>>
>> The ep->busy flag is used by musb_g_giveback() to signal that
>> req->complete() is running on an endpoint, the ep is busy and
>> starting a new request is not appropriate right now.
>>
>> It is only a flag and not a counter currently;
>> musb_g_giveback() saves the old ep->busy value, sets busy to 1,
>> releases musb->lock, runs req->complete(), restores the old ep->busy.
>> This works when there is no possibility of two musb_g_giveback()s
>> running in parallel.
>>
>> This does not work when musb_gadget_dequeue()->...->musb_g_giveback()
>> happens at the same time as musb_interrupt()->...->musb_g_giveback().
>> The above save-then-restore can get the busy flag stuck at 1.
>>
>>   CPU0 (interrupt)                CPU1 (usb_ep_dequeue())
>>   giveback: saved 0, busy =3D 1
>>   unlock, ->complete()
>>                                   giveback: saved 1, busy =3D 1
>>                                   unlock, ->complete()
>>   lock, busy =3D 0
>>                                   lock, busy =3D 1
>>
>> ...and this gets the entire endpoint stuck.
>>
>> This was reproduced and the patch was tested on a Pine A64+
>> (Allwinner A64, four cores, no DMA) with PREEMPT_DYNAMIC and lockdep,
>> using a specially constructed f_fs function that keeps two AIO requests
>> queued on a bulk endpoint and cancels the newer one with io_cancel(),
>> in a loop. Tested with both a bulk IN and a bulk OUT endpoint.
>>
>> If musb_g_giveback() were to be started from some other context,
>> the same issue would come up.
>>
>> "Promote" ep->busy from a flag to a counter.
>>
>> musb_gadget_enable() should not reset `busy` to 0 anymore because
>> musb_g_giveback() decrements busy, and if these two run in parallel,
>> it would be problematic (cause an underflow).
>>
>> Signed-off-by: Elvira Khabirova <lineprinter0@gmail.com>
>
> [Severity: Low]
> Should this concurrency fix include a Fixes tag?
>
>   Fixes: 550a7375fe72 ("USB: Add MUSB and TUSB support")

Feels useless to mark this as "Fixes" for a commit from 2008
that brings MUSB support.

>> diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadg=
et.c
>> index 016d3f3fc1e05..b500e0d8b0bd3 100644
>> --- a/drivers/usb/musb/musb_gadget.c
>> +++ b/drivers/usb/musb/musb_gadget.c
>> @@ -129,7 +129,6 @@ __acquires(ep->musb->lock)
>>  {
>>  	struct musb_request	*req;
>>  	struct musb		*musb;
>> -	int			busy =3D ep->busy;
>> =20
>>  	req =3D to_musb_request(request);
>> =20
>> @@ -138,7 +137,7 @@ __acquires(ep->musb->lock)
>>  		req->request.status =3D status;
>>  	musb =3D req->musb;
>> =20
>> -	ep->busy =3D 1;
>> +	ep->busy++;
>>  	spin_unlock(&musb->lock);
>> =20
>>  	if (!dma_mapping_error(&musb->g.dev, request->dma))
>> @@ -147,7 +146,7 @@ __acquires(ep->musb->lock)
>>  	trace_musb_req_gb(req);
>>  	usb_gadget_giveback_request(&req->ep->end_point, &req->request);
>>  	spin_lock(&musb->lock);
>> -	ep->busy =3D busy;
>> +	ep->busy--;
>>  }
>
> [Severity: Medium]
> Can an IN endpoint still stall when a new TX request is queued while a
> concurrent dequeue giveback holds ep->busy non-zero after musb_g_tx() has
> returned?
>
> With two TX requests req1 and req2 queued on an IN endpoint:
>
> CPU0                              CPU1
> musb_g_tx()
>   musb_g_giveback(..., req1, 0)
>     list_del(&req1->list)
>     ep->busy++ (0 -> 1)
>     spin_unlock(&musb->lock)
>     req1->complete()
>                                   musb_gadget_dequeue(..., req2)
>                                     musb_g_giveback(..., req2, -ECONNRESE=
T)
>                                       list_del(&req2->list)
>                                       ep->busy++ (1 -> 2)
>                                       spin_unlock(&musb->lock)
>                                       req2->complete()
>     spin_lock(&musb->lock)
>     ep->busy-- (2 -> 1)
>   next_request(musb_ep) =3D=3D NULL
>   return
>                                       musb_gadget_queue(..., req3)
>                                         list_add_tail(&req3->list, ...)
>                                         !musb_ep->busy is false (busy =3D=
=3D 1)
>                                       spin_lock(&musb->lock)
>                                       ep->busy-- (1 -> 0)
>                                     return  <-- req3 is never started
>
> When musb_g_tx() finishes its giveback first, req_list is empty because
> musb_gadget_dequeue() already unlinked req2, so musb_g_tx() exits while
> ep->busy is still 1.  If req3 is queued before CPU1 finishes
> req2->complete(), musb_gadget_queue() skips starting I/O because
> musb_ep->busy is non-zero:
>
> drivers/usb/musb/musb_gadget.c:musb_gadget_queue() {
> 	...
> 	/* it this is the head of the queue, start i/o ... */
> 	if (!musb_ep->busy && &request->list =3D=3D musb_ep->req_list.next) {
> 		status =3D musb_queue_resume_work(musb,
> 						musb_ep_restart_resume_work,
> 						request);
> 	...
> }
>
> When CPU1 then decrements ep->busy to 0 and returns from
> musb_gadget_dequeue(), nothing calls txstate() for req3, so no further TX
> interrupt fires and the IN endpoint stays wedged with req3 at the head of
> req_list.  Commit "usb: musb: gadget: don't flush a waiting RX packet whe=
n
> queueing a request" later in this series defers and kicks RX when ep->bus=
y
> drops to 0, but TX requests (!request->tx is false) are not restarted
> there either.

Yes, it can. This is pre-existing and not made worse by this patch.
This needs a separate fix.
