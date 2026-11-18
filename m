Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035421;
	b=kDLyrWOY6pB/+We6oUBRUo/zYiQsweOtv3akbRA7tMWyNGjb9I+z3Gs60b03lwsA7MXC
	 aU7DzIlPI97m3nx6MiglNTLvMGkPDRpR5jU/iq+evCXW5X800AOKLTlK0oVIImJhzIUXh
	 jQkfZvMooMtzplpZ1Xo9Z2LJAoL61Bk5bW+Ep4MlBD5YkTv/AqoEE0qQ3DfKf/Ah1Pt35
	 wdAdY1wjNPE2M1cbZQL6EjOqWRCT/km1WLafQPp7DsIuPepT+rNydNWfvLlQkDpIQe7bO
	 ZhQ+twfswWR9adH+X4h62e7JraLzz7KWoZvuOJ8yHlWWdfZTnfaiqPZJtI1JTpLoEpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f3GNnuqRISLu8fzYE97bR6SxD+k6/PUka28NAKwn36Y=;
	b=zBWQcjJJJLlGC86cmvshnLfbHw4WrDido8QKRGT1vkQ0eCQi5FaL3ltUKsdTYGcsi+tC
	 FHd3dxj3+JsiQ1cUAFUGeEdSwbTSCwqhCU8/K4kPN1wwdtD2cm/TqT9m/alWJQRHwjGRt
	 IipwSdZthwFUlLjSuvT29dMggjrOLoj/aufJhm8RxsjRuTlFNJf7rqpA4VbyEjKe0Lf2U
	 /CHfXKgNefzby5++SsVlQ8R3FyJx0C1QfYV1pE+AinCUK5dEhB+8TsSKyf7BzLmgt0/W9
	 iEpiMryHPODzIkfMaM20JUdWh1Bb6akaYzJKB36OBxwlpk7gwno8XMGjicTkN/ohE0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aZCYwLww;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E460606A320
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 20:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E460606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aZCYwLww
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a357b1c649so934778f8f.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 12:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035420; x=1795640220; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f3GNnuqRISLu8fzYE97bR6SxD+k6/PUka28NAKwn36Y=;
        b=aZCYwLwwsN7rvfl5yUjO4JxuL+L083RHen4XmfbTZwwg+7tg5Vw9HjOniRsp8K23X7
         PiESeGADKvaF+pEiHny+FrVRuJcNKoTwJZyKoFUNV1rIus4UKY1ljMcN4Mq2aJXdNccG
         k3Ucc6c3NpjQIy6FlIFF47uSd4DFWwuo1uW/QsutZnmcHtPZHW04ogSAsptR+DpuhNxl
         yGrmi73YjKXhdYnywOUUCqkNAmF2uNdNK5A4IKTm+kas1GaY8iazg36MM7i1Uxc10jNr
         /pkiPjjC9QOijgxXQFtIBwvlr1LzY8Xao6c5urSnJAnGTU9S2AJXyWXHMxOe7J6X86RW
         WzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035420; x=1795640220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f3GNnuqRISLu8fzYE97bR6SxD+k6/PUka28NAKwn36Y=;
        b=dBQcJZ2sxzRe4zu76NQDDqATaFBtcwM5jwdIgUJBZRq3/piLS4STAH0qH+WNh8jssK
         6WtLtgpJmYbfRUIJizyOsP2uzFgX/HKR6h4Gpe0rErtTqwlyLfX9S4kNlZfNJl5ExPtD
         9zC6Z1sezC431MWqwF33wC97ucWfIKdoVkGHm14kQdC7akcU/FHCTJL5Bub8mHhllg5J
         5aM8/FT0MbgdvyvrKcfARFlSAFSCg+4Qu74ss1uaT00qsKK280zdFqsNehWXSnZrxYAF
         5LrsgsX6rvQ7jWx8p6UMCsHtnC7NDwt0liPxc33Im7RnhikhGfutGOPSneVREPzlbpyn
         bZyQ==
X-Gm-Message-State: APuU4Z/DypWzevAcAXSvnEtlZcP4jZAScnBquUJG7CXtwH9XJaqEVXbH
	R0FvsmSLARtrvtH9mFCF25hHHQLVjje3ZVya1RBHzY3o6ZPEGrwtg8kQnsU8Fy/r
X-Gm-Gg: AYBFou3IUuOXk5+JU39EfexHBydnAPkUlDOzQLE31+pFMkq1/Jh0pwfhizH5Ay6LD16
	jY+a58iItFfF3e3k7vlvwOOjA5ICKcK23kqx5ynTS02PbtazIwrLpq+coPS1dwvAdAPGKN/xadU
	xSbW+wKGAWHU7o8uOoQLgSDfug89bbzP+12/uUrb7cMX03eCbDGL+3lfCHRNi77s3UPR0R4WEwB
	bzyvsnTNWulapEo85/zwWVNiAjsKVPVX93EAb4mvQEB2Lx9zqrEymcmOU3NAsfoAUAR7D3PDU5g
	EVMwpyqc601b1ZC9b5sfVGcjdJ5KoRG+3pytAYNk9bgk5L3cxIpten+8q8RiwWKBqSKB7S59Gpt
	5M2Dv77rlSkv5EETVgqdEY5mwXnODA8cVNWIHDisEHb8Y8IXoj0wD/D84jp2vEsg+cdLbNLA2aM
	ACdbeZe7j46uqpvmiOhJybdocLHpU3N8RIa/CEGheR4s4CC/D4FGaQ09BlKhaqXCYHd9qHJHnXK
	f70wNviSgePQqtlNRUvUvPaT/lsIxogG9cpRP8IvpFG9n5n0E6ZC3O2k9hoE9dnx/t8lVjXDJwh
	LcqQG/+2r90lJxdAVcar5h4kblsD
X-Received: by 2002:a05:600c:1d2a:b0:4a2:d99:3171 with SMTP id 5b1f17b1804b1-4bb7da34cc8mr92969645e9.23.1795035419433;
        Wed, 18 Nov 2026 12:56:59 -0800 (PST)
Received: from m2.. ([37.142.154.208])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb832625b5sm18265795e9.11.2026.11.18.12.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:56:58 -0800 (PST)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Michael Zaidman <michael.zaidman@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	dmitry.torokhov@gmail.com
Subject: Re: [PATCH v4 03/16] HID: ft260: add GPIO support
Date: Wed, 18 Nov 2026 22:56:48 +0200
Message-ID: <20261118205650.49046-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-219595@kernel.org>
References: <sashiko-outbox-219595@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 17, 2026 at 08:23:52PM +0000, sashiko-bot@kernel.org wrote:
> Is dev->gpio (along with this FT260_GPIO feature report read in
> ft260_gpio_init()) still needed now that ft260_gpio_set() and
> ft260_gpio_direction_set() read FT260_GPIO from the chip before modifying a
> pin?

No. v5 removes dev->gpio and the FT260_GPIO read in ft260_gpio_init(),
which only fills it.

> Also, FT260_GPIOCHIP and FT260_GPIO_WAKEUP are unused because
> ft260_gpio_init() formats dev->gc.label with devm_kasprintf() and checks
> enable_wakeup_int with FT260_GPIO_3 directly.

Right. v5 removes both macros.
