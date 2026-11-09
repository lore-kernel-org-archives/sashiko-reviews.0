Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253019;
	b=exBd77y214hwq4be+986mGGOwAxSRt6dFOB050qXsu09/7S4blZvV3NSFY6YIjswc95I
	 je43nuBKHFUJ2m6tDorPtiAEc+BQggyMgqwymI1BN5k0Q5rv2WusaZ4IheGKeeYfzDsuQ
	 +HyxpTmBAv4e9patvKu3Obzorq3D2uBeFT4CN68v9BwEJJGbrUbnCr87YPVcv55P1Vzls
	 lkYW6ohKoCUXY27XKw+s8wajLX5CJomLVjZqXpg99euWVq+lmrEPlikruA8OHEFJjlfXP
	 d7tS4StAl7ZM8f3QiEUZuLgj/9im2q/0Xr6l0vSvE37K0eWnkQHhlde6wSD3BzmVbOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=iNu8wevlnlWuO7QPB5Pki9h/6ZFT28xcWP8fY0TirdY=;
	b=adsb1QOUW2F71HRTD1mYTBPBrhbz6yaPxE3JavZa73Rxjx6LhaF0o6p+1/1HFOozDIiP
	 RR0UXlGMqDRc+IAMbykzsTH1QIVwQy2uYxVOnnRpYzu8liVeAeGKEo6qClV6Ox3Tc/8pB
	 pZETkaXJOC8/WuYy5ZtFufNMOyOEPD8D+YlWsel1f44xULRl+0aCm7FMjkm1iOsc+Os6R
	 KM4qIQYic+C1Cax4l50NkQhVvoogPCZVzJAX8p//iQGTRg1w7rJtb70r/NtVzhpetSC42
	 VFQcSkRxMnzRMucNxHm8upRSHYgornyh/Gk9qRCVjr8aPIXvmBWZ51TA5x5MnldzfNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoSiwNn1;
	arc=none smtp.remote-ip=74.125.224.129
Received: from mail-yx2-f1.google.com (mail-yx2-f1.google.com [74.125.224.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA0E606A321
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 19:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BA0E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoSiwNn1
Received: by mail-yx2-f1.google.com with SMTP id 956f58d0204a3-67be911a2a5so718678d50.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 11:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253018; x=1794857818; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNu8wevlnlWuO7QPB5Pki9h/6ZFT28xcWP8fY0TirdY=;
        b=JoSiwNn11DYlSEfCV9fRcyAIqa4zjcGmcQ6tjDqYuJISUwnCZsl1pBu7Qnt/AbHNNL
         ums2CuuKdWpzRRCTC6gEgcVyvlPbBWlz0jYKp9KC/A5wet7AzCFazboJXFGOfQkf+Dtk
         /+QDp96gnPh5ekM1GaBQteWt/lhe7MhhOhCtya/zmy/EIX1zk7cPhFEAnXsfb0YZZW09
         kfDJ3XbtDxLIIIeA/AvD4mb1N9NjOUvWRoa3Xc8enkHJn6xobhWo6bGxYsiO4b+EN3QM
         sXGwqPuJc82lxWnSFAJVNtEe8Pe2ZrMOGVQu9d2/daYEKuhGGUs4SDacYODlBH+GtY+p
         V4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253018; x=1794857818;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNu8wevlnlWuO7QPB5Pki9h/6ZFT28xcWP8fY0TirdY=;
        b=2VewKs38KM01Bqx+K8OwOYTLZll4WXHl63vwDOUBT3NyZf80va7XIQv+1YYpHLJGVa
         Gj6LI8sbN7wF45IZ6wW6dm5WcMhjw5J4U3QXUu6JkAjaO1tN4SvNOBLrrMMqj42Ql+wM
         AWd2kxkYo6PhyLK+jP7qJ00vjJqAnMiUEPfdeO5IbL/J1izKCH272Ur4K2MxYaxZ2Ujj
         J3kieUu8tzN6NtLDKyFhssf6iHZ+LQXcH9F/X1j4Ta8jlm6VaEW4qnb6aJktCEUWp2ar
         nikkwoBE6Ga8munMh7aOw2MBtmXXSb920k8Zsi01E9k15/pZUJWKrBzSsDpcOxKg7vfN
         MFyw==
X-Gm-Message-State: APuU4Z8wbk6eE/+ZuUw+MNvS54LH9C1TDVrQnstaIr2Pci4DCRD1uulB
	N28sxz1y6NBE9dOsuMv/TbefkjdtxHh3qJ9gn5nbIMTox2IBwjNzspQIyk7xN5tkflc=
X-Gm-Gg: AYBFou3ubEdWSRYyNRB3w/sUxh9j8em/+CAtXMzVjmioD1ofLJyZtQi6GlFcYGMibVm
	IJPlaUpTK+AXI85svOUHFllrk4jXZTxa9Hu3mGmElXF92Ac5kiMDD55yQYPetn751BebHZv7xLc
	s/cVBFL+W3vw2sYiiCnE8L1VDpeWEoQDXkuGffShodY+lfbuWB5WGI2NfvRDiehXQRvW/TKdqRS
	FBycPB08yBKQ/Ap2GNvHz68fdTRNm5vfHT5JQ212xr6J89tB8F67e0dedwBOHRPmXwBB39O1w0/
	4X3r3rpZjb5y6qUSN4ZjgxNhSGk/uEEx8Z2dACw6ygXj1XLmSgofxvlHP3P5mvAIr6yfUO8QFoU
	D/GzyeZV/DkNnxU5fGkIA7xaltmfX41YMoknzGCptLMgTcd1XivqK/3dACHc/WKPnQuPzOHfyDT
	nkMaEAU+nlKlDeNELQK0Ejb6gtjiYzpVZISNanQFl7W/DxVZ+58QAOzcLZ4rYA12PHbm/lf9Tqz
	YwzrTuviZFqV32P8vJoD+ZnS/3paiaIHokgJS/uSxeNiqh8Bo145n0waPO2mvzabC+KNovgzLQR
	KvyGjAVGBUgs2hXp9ku8D6UHjRTxyzLwVQ==
X-Received: by 2002:a05:690e:4399:b0:67c:3165:bd2d with SMTP id 956f58d0204a3-67c568707e2mr287035d50.68.1794253018056;
        Mon, 09 Nov 2026 11:36:58 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589c70a3sm62367d50.11.2026.11.09.11.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 11:36:57 -0800 (PST)
Message-ID: <8f89c7f8-8f27-477a-a98d-f08845667639@gmail.com>
Date: Mon, 9 Nov 2026 14:36:56 -0500
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
Subject: Re: [PATCH 2/2] nvme-tcp: consume TLS records without application
 data
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20261109-nvme-tcp-live-ctrlrec-v1-0-47ba61670e65@gmail.com>
 <20261109-nvme-tcp-live-ctrlrec-v1-2-47ba61670e65@gmail.com>
 <sashiko-outbox-205483@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <sashiko-outbox-205483@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/26 14:21, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Can dropping the socket lock here let concurrent callers of
> nvme_tcp_try_recv() race on the same TLS control record?

The report is correct. On a poll queue, nvme_tcp_io_work() and
nvme_tcp_poll() both call nvme_tcp_try_recv(). This patch releases the
socket lock before recvmsg(), so both callers can see the same record.
The second caller then fails the queue, and the controller reconnects.

Without this patch, every such record leads to a reconnect. So the race
does not make the result worse than today, but it is a bug in this
patch.

v2 will add a queue flag. The caller that gets -EINVAL from read_sock()
sets it with test_and_set_bit() before it releases the socket lock, and
clears it after it takes the lock again. A caller that finds the flag
set returns 0 and leaves the record to the first one. The flag is set
and tested only under the socket lock, so its owner knows the record at
the head of the queue is the one read_sock() reported.

v2 will also include the cmsg buffer fix from the report on patch 1,
and a test with poll queues.

Martin
