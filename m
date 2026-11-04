Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835363;
	b=2BRIv046SWXAgvCTSZsQBz4CVlL5355NHEXsoX0snLCXSIyVueUgQrSkeHvodpLRgpoq
	 su71Uw2bzE5+X5Mx0Hs2sPodi7BmvRkO9kjiGJ9Vu/Iih+gDF0G4Tb7pTmXt36STOcR+6
	 R9ACVJjyPquHyI+U+35uVdH4MqQWcC52Ut4kNUqjUI2GbqhYatcrH42rXh83dhzh+zDdW
	 PD3hbG4PkqrsIv/Df7fK7wDFmYp7l5a46B92pwPra7GO+xjWuSs8Poi1BbqumaB6lN2Dd
	 lr+MvCt7bI6mpJiYCna9qEpNFC2PNv+pC8MyaCglyJczMyFI3LSsmh9aS5nyVz0/UyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=dmn1Q3/145xsrJD3bHMxFjskCeqjVe350pnKBSHlWz0=;
	b=UGfOKVgZTguIuX/ib40qWGOPP+c99k5zxo6fO7bsHTr4LIRUam23gmroV2q8/p/dmmWh
	 xViyjsGj8gtiE6gcH8Q52YyVeQKqV7uvDFtBQY1D70FfRzM2u2XM81uNm6veA7MbkgNGU
	 cZ5tbijTMtXIO9AJpaNEqVeoYahP1HPoSIJ2ACvWZmgmNlpjP2B6Ba5FUe0Fo9kerawYA
	 Q/SuGrmEGeR029QCjATFOV276tpWulPuO1Q6jHzbCvz4yWEo7C17d/RXJfv8+79/UmAiG
	 FZn5irO98owURKhCVkvla1fo7tGGeWjLoDhxhnE73uT9v6EvshUNwO7O+EwF2JXJFRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QCfFe0qB;
	arc=none smtp.remote-ip=74.125.230.199
Received: from mail-qk2-f7.google.com (mail-qk2-f7.google.com [74.125.230.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D786606A32E
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 23:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D786606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QCfFe0qB
Received: by mail-qk2-f7.google.com with SMTP id d75a77b69052e-53603c3b973so9603341cf.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 15:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793835356; x=1794440156; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dmn1Q3/145xsrJD3bHMxFjskCeqjVe350pnKBSHlWz0=;
        b=QCfFe0qBmQEWIMxBRmhIJESzEXMTQSoq+aFcDSkZjQlnnySeD+t+HAOB1xIk7m06cn
         yFPucdbZAtUmUZpSI/AHhewWWBOXmxXLetSyEYwb1bwc0O7doH59dZ2k4T7NJpU6pmWw
         rWTnVkHDQOASvMcitMVWySFhNUFm+e+JsKJXMDsEOmtKRxAVy6ZPg8jL7FHdvIZwDWG4
         XKLu5t7fvHSStE6EURE0LGe/t+L7HZ53VpJTuftIwThFDxAqAe4OJfMjVJWRBQzp+Lrh
         X2QZz/pubB1C6SmuN/WEqhzGVgB0yVyS8G6n+MbXCGO8KWknc3/DK0Pxg0RgU3gTOHYI
         OvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793835356; x=1794440156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dmn1Q3/145xsrJD3bHMxFjskCeqjVe350pnKBSHlWz0=;
        b=pESh9zoma7UzZfdNxvCDHM23gyWZ/MkJfYa5Hoxj8/0zINn0NBw/4ctbVk8CWTRJQE
         7H/PZe4v3sI35FUeCowCvikV3u241hjvscDZeJJuj2j4LrLUv9A7qYR9HP9XIlaP2fBB
         zq7JXbDSG95OYG0ASmSZWjkJlKXL7x591m6DgHmS4mDU0/JQ9PygKAcRQ24wij+7R1px
         j/yrHLu4f+gnelTNqNLmPbZdShoPt7wIuwAjr85d2zIZuHFZWyk538QSWbGwhsXHghK9
         98hvG9E9FwvfOvcagPLgjlf+gsoJAwu3KOUw7DxwQywxkQu+BhyyUxOt5iLr4QKDj8N0
         fGFQ==
X-Gm-Message-State: APuU4Z/4Zb7/bAMeqAO0rgA8fbITDJN6r59Qu8xDD/It6KDk+XB/BGPX
	OaRYyRUNfuzgoDOh4tyBYPK0KQibu1RaxpcCTaa0571k3gxY2vhHbFpGmAPwZ6BHJPg=
X-Gm-Gg: AYBFou3C0KqW0JIbmfroOMijFGrYFyYgBK/hZHd8bT5fMpSDw041H0YJoZrrtSUkewH
	v8CDdLsSp2Xwz4v0HNuP+P3wJlD8rkcF13F5Ww6tpGsjGkgrK10Vs1VR9pX74PPqzi7s03zjmeU
	N8r/R0VXuliS05Y+igUyu77b4oYBSxyndGtcT2G6Set3F+8q1pDoD++Gz+qoqLTj0tcRCDjDjAA
	+awouncuYi8BmfOSRFP0Nrc7us/ffr2uQmDHq4bHhmrRIiU8F5GXm8RD6ImGY/jsqGuWgAlNx3W
	6odBTRFgQp73KIrihsM1nphYRBYNwtjiO9BULlDkLYjQVp1xLOIOslYqUDF9oMePsiLCE/rXpaa
	w5Na+idXwAp/lm1UEf4BI/5tyQR589zXDriLbaZ7w3B20Uxg1Ru976wUmd+bidtrsHWnAvQzcP1
	MaKGDpQKG+hjvuSumHcLyvgKRnccpZ1ydGpkPynWMvurr+hZjw3nrOvBmNuxZKS4uVtq/DMfLas
	FQ6mg+rSnm3B0OmU4byvP4y1OReqcFN2FxA0HOPbO7BRf4NasKlKwrl6eLkrga5yWEUhXnDSi8m
	Ij6Q+0WpMbp69G/7Pzp6ukRo/eemVETg4Q==
X-Received: by 2002:a05:622a:1aa9:b0:536:766f:271d with SMTP id d75a77b69052e-542b781f632mr306774901cf.51.1793835356393;
        Wed, 04 Nov 2026 15:35:56 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10a63462sm36858141cf.15.2026.11.04.15.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:35:56 -0800 (PST)
Message-ID: <2a1728c5-2856-41bb-9ffd-c80df4ffda6e@gmail.com>
Date: Wed, 4 Nov 2026 18:35:54 -0500
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
Subject: Re: [PATCH net-next v5 5/6] tls: send a KeyUpdate at the record limit
 and on request
To: sashiko-reviews@lists.linux.dev
Cc: John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, Chuck Lever <cel@kernel.org>,
 kernel-tls-handshake@lists.linux.dev, linux-nvme@lists.infradead.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20261103-keyupdate-rfc-v5-0-de1ab90a88d5@gmail.com>
 <20261103-keyupdate-rfc-v5-5-de1ab90a88d5@gmail.com>
 <sashiko-outbox-198141@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <sashiko-outbox-198141@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/4/26 16:43, sashiko-bot@kernel.org wrote:
 > > +   ret = tls_encrypt_async_wait(ctx);
 > > +   if (!ret)
 > > +           ret = tls_keyupdate_rekey(sk, 1);
 >
 > [Severity: Medium]
 > As reported by Sashiko on v4 [1], can tls_tx_key_update() ignore fatal
 > transmission errors and rotate the TX key anyway when 
tls_tx_records() fails
 > with -EPIPE or -ECONNRESET?

Yes, but this is not specific to KeyUpdate. After shutdown(SHUT_WR),
send() on a kTLS socket with no KeyUpdate also returns the full
length. I tested this with TLS 1.3 AES-GCM. As I read the code, the
KeyUpdate record then stays queued and TCP does not send it, so the
peer never sees a record with the next key.

This corrects my note in the v2 changes, "The next call reports the
error". In the same test, the next send() also returned success.

 > [Severity: High]
 > As reported by Sashiko on v4 [2], how is the KeyUpdate state in struct
 > tls_context synchronized when sk_stream_wait_memory() drops lock_sock(sk)
 > during a send or TLS_TX_KEY_UPDATE?

No change, for the reasons in the v4 changes. I checked these points
by reading the code.

Points 1 and 2 need a TLS_TX or TLS_RX setsockopt() during a blocked
sendmsg(), which is an application error.

Point 3: tx_key_update_reply stays set after the update_requested
KeyUpdate, so the reply still goes out before the next Application
Data record.

Point 4: a record that was already being written can go out before
the reply. RFC 9846 section 4.7.3 allows this for records in flight.

Martin
