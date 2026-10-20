Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514011;
	b=rfv5qrUH0l4fQ2PuYmLUcwBy6YulFUX9Yf9Dd2mqdlK3bTBNcrgD09sz4yTsOGdhuFgk
	 xUyH7/RURBNuHBm5EUD8PybKYreEk7qKwbsrzuq7oQrgFjchUyqa9alQ5dXNl2HgPInme
	 pNXuAoZjbfqF3kC6RjPtl6ql3ZTRZZoJnJZb4b5ME+Lq1J8ikKDdxLjH0JPDTBBY0L6jm
	 5p2DD6WRRkAC/V0sr7KFWEg+u9+fbl6xESjtyNW2JCc5a1AZV5AK8UAMp84y6A8IEbMT4
	 IHECnxHsyu6b0GAma5HvpZ6nc8aaAJyrqypZplIMXfybn+UBTohAyIb+VMAIE6dgz5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514011;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=OgtRdYhx0nvtYafb9qO3e/2HBoxq1mY/MOIHjFCCk40=;
	b=uDV/2kelp8ttIE26Dl52wrWFN7tXMdnUETKZgX5yf07kCnwkdTJblnWp8HITAHw3fkmK
	 NnENALTPo7bxUHoG6ulvktfpr4n2Tn/xOBJzlnS46wySTX+KmBdGBd98HpgbLoiIHm18/
	 rWzO9bMNC2bgefkgdMc1MNM7PHgXU4+HCwodjCNfYlsQykxYIkiSW4OFlTcG6hd8MpYZK
	 NHaAgLuQqRQgZHlO+lSMuHSiG4a8ehAMcQEA/QNRi9QTw1TjTal1nE2YFntwwpo1oW2eO
	 E/zMwE3YWw8D1nweGjqAqO0B0c9fDHllggceVqudgTglUnR8XTlw7EFR+11g7JAs/0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I0nhtCBY;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE10606A319
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 16:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CE10606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I0nhtCBY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792514010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OgtRdYhx0nvtYafb9qO3e/2HBoxq1mY/MOIHjFCCk40=;
	b=I0nhtCBYagI28Q6u4XHklpQ5Z4t/KnGK0mvtLFzrxjoJKGb5WTkjPNtM3SXzKytzC4Kzyh
	8DsI2SQggd7QWJziGLH6i0AfuEHUQCPvm+4T7Eh07VpXGopEui5H9xr0lsUDqvYR4qMdJ4
	qbYsxXNexpWyH3tWsOF6qLPI4ZvFp3w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-Q7PC9y2dNf6-hM6mcY3llQ-1; Tue, 20 Oct 2026 16:33:28 +0000
X-MC-Unique: Q7PC9y2dNf6-hM6mcY3llQ-1
X-Mimecast-MFC-AGG-ID: Q7PC9y2dNf6-hM6mcY3llQ_1792514007
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49953abe51fso26461965e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 09:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514007; x=1793118807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OgtRdYhx0nvtYafb9qO3e/2HBoxq1mY/MOIHjFCCk40=;
        b=B/yfRFp/X0JLo6e6lJcfzGY6VQ6bAWnE2wOQvMDxdsa9vKAm7Q07rusEZnDXQq+nqw
         USMDcvbVzKaBWhkTMt4RcQ0yUGZW7J8z0HW5FUucVz5HR5pbDYxw1uD9XAl8Vsui7Qet
         IHVXrSRaqBq9jsEfx2/XQ07wpnMOn/BkddNmuT00jQf/hCChqR5eR0axqyDREaUPiGLD
         9WbWgbQc0mLwlCL2KHKPTuBqJAG0NWTy1x4uSHU69tYIgfusSizyDpWo1H6huyRlaLDa
         O6jn77x+J8Z2UGv3U6NiqcdgjkbfLx8vU+WrSKleArbBV5jFQxx8a4f0VnbAJdAwOhhU
         fiSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfB7JgaVkfgS0UpghnYcMNbvNkdC1QAotLnnk514tkggMgFYMwSj3zSvyQ2IAJNp126D/Y9nbs9A3dQxcFzxU=@lists.linux.dev
X-Gm-Message-State: AFq9FYKSM2ykBmjLqbM7pQ9l4nU7nh0wSO1IpufAaN3lwD42pHJmy6Iz
	O2VEroJYtkXtbT05RRxDFm3BwwWpyngbZ73JrpJ+abiD1gqM4/X7B+3xCaRQ1ah0ZkXVeDOQDG5
	7yHWY4lXaShbOJgijeFtkfS/dk3sEok5uRH+2J9kEiDe9DnqYR1qkQl1KyDfbzgTbEWvMqg==
X-Gm-Gg: AYBFou2NPeZPraYuK7+775EyYC/fXesk60Ig2BewqMg0ar6ke6kTQLGD9uFvn/3vbOT
	HnwKlHhxmxOGWizeY+X3lyEFw5PfPS47aZxaScmn8cwy5rgxaJSxBMcVDliy4Nb1Uvus7jtQoWK
	h59Rpx6fvEUR1DP30Qq80Qy2Qa6zwNILQZ6KBPwQNlVFMte4P7Q3qI40PLkp+5LNk4xs0P4llwd
	znA8CvrnAc9BvQPpocL1DJ34SyihAq70WJD1jS6mbn0NkCFDfv85A0vCp20vDgoMitMEEBWJDYQ
	mC2LRwN5ebRxjPziKU5rJjsOEvOR0ZJ1N3xJ8ElWZxDsFprbOGh32+JKTx4J4QRuPIUKcPsOAC3
	73yqvJw==
X-Received: by 2002:a05:600c:6095:b0:4a1:f688:a5d5 with SMTP id 5b1f17b1804b1-4a1f688a607mr49127165e9.23.1792514007519;
        Tue, 20 Oct 2026 09:33:27 -0700 (PDT)
X-Received: by 2002:a05:600c:6095:b0:4a1:f688:a5d5 with SMTP id 5b1f17b1804b1-4a1f688a607mr49126715e9.23.1792514007072;
        Tue, 20 Oct 2026 09:33:27 -0700 (PDT)
Received: from storniolo-redhat ([130.25.253.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0aef8fsm867165e9.0.2026.10.20.09.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:33:26 -0700 (PDT)
Date: Tue, 20 Oct 2026 18:33:24 +0200
From: Filippo Storniolo <fstornio@redhat.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Jakub Kicinski <kuba@kernel.org>, sashiko-reviews@lists.linux.dev, 
	Vincent Mailhol <mailhol@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Oliver Hartkopp <socketcan@hartkopp.net>, linux-can@vger.kernel.org
Subject: Re: [PATCH can-next v3 3/3] can: add can diag interface
Message-ID: <ateWxIr8FNtNqWt1@storniolo-redhat>
References: <20260904-feat-can-diag-v3-0-bdcebf07b373@redhat.com>
 <20260904-feat-can-diag-v3-3-bdcebf07b373@redhat.com>
 <20260904142606.6FB371F00A3D@smtp.kernel.org>
 <atJHPuFD8dZyoDaj@storniolo-redhat>
 <20261017-delectable-mackerel-of-calibration-1fad6d-mkl@pengutronix.de>
 <20261019134500.58a76643@kernel.org>
 <20261020-reliable-loris-of-typhoon-255038-mkl@pengutronix.de>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020-reliable-loris-of-typhoon-255038-mkl@pengutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yCBMPccNdPpdHQB383NNmG4kJ29i3HPfSm4NehyABQE_1792514007
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, Oct 20, 2026 at 02:27:25PM +0200, Marc Kleine-Budde wrote:
>On 19.10.2026 13:45:00, Jakub Kicinski wrote:
>>
>> Sort of up to you, TBH. The AI loves to point this out,
>> but I think the fact most Netlink families don't handle
>> the inconsistency for 20 years almost proves that we're
>> fine without it?
>
>Ok, I think we accept these, too. Filippo, can you update the patch
>description with this information to make the bots happy.
>
>pw-bot: cr
>
>Can you fold in this patch that adds context-analysis (and removes not
>needed "depends on CAN"). Compile with >= clang-23, see
>Documentation/dev-tools/context-analysis.rst for details.
>
>Also pleae adjust the subject to always start with "can:".
>
>regards,
>Marc
>

Hi, thank you both for the feedback.

I'll soon send the v4 with the changes you suggested here and in the other
threads.

Best regards,
Filippo

