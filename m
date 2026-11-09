Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794252604;
	b=xAzTqyK2/GW7lFnGqJYnygogHUnkpQ98FVpxE1ZFQ0pm2v5KaO8WxRsM/ozaYA+sTGtW
	 yGz6Btc93UzdGlM43TZF0/HKOp6tXkLYl7Rcev8Pqyo3m0QqGuFyru6NYHvIogitc1Geo
	 hFBSD45wrHmhoIcB5za4lkxHC4gGNqGcA8V5UprNQotnzIsL5dtZrPPmCRNl5EX3QXprF
	 P+PF2vJnjSun7IRhuIetPdl0dbvg9JZzJG+nEwC5n5f7KIV1pzbdfjoR+8FzIX6LRnNwC
	 skTP7j0JMm6h4qNzTxixttQBL//cHzNW34DNxfQwL28cEe3HAE2RwzuQTctnw9WWbpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794252604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=7f0x77VxeyFJGw1qnk2bYiIJYFod8edED4Dubqc7evo=;
	b=s+/7kOG89i2Vdc4mDwXQJ/Y2MU2/el23ukzJGpVdMpIBKjOG96pa6T5aGeFhyR2Xxz/t
	 LwuEhArLMofUCbxLBlBlABaMJKSiLQZki+LWuwQ2KJFWunqLBuS7yUrDRKbLj8HZ6d7jx
	 gv+oPT6tiJe9Gn0z7nq8hUOVGLHFTCRqkb+nMYjOAhbyzD90FTSVwYxrmQ2XV2eF0KYbY
	 Yqd1PX9SZb/V7Xj6EuVuFpHOtj+3iUQFlsUlDOpzhD5cF1jBV7i30nQdfi70FTRcCvRKs
	 jt6c8DdMyZon2esIVFfTgjq1ieWC6b6OvT1JufZaj7D4zhNnQ1DQmlpUArSAAw3GXmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u4XXuAFX;
	arc=none smtp.remote-ip=74.125.224.135
Received: from mail-yx2-f7.google.com (mail-yx2-f7.google.com [74.125.224.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531CC606A321
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 19:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 531CC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u4XXuAFX
Received: by mail-yx2-f7.google.com with SMTP id 956f58d0204a3-67a3d39e403so953720d50.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 11:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794252603; x=1794857403; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7f0x77VxeyFJGw1qnk2bYiIJYFod8edED4Dubqc7evo=;
        b=u4XXuAFXr/3dOS+HFdNQaEllspo7qvFbuq/ockko0b5iPB4GRr2aHROSK6tjfxIJrj
         /3GvpOSEpbS2l2tIiyRvkdwBVlGL3OLO7NYDYcyc9wQaB3lwSGbXIG0UQ23XwgVCr83a
         L46DrbD/NG1HrG6WaxTtZof6V9R/AcHZUU3rBpd4NtenmsDZpP9a4teWsqMtvVJbP1mv
         go4wLI99ULvev8XBuyd5Mq7BS7AJtzbmxKycc5OJTo2aSgjgT6qr5kyCS2DQr2bgtESf
         s4B1hEb31ImpgX9r0gSZK5eQuhFU6+MXmZrQYbWEUorgcTh1vaSqkhWaIGFWYy8SNR9N
         hOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794252603; x=1794857403;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7f0x77VxeyFJGw1qnk2bYiIJYFod8edED4Dubqc7evo=;
        b=uNehOLQMUyFzw+3/U2T/ctIvrmn8aqp4t7P5hHifYz8DjR0JrBAlpQwKfO6zL/YvUf
         jyFUFoNr7vT+G3jSE59B+LwrEUreEbcn6X6P+98QAyodZEk3PgceUuzc+SSrn4QVNlUp
         3Qg6cavDz1mVVeIRjwWIh9wGk0lhpDMlJJixZfIzNktpw6ROMIVcau3JoBILOXSDW+/R
         7pHuBWhBh1S4Xg2+vcvrNKAwxOhp4rcqIrw+yCWAxN5DEM0CJv9pHOBtX6hOlDbJljIW
         euvsAhWRIrHC5eCGwa4pkR83TT2nbkyxysUtMcMK3WtHmvdFqw7cSEMm9EuseWdxIK6Q
         JIag==
X-Gm-Message-State: APuU4Z8mTH790M24QaeSNG+OFv/Xj7PTF321/O9/FzDZDN0aG9dz5V/x
	n2UbtjDmzyQEaP9p2CJZT55YR6eCzb5ChlnlOu18ziGWcbo6HXRwvqczdqtjHT7bulM=
X-Gm-Gg: AYBFou1cTpHRnMC9wTO0FccrtHWW6k1G0hY4AEDM7zLCCzq4BTYMaFLp/TkzIdP7aJL
	tiDuuyfSdqI/EvsxcmOawPpkC5NFdpQcmArEkh5BVK3rZpdS7U8qA4rtVfL/7ItgFWhI1vQABTJ
	p20A8VE0eMZC137/7aFqW6WwsZn2CVUZXbfK5O518inOS68ftoyVFEL188y1MlIuBRosjy8WKve
	YferQruUX1byfTpbJ+CjRKM4gCZua3LmxX4Rze5gJaD/h0LmQYt+vr/U73QfZaqaIRd2BJBOmLy
	uaLuWHItcmwSj6QcbApOZBqYKr59d9D7UP16nQfKIyOFNav9d18An/szTOwHKWChv2oQt75aJag
	Pu03/+AUBv0JjS+7bp9xwddPOom6qbHwqxcYwnTg+vrZE712W5/j7g2e/ANAIHylqy31ZQJy8Hm
	nCegxKOosvEiBGT5wXhHJ5V91CGI3QVqRhDRMjHD/DaAWD1Ixn9jQ9GGBMq2oUl8E7gU6eg9fhy
	5L+PRG75+D62M8OtUFWkX1SunpqPtfejHTY0+oz8/NIdX3Usqpk4oAqT6oDI1T7mDhGD5lZgR8B
	CpWJIwh4iNJbthP82TehELO0NmWeM6iS75g=
X-Received: by 2002:a05:690e:438d:b0:67b:e862:e228 with SMTP id 956f58d0204a3-67c568d26fbmr214564d50.86.1794252603311;
        Mon, 09 Nov 2026 11:30:03 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c58a201ddsm39422d50.21.2026.11.09.11.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 11:30:02 -0800 (PST)
Message-ID: <ee61d52b-e8bb-4504-a893-f9dc4036d615@gmail.com>
Date: Mon, 9 Nov 2026 14:30:01 -0500
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
Subject: Re: [PATCH 1/2] nvme-tcp: move the TLS record read loop into a helper
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20261109-nvme-tcp-live-ctrlrec-v1-0-47ba61670e65@gmail.com>
 <20261109-nvme-tcp-live-ctrlrec-v1-1-47ba61670e65@gmail.com>
 <sashiko-outbox-205465@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <sashiko-outbox-205465@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/26 14:11, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> This problem wasn't introduced by this patch, but can passing the
unaligned
> char cbuf[] array as msg_control [1] cause unaligned struct cmsghdr
> accesses?

The report is correct. The char cbuf[CMSG_LEN(sizeof(char))] pattern
gives the buffer 1-byte alignment, and put_cmsg() and
tls_get_record_type() access it as a struct cmsghdr. The pattern exists
since commit 2837966ab2a8 ("nvme-tcp: control message handling for
recvmsg()"), and this series copies it into the two new receive paths.

v2 will add a first patch that declares the host buffers as a union
with struct cmsghdr, as sunrpc does in svcsock.c and xprtsock.c. The
new code in this series will use the same declaration. I will wait for
review of v1 before I post v2.

nvmet-tcp uses the same pattern in four places. I will fix it in a
separate patch.

Martin
