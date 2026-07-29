Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8948453A34
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 14:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335708; cv=none; b=lHasZ6R4TAVnUehz1nvnCuPunky0VVV0y+TZLjqoMagDmNjzwxi3X/m7ZsrGI53e3usN3nGKrd7s28lwshIOvkEsHIyYaqMxwUutbLia/1CZzLpZ2B61m/9NY2blTME4v7qojOGnNmZ+2DSDcievPGeASwP6am5LMAM6i74vXIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335708; c=relaxed/simple;
	bh=SlZlOtiUOQpo9MMuW+eMoQMK5d2TR+4KRpZxX0D10wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=eTbq6nZLo0yB15hNHEwX3U1wQLiVV5bdC8ztKB+BKYhz9LglR2ArpuS9ofnjnPITmR2SSdlTOdPtGEJAO9nzmAeUCGVF154d5r/9H1e/rMrUrIiU3Pa0CtFN3mPsOvqIb5vvqo3t4IZR0zF1Bx+Cv3eA78GwQDXomRLV2FxlKXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NOkro5pg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NOkro5pg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785335705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TBurJzX00gU8Pu9J5xt+dnrFDqgGyoXEsd3dJoQPNZY=;
	b=NOkro5pg4X5p/K5y2DtqzgQVP2Gq7Y7WEnM2wrcUip4u9pqnB4VCYhBFi9ukeYowd4B4JB
	Ltv25bS2YOKk7FeGkGhtVeGP8o4eVDtGnJs8qfmRF6ElUjsj080WHbECNVEI9w6mBLH0Jx
	YXm+bO/NOL932cYJfQr7icjraKS6f7M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-5x4H2i7VOT6lh1He0LHLGw-1; Wed, 29 Jul 2026 10:35:03 -0400
X-MC-Unique: 5x4H2i7VOT6lh1He0LHLGw-1
X-Mimecast-MFC-AGG-ID: 5x4H2i7VOT6lh1He0LHLGw_1785335703
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47407691804so748696f8f.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 07:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785335702; x=1785940502;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TBurJzX00gU8Pu9J5xt+dnrFDqgGyoXEsd3dJoQPNZY=;
        b=E4zsWP05KxHQnamaaV7/32u3uur/aeC74AzuBMaiCYdn8jFhmxxZmbui67g/s25OpK
         0pUweevz1rpx1duLSqbYlULWBTMiBjWnS2NaLsrKIZIJhegvMrFdaRV/GVujVZtHvyUE
         LJxDYJSkQpw4iyV5hxqTWwXa/d43OTfZkQGfbIN7Bvl3zN794m6lsDToylDMOgYCXaqf
         7Yals60fogCRWiS1o3gBzQVuyAKj4dKyfBddq4e5ISnGjVuee8773P+Dk5JKA25rANt1
         3wps5jGovdXAjtCtRr9oRkl0U+EAUFQ2RjXZK1qTl7rM2ofj1dRyEQklxH8P/F7CeEi/
         X2yQ==
X-Gm-Message-State: AOJu0Yyv4/t/O6JpLsgErZc0UESJ0DkoFim83Y3yEBSLIm5SJklGWdPG
	OnnIeeI0Jvgz8zzgoOUdgBq2uQEShnx0pOt8OX68kg3n+F90V0beeq0iGdQQmEfwLLTw3ExeZvz
	XAnQ9HSxQDkY5e0vRFZGN2y08jxcNE7slso3dyzxoYQeDFqwDWSB6/ihHeI2u+jOVXSn25lLaDm
	onoYwgMtfs9krWUwP35S+LnazYJ11t9bL7n0XFvam/3ljENT1U00ObtA==
X-Gm-Gg: AR+sD11+vIOMg4O5FHL6sWk6RzyvJ6Qe+DVb4G/v59dt16unxE5pHpQsntYq8Wm5TVi
	uPD4nHg3XDuGXg9Gu0n/Flo6XTGmRSUU+okXe9hPYdhzvt8Hv8UMWM+1/3vJCQsfVyeST3Xp63P
	rhk9zgUkA5LSkSZS7jadXaXmxuogjN+s2hFF1o0hS+FLhS1MA8BMW5VZi6nEQLUfjw6Wtpc8+tF
	9iGHTSKQuKNasdNaiTD1+mcagsA2XgekogxSKkiXgGkekN1DdD8M0qn8z1T/WwwpJVnrC0IaSUG
	YLpj2zSfzxh+ajk5sU7sCDeUwhNNM+8wMG0u40oyMOjzO+zyZk96uBZVrhEj/fKKQbYkmL7Pir0
	xqzKzXkPXVx49pm+6tYvskFECu/lAUgQe30m+29+T2fw=
X-Received: by 2002:a05:600c:820a:b0:495:409e:bc80 with SMTP id 5b1f17b1804b1-496c6586d21mr75447745e9.37.1785335702416;
        Wed, 29 Jul 2026 07:35:02 -0700 (PDT)
X-Received: by 2002:a05:600c:820a:b0:495:409e:bc80 with SMTP id 5b1f17b1804b1-496c6586d21mr75447205e9.37.1785335701766;
        Wed, 29 Jul 2026 07:35:01 -0700 (PDT)
Received: from sgarzare-redhat (ip139-137-192-82.pool-bba.aruba.it. [82.192.137.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4443396sm176233775e9.0.2026.07.29.07.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:35:01 -0700 (PDT)
Date: Wed, 29 Jul 2026 16:34:55 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: Weiming Shi <bestswngs@gmail.com>, kvm@vger.kernel.org
Subject: Re: [PATCH] vsock/virtio: prevent workers from using deleted
 virtqueues
Message-ID: <amoNWGhKa78r3Kzo@sgarzare-redhat>
References: <20260727035804.1860862-1-bestswngs@gmail.com>
 <20260728035823.AFC051F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260728035823.AFC051F000E9@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9PAoPVaQ6ebKs5FK8IdBGSmrfe27zhkpz4TTqsuE2FM_1785335703
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jul 28, 2026 at 03:58:23AM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
>Pre-existing issues:
>- [High] Incorrect flush_work() ordering in virtio_vsock_remove() allows rx_work to be queued by a delayed send_pkt_work after rx_work has already been flushed, leading to a use-after-free when vsock is destroyed.
>--
>
>--- Patch [1]: [PATCH] vsock/virtio: prevent workers from using deleted virtqueues ---
>commit fac9b600b273994b7593c604a6d3d0352d8dbee3
>Author: Weiming Shi <bestswngs@gmail.com>
>
>vsock/virtio: prevent workers from using deleted virtqueues
>
>The RX, TX and event workers read their virtqueue pointers before taking
>the mutex that protects the queue and its run flag. This patch reads each
>worker's virtqueue under its mutex after confirming the queue is running,
>preventing use-after-free of deleted virtqueues.
>
>Cc: stable@vger.kernel.org
>
>> diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>> index 57f2d6ec3ffc6..79cf19f589439 100644
>> --- a/net/vmw_vsock/virtio_transport.c
>> +++ b/net/vmw_vsock/virtio_transport.c
>[ ... ]
>> @@ -689,7 +690,8 @@ static void virtio_transport_rx_work(struct work_struct *work)
>>  	} while (!virtqueue_enable_cb(vq));
>>
>>  out:
>> -	if (vsock->rx_buf_nr < vsock->rx_buf_max_nr / 2)
>> +	if (vsock->rx_run &&
>> +	    vsock->rx_buf_nr < vsock->rx_buf_max_nr / 2)
>>  		virtio_vsock_rx_fill(vsock);
>>  	mutex_unlock(&vsock->rx_lock);
>>  }
>
>[Severity: High]
>This is a pre-existing issue, but is there a use-after-free risk in
>virtio_vsock_remove() due to the flush_work() ordering?
>
>In virtio_vsock_remove(), the flush sequence drains rx_work before
>send_pkt_work:
>
>    flush_work(&vsock->rx_work);
>    flush_work(&vsock->tx_work);
>    flush_work(&vsock->event_work);
>    flush_work(&vsock->send_pkt_work);
>    ...
>    kfree(vsock);
>
>Meanwhile, virtio_transport_send_pkt_work() can queue rx_work outside
>the tx_lock:
>
>out:
>    mutex_unlock(&vsock->tx_lock);
>
>    if (restart_rx)
>        queue_work(virtio_vsock_workqueue, &vsock->rx_work);
>
>If virtio_vsock_remove() flushes rx_work (which returns immediately if it
>has not been queued yet), and then blocks waiting on send_pkt_work to finish,
>could send_pkt_work queue rx_work just before completing?
>
>This would leave rx_work pending in the workqueue after virtio_vsock_remove()
>frees the vsock object, leading to memory corruption when the work executes.

This seems a real issue, would you like to fix it?
In a separate patch, since it's pre-existing.

Thanks,
Stefano

>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260727035804.1860862-1-bestswngs@gmail.com?part=1
>

