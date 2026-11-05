Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886927;
	b=fAurVvq8238MQRhAcopVS/XyiKXypwj/xXAlDURBj+9+vbMuV8CiUUq6D8v186GPO0qy
	 WhDZdK+Nj42xU16XW16dI8syIb1B3jsnsTCmTO8iw1/VT3O3OyM3pJqdtJh2SE8uv/Z4t
	 v32U+zXESlg9zyVBeDUiqQk6D1dWsOU+HQm284foeuqCyCvbIYAzxCMmjjoRLmhmK0bf0
	 00To+khubODO8ziGh40TpWzPvK+KS54dJ1Bum18w/2d1ElC9UniOP5b0lp5ytT/qTLWqx
	 AzhHAFJ2GNwYIwN3D2y9gsjguwDeynltGvZRLr3+DmAOq9vjFPyscwBgRYEbW0KDTxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ZOan7uVPwS+Sq0zaneJfTrgsA8Jqv1vwKBJC+yJr4FA=;
	b=HqPaDdP0Zl3BUxESHp9b9KIeGciOMqUT5CrNzMS5fed42ERnBpJHiRA1HWMomoq/TONI
	 SsCD+x9aqTl3xMKazkt2pKIhQmysAMLiohT0P61+9RcGeM1jsx1JLXMWdNqQTNGFxwuMM
	 cQglJTYUKVoBqjuMgNpf4R3HUdWRHT4t2bH8jj+gl/TGLjV5skSpbISdw0z1r83YIo/SI
	 j4LH2Ab0hG+eyC0+3h56kNOaS9Njw7yDzklaTRFLcDgc4FMlDdYymSH6uZTcP/t8baQPg
	 evOO3/pZcQ/u/xskhdAflj/jGVF2J8iB06LOt5iAxIaVHBOLI0RI7yhxlgzLtOk4USA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JqlQ6zLC;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D5E606A31B
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 13:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9D5E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JqlQ6zLC
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso15098325e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 05:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793886925; x=1794491725; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZOan7uVPwS+Sq0zaneJfTrgsA8Jqv1vwKBJC+yJr4FA=;
        b=JqlQ6zLCLVg8WZ2LW8XUs0coMRj5j2GgE0TER3cyiypPaCfjV9XHFTimX7y8p+Z7ha
         HjfJYjCISJyWOxfpRA9VuvQsOYzl2/yFRu+4UqGrEMHk3dsfYMXQ1EKLdyVYMT5Gh9dC
         95OC/GvttudBVZax/EKGl9Jy+huMCPkhTkcBe87fEXTsTMjCza4WnmCAjY2CgK9uqvDD
         l12tmfFbPAUiot/thwycxZbIhJsQ972D550hijcGItLEkFfGnYqWSXiR5mIXblrrnvcR
         9ngaifTY0ixCQYHhk0DhaxMOhboPSgeCxp3u0kVncy6aAkdSDRC1U7VeAqgMJd92+umv
         bZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886925; x=1794491725;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZOan7uVPwS+Sq0zaneJfTrgsA8Jqv1vwKBJC+yJr4FA=;
        b=tARh5w8zHu/Bg0LD3m8s8P24Cjr6ZHvbg1GB3Qjh0B8vMn4Hw9TcZK1rzGDpk2tRFu
         /eh2UaPQgcVLJkVKYEejZEn2ve6kfrkjAos4uz6EN+18EoqOEyh3GYmb4npUhIhovYO0
         T9CC+4qa/vH1tWVRQfwImcB2tgmqT6MIxuO9m8+GmbgH8iLqqCINTEea0OWBr1e+MVE7
         +HFzvKB7oxwOXoup9DoSdo5xjF7FkU7ADcNTnNaHv6Skfvb1J4ye36wrijFcL1pb37Dk
         Yk3c6haL4nKXZRHvXz+2EAnNV4W1IGpQLYciEb6cRnc1K2CFAQKzahszlp1TMkSgyP68
         kBOg==
X-Gm-Message-State: APuU4Z8cogKJ9DGRV8QvLbAaAbxcVFelG0oryDfdkWt2tKsoW114sBAG
	8MtjajleOC0WR2YZlMqudoWcbNiw7Hy8MAY+U8R8ur5ect8aVoZ67rsjy37bg/Ab
X-Gm-Gg: AYBFou1vK8uVgnmeT/wBI8ctQZNQv1OkkSOxgHFZVDjVRGKS5M0K2TZ/FKXeyaFkXlB
	8gPlS8WTQCU89u3f4f8L8IZM6OgU9VZxRX1KRJZS2dszMNfnPT8u1LHfqAsasgD/L3K/QRq4L2Q
	VfLeivFqIgV+IBsx9JFq6J9qhY/SvPS/1O5NvokeGOUqKu3J8GopHWaCczUDKeCSRAR0mY1T0O7
	OSHnL9/Q1C2BjdboFiyQ8FlOTQZlQ869uSTQbeWJRJVBw/LkNBIZjbkJglIGYCrZCZmLFg3CTy6
	962mKQ6ndgug8wqVOVFbH1b4CE4Ew5gito0PSUy3mO7cP1hSID1JtQN5NoN3T8ZZLIkvQt77XGK
	UWmqLsxTOnS+Y3YZ1lbr8YknhmeDD7c05Bf+hSNw9K0HPjpTZXRC+Mn1E1lEfesV53slEYeMSEl
	08IaugIG2ESlMFETSAM5hgTmIi/gzhvFsWH87QM4NBp1TspJkfRsfONre9JbczjA+bbSYRQWEA5
	18yUY74+CSDL3EGcRulrZkkn5Zzzu4YCZaTZoOjBmVnOR1nVlzv6l+jT62hVDDsiqvV1Q5VLio1
	r/rtez3n79cuEdlj2tXYWExkZtTiZR+nfg==
X-Received: by 2002:a05:600c:811a:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4ac187a6b30mr413265455e9.28.1793886925187;
        Thu, 05 Nov 2026 05:55:25 -0800 (PST)
Received: from killingmachine ([46.188.59.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65b0sm76604845e9.11.2026.11.05.05.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:55:24 -0800 (PST)
Date: Thu, 5 Nov 2026 16:55:23 +0300
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH] dmaengine: axi-dmac: fix incorrect segment size
 calculation
Message-ID: <auyKylfYyK9-pHKJ@killingmachine>
References: <20261105131547.305510-1-matsievskiysv@gmail.com>
 <sashiko-outbox-199139@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-199139@kernel.org>

On Thu, Nov 05, 2026 at 01:26:06PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] dmaengine: axi-dmac: 32-bit overflow in axi_dmac_prep_slave_sg()

I don't think that this warning is applicable. Both arguments are 32 bit
integers and the result of the division should also fit into 32
bits. Intermediate promotion to 64 bit integers should not have negative side
effects.
